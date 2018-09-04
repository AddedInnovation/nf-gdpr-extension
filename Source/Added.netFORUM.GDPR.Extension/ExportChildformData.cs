using Avectra.netForum.Common;
using Avectra.netForum.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Added.netFORUM.GDPR.Extension
{
    public class ExportChildformDataExtension
    {
        public virtual void Export_OnInit(PageClass page, Control control, string exportDataType)
        {
            Button btn = control as Button;

            //Determine if we're exporting json or xml
            ExportMode exportMode = ExportMode.JSON;
            if(String.Equals(exportDataType, "xml", StringComparison.InvariantCulture))
            {
                exportMode = ExportMode.XML;
            }
            
            //must force a full postback so that we are sending the file back on a valid Response stream
            ForceFullPostback(page, control);

            //TODO: Maybe some day do double-submit prevention
            //UtilityFunctions.DoubleSubmitPrevention(page, btn);

            //Wire up the click event to export the data from all childforms
            btn.Click += (s, e) =>
            {
                //Initialize the ExportService with the current page's form key and FacadeClass
                ExportService export = new ExportService(page.szFormKey, page.oFacadeObject, exportMode);

                //Get the Xml version of the data
                var xmlExport = export.GetDataXml();

                //Write the Xml data to the response stream in JSON or XML
                export.WriteFileToResponse(xmlExport, HttpContext.Current.Response, $"DataExport_{page.oFacadeObject.GetValue("cst_recno")}");
            };
        }

        protected virtual void ForceFullPostback(PageClass page, Control control)
        {
            ScriptManager scriptManager = ScriptManager.GetCurrent(page.oActualPage);
            if (scriptManager != null)
            {
                scriptManager.RegisterPostBackControl(control);
            }
        }
    }
}
