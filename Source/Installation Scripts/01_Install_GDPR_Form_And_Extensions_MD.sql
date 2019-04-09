SET XACT_ABORT ON
GO
SET ARITHABORT ON
GO
BEGIN TRANSACTION
-- Pointer used for text / image updates. This might not be needed, but is declared here just in case
DECLARE @pv binary(16)
COMMIT TRANSACTION
GO
SET XACT_ABORT ON
GO
SET ARITHABORT ON
GO
BEGIN TRANSACTION
-- Pointer used for text / image updates. This might not be needed, but is declared here just in case
DECLARE @pv binary(16)
COMMIT TRANSACTION
GO
SET XACT_ABORT ON
GO
SET ARITHABORT ON
GO
BEGIN TRANSACTION
-- Pointer used for text / image updates. This might not be needed, but is declared here just in case
DECLARE @pv binary(16)


PRINT(N'Update rows in [dbo].[md_dynamic_form]')
UPDATE [dbo].[md_dynamic_form] SET [dyn_has_extensions]=1, [dyn_change_user]=N'AddedInnovation', [dyn_change_date]='2018-08-31 15:14:36.000' WHERE [dyn_key] = 'ee5c039e-cf0f-4d0e-ba8a-84f9d1c6a986'
PRINT(N'Operation applied to 1 rows out of 2')
COMMIT TRANSACTION
GO
SET XACT_ABORT ON
GO
SET ARITHABORT ON
GO
BEGIN TRANSACTION
-- Pointer used for text / image updates. This might not be needed, but is declared here just in case
DECLARE @pv binary(16)


PRINT(N'Add rows to [dbo].[md_dynamic_form_control]')
IF NOT EXISTS (SELECT 1 FROM [dbo].[md_dynamic_form_control] WHERE dys_key='dc915d86-4264-46ed-83c6-5d834c596752')
INSERT INTO [dbo].[md_dynamic_form_control] ([dys_key], [dys_dyn_key], [dys_control_name], [dys_control_class], [dys_readonly], [dys_readonly_control], [dys_conditional_control_class], [dys_conditional_control_class_operator], [dys_conditional_control_class_value], [dys_conditional_control_class_control], [dys_readonly_operator], [dys_readonly_value], [dys_readonlyedit], [dys_required], [dys_required_control], [dys_required_operator], [dys_required_value], [dys_invisible], [dys_invisible_control], [dys_invisible_operator], [dys_invisible_value], [dys_autopostback], [dys_invisible_for_add], [dys_value_from], [dys_value_column], [dys_value_text_column], [dys_value_where], [dys_value_where_add], [dys_value_orderby], [dys_dyp_key], [dys_cssclass], [dys_default_value], [dys_default_value_function], [dys_order], [dys_value], [dys_data], [dys_top], [dys_left], [dys_width], [dys_height], [dys_add_user], [dys_add_date], [dys_change_user], [dys_change_date], [dys_delete_flag], [dys_entity_key], [dys_row], [dys_col], [dys_preserve_width]) VALUES ('dc915d86-4264-46ed-83c6-5d834c596752', 'ee5c039e-cf0f-4d0e-ba8a-84f9d1c6a986', N'DesignArea', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -100, NULL, N'CellInfo[]', 6, 0, 507, 109, N'AddedInnovation', '2018-08-31 14:33:04.000', N'AddedInnovation', '2018-08-31 14:33:35.000', 0, NULL, NULL, NULL, 0)
IF NOT EXISTS (SELECT 1 FROM [dbo].[md_dynamic_form_control] WHERE dys_key='1d61d621-3123-43ef-aef0-9b9b3455a0cd')
INSERT INTO [dbo].[md_dynamic_form_control] ([dys_key], [dys_dyn_key], [dys_control_name], [dys_control_class], [dys_readonly], [dys_readonly_control], [dys_conditional_control_class], [dys_conditional_control_class_operator], [dys_conditional_control_class_value], [dys_conditional_control_class_control], [dys_readonly_operator], [dys_readonly_value], [dys_readonlyedit], [dys_required], [dys_required_control], [dys_required_operator], [dys_required_value], [dys_invisible], [dys_invisible_control], [dys_invisible_operator], [dys_invisible_value], [dys_autopostback], [dys_invisible_for_add], [dys_value_from], [dys_value_column], [dys_value_text_column], [dys_value_where], [dys_value_where_add], [dys_value_orderby], [dys_dyp_key], [dys_cssclass], [dys_default_value], [dys_default_value_function], [dys_order], [dys_value], [dys_data], [dys_top], [dys_left], [dys_width], [dys_height], [dys_add_user], [dys_add_date], [dys_change_user], [dys_change_date], [dys_delete_flag], [dys_entity_key], [dys_row], [dys_col], [dys_preserve_width]) VALUES ('1d61d621-3123-43ef-aef0-9b9b3455a0cd', 'ee5c039e-cf0f-4d0e-ba8a-84f9d1c6a986', N'AddedGDPRExportExtension', N'Button', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'DataFormButton', NULL, NULL, 1, N'Export GDPR Data', NULL, 16, 23, NULL, NULL, N'AddedInnovation', '2018-08-31 14:33:04.000', N'AddedInnovation', '2018-08-31 14:33:35.000', 0, NULL, NULL, NULL, 0)
PRINT(N'Operation applied to 2 rows out of 2')
COMMIT TRANSACTION
GO
SET XACT_ABORT ON
GO
SET ARITHABORT ON
GO
BEGIN TRANSACTION
-- Pointer used for text / image updates. This might not be needed, but is declared here just in case
DECLARE @pv binary(16)


