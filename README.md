# nf-gdpr-extension
Added Innovation GDPR Extension to export all GDPR data in one click to JSON or XML.

Adds a button to the Individual "Data for GDPR Profile" form called "export gdpr data". When you click on the button, all of the data configured in the childforms below will be exported as JSON.

This form is accessible by navigating to any **Individual in iWeb**, Clicking on **Links*, then Clicking on **Data for GDPR** option.

## Install netFORUM Metadata
1. Execute *_MD.sql SQL Script in [Installation Scripts](/Source/Installation%20Scripts) in consecutive order. **Important: Do not run the scripts in the undo folder unless you are uninstalling extension**

## Install netFORUM Code
### Option 1: Download Compiled Release
1. Download [Latest Release](https://github.com/AddedInnovation/nf-gdpr-extension/releases)
1. Copy contents of release\bin to iWeb folder

### Option 2: Clone Repo and Compile Yourself
1. Download or Clone Repo
1. Build Added.netFORUM.GDPR.Extension Project
1. Copy Added.netFORUM.GDPR.Extension.dll to /iWeb/bin/ directory

## Extension Options
### Export as XML or JSON
You can optionally export your GDPR data as XML or JSON.
To configure this:
1. Navigate to the "Data for GDPR" profile form in iWeb
1. Navigate to the AddedGDPRExportExtension Form Extension
1. Edit the AddedGDPRExportExtension Form Extension
1. Update the 3rd Export_OnInit parameter to "xml" instead of "json" (do not include quotes).

A quick script for XML:
```sql
--Export to XML:
UPDATE [dbo].[md_dynamic_form_extension] SET [dyx_object_initialize_parameters] = N'Page:Page;Control:Control;String:xml' WHERE dyx_key = '4aa823a2-dbcf-4212-bac9-4fb32b3aea87'
```
A quick script for JSON:
```sql
--Export to JSON:
UPDATE [dbo].[md_dynamic_form_extension] SET [dyx_object_initialize_parameters] = N'Page:Page;Control:Control;String:json' WHERE dyx_key = '4aa823a2-dbcf-4212-bac9-4fb32b3aea87'
```
**Note: Make sure you clear cache after updating from JSON to XML or vice-versa. This may not be required for your installation**
