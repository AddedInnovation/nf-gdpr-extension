SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
GO
SET DATEFORMAT YMD
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
-- Pointer used for text / image updates. This might not be needed, but is declared here just in case
DECLARE @pv binary(16)


PRINT(N'Delete row from [dbo].[md_dynamic_profile_detail]')
DELETE FROM [dbo].[md_dynamic_profile_detail] WHERE [dpd_key] = 'dbc98603-25ca-4bff-b3da-55ddc1b1de3b'
COMMIT TRANSACTION
GO
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
GO
SET DATEFORMAT YMD
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
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
[sfl_cxa_mailing_label_html] AS [Mailing Label],
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
    FROM su_fulfillment WITH (NOLOCK) WHERE sfl_cst_key = {cst_key}', [dyc_allow_menu]=NULL, [dyc_change_user]=NULL, [dyc_change_date]=NULL WHERE [dyc_key] = 'ab483e11-5f02-4aff-96ed-4123b98aa11b'
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
adr_state] AS [State/Territory],
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
[adr_geography] AS [geography datatype]
    FROM co_address WITH (NOLOCK) WHERE adr_cst_key_owner = {cst_key}', [dyc_allow_menu]=NULL, [dyc_change_user]=NULL, [dyc_change_date]=NULL WHERE [dyc_key] = '4378f72e-1e5a-4cb9-be2d-ac61f6d57693'
PRINT(N'Operation applied to 2 rows out of 2')
COMMIT TRANSACTION
GO
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
GO
SET DATEFORMAT YMD
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
-- Pointer used for text / image updates. This might not be needed, but is declared here just in case
DECLARE @pv binary(16)


PRINT(N'Delete row from [dbo].[md_dynamic_form_extension]')
DELETE FROM [dbo].[md_dynamic_form_extension] WHERE [dyx_key] = '4aa823a2-dbcf-4212-bac9-4fb32b3aea87'
COMMIT TRANSACTION
GO
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
GO
SET DATEFORMAT YMD
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
-- Pointer used for text / image updates. This might not be needed, but is declared here just in case
DECLARE @pv binary(16)


PRINT(N'Delete rows from [dbo].[md_dynamic_form_control]')
DELETE FROM [dbo].[md_dynamic_form_control] WHERE [dys_key] = 'dc915d86-4264-46ed-83c6-5d834c596752'
DELETE FROM [dbo].[md_dynamic_form_control] WHERE [dys_key] = '1d61d621-3123-43ef-aef0-9b9b3455a0cd'
PRINT(N'Operation applied to 2 rows out of 2')
COMMIT TRANSACTION
GO
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
GO
SET DATEFORMAT YMD
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
-- Pointer used for text / image updates. This might not be needed, but is declared here just in case
DECLARE @pv binary(16)


PRINT(N'Update rows in [dbo].[md_dynamic_form]')
UPDATE [dbo].[md_dynamic_form] SET [dyn_has_extensions]=0, [dyn_change_user]=NULL, [dyn_change_date]=NULL WHERE [dyn_key] = 'ee5c039e-cf0f-4d0e-ba8a-84f9d1c6a986'
PRINT(N'Operation applied to 1 rows out of 2')
COMMIT TRANSACTION
GO
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
GO
SET DATEFORMAT YMD
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
-- Pointer used for text / image updates. This might not be needed, but is declared here just in case
DECLARE @pv binary(16)
COMMIT TRANSACTION
GO
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
GO
SET DATEFORMAT YMD
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
-- Pointer used for text / image updates. This might not be needed, but is declared here just in case
DECLARE @pv binary(16)
COMMIT TRANSACTION
GO