PRINT(N'Add row to [dbo].[md_dynamic_form_extension]')
IF NOT EXISTS (SELECT 1 FROM [dbo].[md_dynamic_form_extension] WHERE dyx_key='4aa823a2-dbcf-4212-bac9-4fb32b3aea87')
INSERT INTO [dbo].[md_dynamic_form_extension] ([dyx_key], [dyx_dyn_key], [dyx_obj_key], [dyx_description], [dyx_order], [dyx_control_class], [dyx_control_id], [dyx_control_text], [dyx_control_tooltip], [dyx_cssclass], [dyx_on_edit_only], [dyx_place_by_control], [dyx_position], [dyx_object_assembly], [dyx_object_typename], [dyx_object_initialize_method], [dyx_object_initialize_parameters], [dyx_object_load_method], [dyx_object_load_parameters], [dyx_object_before_save_method], [dyx_object_before_save_parameters], [dyx_object_after_save_method], [dyx_object_after_save_parameters], [dyx_object_before_delete_method], [dyx_object_before_delete_parameters], [dyx_object_after_delete_method], [dyx_object_after_delete_parameters], [dyx_object_before_cancel_method], [dyx_object_before_cancel_parameters], [dyx_object_execute_method], [dyx_object_parameters], [dyx_data], [dyx_data_type], [dyx_html_onclick], [dyx_html_onkeypress], [dyx_value_from], [dyx_value_column], [dyx_value_text_column], [dyx_value_where], [dyx_value_orderby], [dyx_add_user], [dyx_add_date], [dyx_change_user], [dyx_change_date], [dyx_delete_flag], [dyx_entity_key]) VALUES ('4aa823a2-dbcf-4212-bac9-4fb32b3aea87', 'ee5c039e-cf0f-4d0e-ba8a-84f9d1c6a986', NULL, N'AddedGDPRExportExtension', 10, N'Button', N'AddedGDPRExportExtension', N'Export GDPR Data', NULL, NULL, NULL, NULL, NULL, N'Added.netFORUM.GDPR.Extension', N'Added.netFORUM.GDPR.Extension.ExportChildformDataExtension', N'Export_OnInit', N'Page:Page;Control:Control;String:json', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'AddedInnovation', '2018-08-31 14:29:06.000', N'AddedInnovation', '2018-08-31 16:42:57.000', 0, NULL)
COMMIT TRANSACTION
GO
SET XACT_ABORT ON
GO
SET ARITHABORT ON
GO
BEGIN TRANSACTION
-- Pointer used for text / image updates. This might not be needed, but is declared here just in case
DECLARE @pv binary(16)


PRINT(N'Update rows in [dbo].[md_dynamic_form_child]')
UPDATE [dbo].[md_dynamic_form_child] SET [dyc_sql]=N'SELECT

[sfl_delete_flag] AS [Delete Flag],

[sfl_ship_date] AS [Ship Date],

[sfl_ship_qty] AS [Shipped Quantity],

[sfl_cxa_mailing_label] AS [Mailing Label],

[sfl_cxa_mailing_label_html] AS [Mailing Label Html],

[sfl_back_issue_qty] AS [Back Order Quantity],

[sfl_grace_period_qty] AS [Grace Period Quantity],

[sfl_trm_demog4] AS [Demographics 4],

[sfl_trm_qualified_flag] AS [Qualified?],

[sfl_trm_demog5] AS [Demographics 5],

[sfl_adr_city] AS [City],

[sfl_adr_country] AS [Country],

[sfl_trm_qualified_date] AS [Qualified Date],

[sfl_adr_state] AS [State],

[sfl_trm_demog3] AS [Demographics 3],

[sfl_trm_demog2] AS [Demographics 2],

[sfl_trm_controlled_flag] AS [Controlled?],

[sfl_trm_requested_flag] AS [Requested?],

[sfl_trm_demog1] AS [Demographics 1],

[sfl_new_subscriber_flag] AS [New Subscriber],

[sfl_cst_ind_full_name_dn] AS [Subscriber Name],

[sfl_cst_ixo_title_dn] AS [Subscriber Title],

[sfl_cst_org_name_dn] AS [Subscriber Company Name],

