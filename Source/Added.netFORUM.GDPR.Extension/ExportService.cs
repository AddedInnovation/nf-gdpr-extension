using Avectra.netForum.Common;
using Avectra.netForum.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Web;
using System.Xml;
using System.Xml.Linq;

namespace Added.netFORUM.GDPR.Extension
{
    public class ExportService
    {
        string _formKey;
        FacadeClass _facadeObject;
        ExportMode _exportMode;

        public ExportService(string formKey, FacadeClass facadeObject, ExportMode exportMode)
        {
            _formKey = formKey;
            _facadeObject = facadeObject;
            _exportMode = exportMode;
        }
        public virtual XDocument GetDataXml()
        {
            string exportXmlSql = GetExportXmlSql();
            XDocument exportData = null;
            using (NfDbConnection conn = DataUtils.GetConnection())
            using (NfDbCommand cmd = conn.CreateCommand())
            {
                cmd.CommandText = exportXmlSql;
                cmd.CommandTimeout = Config.CommandTimeout;
                cmd.CommandType = System.Data.CommandType.Text;

                using (XmlReader reader = cmd.ExecuteXmlReader())
                {
                    exportData = XDocument.Load(reader);
                }
            }
            if (exportData != null)
            {
                CleanUpTableNames(exportData);
            }
            return exportData;
        }

        protected virtual void CleanUpTableNames(XDocument exportData)
        {
            foreach (XElement element in exportData.Root.Elements())
            {
                if (_exportMode == ExportMode.JSON)
                {
                    CleanTableName(element);
                }
                else
                {
                    foreach (XElement elementChild in element.Elements())
                    {
                        CleanTableName(elementChild);
                    }
                }
            }
        }



        private void CleanTableName(XElement element)
        {
            string tableNameSql = GetTableNameSql();
            using (NfDbConnection conn = DataUtils.GetConnection())
            using (var cmd = conn.CreateCommand())
            {
                cmd.CommandText = tableNameSql;
                cmd.CommandTimeout = Config.CommandTimeout;
                cmd.CommandType = System.Data.CommandType.Text;
                SqlParameter param = cmd.CreateParameter();
                param.DbType = System.Data.DbType.String;
                param.ParameterName = "@mdt_name";
                param.Value = element.Name.ToString();
                cmd.Parameters.Add(param);
                using (var rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        string tableDescription = rdr["mdt_description"].ToString();
                        if (!String.IsNullOrWhiteSpace(tableDescription))
                        {

                            element.Name = ToTitleCase(tableDescription).Replace(" ", "");
                        }
                    }
                }
            }
        }

        protected virtual string ToTitleCase(string tableDescription)
        {
            var lowerCase = tableDescription.ToLower();
            TextInfo info = CultureInfo.CurrentCulture.TextInfo;
            return info.ToTitleCase(lowerCase);
        }

        protected virtual string GetTableNameSql()
        {
            return $"SELECT TOP 1 mdt_description FROM md_table WHERE mdt_name = @mdt_name AND mdt_delete_flag = 0";
        }

        protected virtual string GetExportXmlSql()
        {
            List<ChildForm> childForms = GetChildForms();
            if (childForms.Count < 1)
            {
                return null;
            }
            StringBuilder exportXml = new StringBuilder();
            exportXml.Append("SELECT ");
            int counter = 1;
            foreach (ChildForm cf in childForms)
            {
                AppendSqlForChildForm(exportXml, counter, cf);
                counter++;
            }

            exportXml.Append(" FOR XML PATH(''), ROOT('GDPRDataExport')");
            return exportXml.ToString();
        }

        protected virtual void AppendSqlForChildForm(StringBuilder exportXml, int counter, ChildForm cf)
        {
            cf.Sql = RemoveWhitespaceInColumnName(cf.Sql);
            string parsedSql = DataUtils.ParseValues(_facadeObject, cf.Sql);
            StringBuilder xmlSql = new StringBuilder();
            xmlSql.Append(GetComma(counter));
            xmlSql.Append($"({parsedSql} FOR XML AUTO, ELEMENTS, TYPE{GetDetailRootNodeValue(cf)})");
            exportXml.Append(xmlSql);
        }