[sfl_bpa_mailing_code] AS [BPA Mailing Code],

[sfl_qualified_status] AS [Qualified Status],

[sfl_sui_issue_number] AS [Issue Number],

[sfl_trm_number_fulfilled] AS [Number Fulfilled],

[sfl_adr_post_code] AS [Postal Code],

[sfl_ivd_price] AS [Price],

[sfl_export_flag] AS [Export Flag],

[sfl_bpa_region] AS [BPI Region],

[sfl_delivery_method] AS [Delivery Method],

[sfl_cst_recno] AS [Customer Record Number],

[sfl_sui_volume] AS [Volume],

[sfl_download_count] AS [Issue Download Count],

[sfl_eml_address_dn] AS [Email Address]

    FROM su_fulfillment WITH (NOLOCK) WHERE sfl_cst_key = {cst_key}', [dyc_allow_menu]=0, [dyc_change_user]=N'AddedInnovation', [dyc_change_date]='2018-08-21 11:26:29.000' WHERE [dyc_key] = 'ab483e11-5f02-4aff-96ed-4123b98aa11b'
UPDATE [dbo].[md_dynamic_form_child] SET [dyc_sql]=N'SELECT 

[adr_line1] AS [Address Line 1],

[adr_mailing_label] AS [Mailing Label],

[adr_state_senate] AS [State Senate],

[adr_county] AS [County],

[adr_intl_province] AS [International Province],

[adr_line2] AS [Address Line 2],

[adr_country] AS [Country],

[adr_cong_dist] AS [Congressional District],

[adr_latitude] AS [Latitude],

[adr_delete_flag] AS [Delete Flag],

[adr_mailing_label_html] AS [Mailing Label HTML],

[adr_longitude] AS [Longitude],

[adr_line3] AS [Address Line 3],

[adr_city] AS [City],

[adr_post_code] AS [Postal Code],

[adr_state] AS [State/Territory],

[adr_state_house] AS [State House],

[adr_city_state_code] AS [City, State, Post Code],

[adr_bad_address_flag] AS [Bad Address Flag],

[adr_metro_stat_area] AS [Metropolitan Statistical Area],

[adr_time_zone] AS [TimeZone],

[adr_delivery_point_code] AS [Delivery Point Code],

[adr_lacs] AS [LACS],

[adr_urbanization] AS [Urbanization],

[adr_carrier_route] AS [Carrier Route],

[adr_bar_code] AS [BarCode],

[adr_fips] AS [County FIPS Code],

[adr_no_validation_flag] AS [Do Not Validate],

[adr_attn] AS [Attention],

[adr_record_type_code] AS [Record Type],

CAST([adr_geography] AS varchar(MAX)) AS [geography datatype]

    FROM co_address WITH (NOLOCK) WHERE adr_cst_key_owner = {cst_key}', [dyc_allow_menu]=0, [dyc_change_user]=N'AddedInnovation', [dyc_change_date]='2018-08-21 11:32:09.000' WHERE [dyc_key] = '4378f72e-1e5a-4cb9-be2d-ac61f6d57693'
PRINT(N'Operation applied to 2 rows out of 2')
COMMIT TRANSACTION
GO
SET XACT_ABORT ON
GO
SET ARITHABORT ON
GO
BEGIN TRANSACTION
-- Pointer used for text / image updates. This might not be needed, but is declared here just in case
DECLARE @pv binary(16)


PRINT(N'Add row to [dbo].[md_dynamic_profile_detail]')
IF NOT EXISTS (SELECT 1 FROM [dbo].[md_dynamic_profile_detail] WHERE dpd_key='dbc98603-25ca-4bff-b3da-55ddc1b1de3b')
INSERT INTO [dbo].[md_dynamic_profile_detail] ([dpd_key], [dpd_dyn_key], [dpd_type], [dpd_row], [dpd_col], [dpd_col_order], [dpd_rowspan], [dpd_colspan], [dpd_content_form_key], [dpd_content_form_lookup_column], [dpd_dyp_key], [dpd_content_path], [dpd_content_file], [dpd_content_param], [dpd_content], [dpd_content_width], [dpd_content_height], [dpd_dyc_key], [dpd_rpt_key], [dpd_sql_visible], [dpd_gal_key], [dpd_title], [dpd_description], [dpd_add_user], [dpd_add_date], [dpd_change_date], [dpd_change_user], [dpd_delete_flag], [dpd_entity_key], [dpd_no_display_flag]) VALUES ('dbc98603-25ca-4bff-b3da-55ddc1b1de3b', 'ee5c039e-cf0f-4d0e-ba8a-84f9d1c6a986', N'Form', N'1', N'1', NULL, 1, 1, 'ee5c039e-cf0f-4d0e-ba8a-84f9d1c6a986', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, N'AddedInnovation', '2018-08-31 14:23:40.000', NULL, NULL, 0, NULL, 0)
COMMIT TRANSACTION
GO