        protected virtual List<ChildForm> GetChildForms()
        {
            string childFormSql = GetChildFormSql();
            List<ChildForm> childForms = new List<ChildForm>();
            using (NfDbConnection conn = DataUtils.GetConnection())
            using (var cmd = conn.CreateCommand())
            {
                cmd.CommandText = childFormSql;
                cmd.CommandTimeout = Config.CommandTimeout;
                cmd.CommandType = System.Data.CommandType.Text;
                SqlParameter param = cmd.CreateParameter();
                param.DbType = System.Data.DbType.Guid;
                param.ParameterName = "@dyn_key";
                param.Value = Guid.Parse(_formKey);
                cmd.Parameters.Add(param);

                using (var rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        childForms.Add(GetChildFormFromReader(rdr));
                    }
                }
            }
            return childForms;
        }

        protected virtual string GetComma(int counter)
        {
            return counter > 1 ? "," : "";
        }

        protected virtual string GetDetailRootNodeValue(ChildForm cf)
        {
            string rootNodeValue = String.Empty;
            //For XML, you need an extra root node for each entity type. Creates a duplicate in JSON Mode
            if (_exportMode == ExportMode.XML)
            {
                rootNodeValue = $", ROOT('{FormatElementName(cf.Description)}Records')";
            }
            return rootNodeValue;
        }

        protected virtual string RemoveWhitespaceInColumnName(string sql)
        {
            Regex matcher = new Regex(GetRemoveCharactersRegex(), RegexOptions.ExplicitCapture | RegexOptions.Multiline | RegexOptions.IgnoreCase);
            while (matcher.IsMatch(sql))
            {
                sql = matcher.Replace(sql, String.Empty);
            }
            return sql;
        }

        protected virtual string GetRemoveCharactersRegex()
        {
            //Remove whitespace, apostrophes, question marks, forward-slashes, left parenthesis, right parenthesis, commas, hyphens in column names - shows up as crazy encoded attribute names in the encoded xml
            return @"(?<=([Aa]{1}[Ss]{1}\s*[\[]{1}[\w]*))[\s|\?|\'|/|(|\|,|\-)]+(?=.*])";
        }

        protected virtual string FormatElementName(string description)
        {
            return description.Replace(" ", "").Replace("GDPR", "");
        }

        protected virtual ChildForm GetChildFormFromReader(DbDataReader rdr)
        {
            return new ChildForm()
            {
                Key = rdr["dyc_key"].ToString(),
                Description = rdr["dyc_description"].ToString(),
                GridTitle = rdr["dyc_grid_title"].ToString(),
                Sql = rdr["dyc_sql"].ToString(),
            };
        }

        protected virtual string GetChildFormSql()
        {
            return "SELECT dyc_key, dyc_description, dyc_grid_title, dyc_sql FROM md_dynamic_form WITH (NOLOCK) JOIN md_dynamic_profile_detail WITH (NOLOCK) ON dyn_key = dpd_dyn_key JOIN md_dynamic_form_child WITH (NOLOCK) ON dpd_dyc_key = dyc_key WHERE dyn_key = 'EE5C039E-CF0F-4D0E-BA8A-84F9D1C6A986' AND dyn_delete_flag = 0 AND dpd_delete_flag = 0 AND dyc_delete_flag = 0 ORDER BY CAST(COALESCE(dpd_row,0) AS Int), dpd_key";
        }
        public virtual void WriteFileToResponse(XDocument dataExport, HttpResponse response, string filename)
        {
            response.Clear();

            string fileExtension;
            if (_exportMode == ExportMode.JSON)
            {
                response.ContentType = "text/json";
                fileExtension = "json";

            }
            else
            {
                response.ContentType = "text/xml";
                fileExtension = "xml";
            }
            response.AddHeader("content-disposition", $"attachment;filename={filename}_{string.Format("{0:MMddyyyy-HHmmss}", DateTime.UtcNow)}.{fileExtension}");
            string dataExportString = GetResponseStringFromXml(dataExport);
            using (StreamWriter writer = new StreamWriter(response.OutputStream, Encoding.UTF8))
            {
                writer.Write(dataExportString);
            }
            response.End();
        }

        protected virtual string GetResponseStringFromXml(XDocument dataExport)
        {
            if (_exportMode == ExportMode.JSON)
            {
                return GetJsonFromXDocument(dataExport);
            }
            else
            {
                return dataExport.ToString();
            }
        }

        public virtual string GetJsonFromXDocument(XDocument dataExport)
        {
            //calling SerializeXNode with Reflection so we don't have to deal with ever-changing Newtonsoft.Json versions
            string pathToDomain = AppDomain.CurrentDomain.BaseDirectory + "\\bin\\Newtonsoft.Json.dll";
            Assembly domainAssembly = Assembly.LoadFrom(pathToDomain);
            Type customerType = domainAssembly.GetType("Newtonsoft.Json.JsonConvert");
            MethodInfo staticMethodInfo = customerType.GetMethod("SerializeXNode", new[] { typeof(XDocument) });
            string jsonString = (string)staticMethodInfo.Invoke(null, new object[] { dataExport });
            return jsonString;
        }
    }
}
