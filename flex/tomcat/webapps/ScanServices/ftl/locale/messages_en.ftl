<#-------------------------------------->
<#-------- Admin UI Messages ----------->
<#-------------------------------------->

<#-- StandAlone Menu -->
<#assign standalone_menu_title = "Scan Service Menu"/>
<#assign link_configBtnsLabel="Configure Buttons"/>
<#assign link_configBtnsTip="Add and configure Scan Service buttons for use on multifunction printers."/>
<#assign link_configDevicesLabel="Configure Devices"/>
<#assign link_configDevicesTip="Configure multifunction printers for use with DocuShare Scan Service and manage the buttons assigned to devices."/>
<#assign link_scanLogLabel="Scanning Log"/>
<#assign link_scanLogTip="View recent scan activity and download the log of all scan jobs."/>
<#assign link_logSettingsLabel="Server Log"/>
<#assign link_logSettingsTip="Change the server logging level and download the server log."/>
<#assign link_emailServiceLabel="Email Setup"/>
<#assign link_emailServiceTip="Configure the email service."/>
<#assign link_configureServerLabel="Server Setup" />
<#assign link_configureServerTip="Configure settings for the the DocuShare Scan Service server." />
<#assign link_autoFillProfileLabel = "Autofill Profiles"/>
<#assign link_autoFillProfileTip = "Use this page to add autofill profiles for document types. Add an autofill profile to have additional property values included with scanned documents based on property values users enter on the MFP touch screen."/>
<#assign link_dataSourceMenusLabel = "ODBC Menus"/>
<#assign link_dataSourceMenusTip = "Use this page to add ODBC menus. Add an ODBC menu to retrieve values from a data source that are used in a menu assigned to a DocuShare document property. You can add two kinds of menus: simple or dependent menu sets."/>
<#assign link_dataSourceDependentMenusLabel = "ODBC Dependent Menu Sets"/>
<#assign link_dataSourceDependentMenusTip = "Use this page to add an ODBC dependent menu set by linking one or more predefined ODBC menus."/>
<#assign link_heading_serverconfig = "Server Configuration"/>
<#assign link_heading_logs = "Logs"/>
<#assign link_heading_odbc = "ODBC Connectors"/>
<#assign link_heading_Emulator = "Device Emulator"/>
<#assign link_EmulatorTip = "Use this page to Emulate the device."/>
<#assign link_EmulatorLabel="Emulator"/>

<#-- Form validation general strings -->
<#assign validationErrorGeneralMsg="Please correct the errors below."/>
<#assign fieldErrorTitle="Error:"/>
<#assign fielderror_empty="This field cannot be empty."/>


<#-- Configure Buttons List Page -->
<#assign deleteAction_confirm="Are you sure you want to delete this button? This action cannot be undone.  Continue?"/>
<#assign deleteAction_error="Error: The button could not be deleted."/>
<#assign deleteAction_success="The button was successfully deleted."/>

<#assign configBtnPage_title="Configure Buttons"/>
<#assign configBtnPage_subtitle="Use this page to add and configure DocuShare Scan Service buttons for use on multifunction printers. To get started, add a new DocuShare Scan Service button. Then add child scan buttons and child folder buttons (to organize scan buttons) under the DocuShare Scan Service button."/>
<#assign link_addScanButtonLabel="New Scan Service Button&#8230;"/>
<#assign emptyBtnListMsg="No buttons are created yet."/>
<#assign link_emptyBtnListNewLink="Click here to create a new button."/>
<#assign listheading_button="Button"/>
<#assign listheading_type="Type"/>
<#assign listheading_access="Access"/>
<#assign listheading_actions="Actions"/>

<#assign buttonTip="View/edit button..."/>
<#assign btnTreeBtn_collapse_label="Collapse"/>
<#assign btnTreeBtn_expand_label="Expand"/>
<#assign btnTreeBtn_collapse_tooltip="Hide child button list."/>
<#assign btnTreeBtn_expand_tooltip="Show child button list."/>

<#assign btnType_service="DocuShare Scan Service Button"/>
<#assign btnType_folder="Folder Button"/>
<#assign btnType_scan="Scan Button"/>
<#assign groupAccessOnlyLabel="Group Access Only"/>
<#macro groupAccessOnlyTip handle>Restricted to DocuShare Group (${handle})</#macro>

<#assign action_addFolderBtnLabel="Add child folder button"/>
<#assign action_addFolderBtnTip="Add child folder button"/>
<#assign action_addScanBtnLabel="Add child scan button"/>
<#assign action_addScanBtnTip="Add child scan button"/>
<#assign action_editPropsBtnLabel="View/edit settings"/>
<#assign action_editPropsBtnTip="View/edit settings"/>
<#assign action_editPermissionsBtnLabel="Change permissions"/>
<#assign action_editPermissionsBtnTip="Change permissions"/>
<#assign action_deleteBtnLabel="Delete button"/>
<#assign action_deleteBtnTip="Delete button"/>
<#assign btn_expandtree_label="Expand All"/>
<#assign btn_expandtree_help="Show all child buttons."/>
<#assign btn_collapsetree_label="Collapse All"/>
<#assign btn_collapsetree_help="Hide all child buttons."/>
<#assign colhead_tip_accessLevel="Access Level (Guest or DocuShare Group)"/>
<#assign colhead_tip_scanType="Scan Type (DocuShare folder, network folder, or email)"/>
<#assign scantype_tip_DocuShare="Scan to DocuShare Folder"/>
<#assign scantype_tip_NetworkFolder="Scan to Network Folder"/>
<#assign scantype_tip_Email="Scan to Email"/>


<#-- Edit Button Settings, Edit Button Permissions, Add Buttons Pages -->
<#macro title_editsettings buttontypelabel buttonlabel>Edit ${buttontypelabel} Settings : <span class="quiet">${buttonlabel}</span></#macro>
<#assign subtitle_editsettings="Use this page to edit the button settings."/>
<#macro title_editpermissions buttontypelabel buttonlabel>Edit ${buttontypelabel} Permissions : <span class="quiet">${buttonlabel}</span></#macro>
<#assign subtitle_editpermissions="Use this page to control access to the button on the device."/>
<#macro title_add buttontypelabel>Add ${buttontypelabel}</#macro>
<#macro subtitle_add buttontypelabel>Use this page to add a new ${buttontypelabel}.</#macro>


<#macro fielderror_userHandleNotFound handle>The user with the handle <code>${handle}</code> is no longer on the site. Please select a different user.</#macro>
<#macro fielderror_groupHandleNotFound handle>The group with the handle <code>${handle}</code> is no longer on the site. Please select a different group.</#macro>
<#macro fielderror_CollectionHandleNotFound handle>The folder with the handle <code>${handle}</code> is no longer on the site. Please select a different folder.</#macro>
<#assign editbtn_formsubmit_success = "The button settings were successfully updated."/>
<#assign editbtn_formsubmit_error = "Error. The button updates could not be saved."/>

<#assign btn_apply="Apply"/>
<#assign btn_addButton="Add Button"/>
<#assign btn_deleteButton="Delete Button"/>
<#assign link_returnToButtonList="Return to the Button List Page"/>
<#assign btntitle_Scan="Scan Button"/>
<#assign btntitle_Service="Device Service Button"/>
<#assign btntitle_Folder="Folder Button"/>

<#assign scanOwner_title = "Button Owner"/>
<#assign scanOwner_description = "Select a DocuShare user as the scan button owner.  If the user is not currently authenticated with the scan services system, a password will be required."/>
<#assign scanSettings_title = "Scan Settings"/>
<#assign propLabel_ButtonLabel="Button Label:"/>
<#assign propHelp_ButtonLabel="The button name displayed on the device touch screen."/>

<#assign propLabel_ScanType = "Scan Type:"/>
<#assign propHelp_ScanType = "The type of destination in which to store scanned documents."/>
<#assign optionLabel_ScanType_DocuShare = "DocuShare Folder"/>
<#assign optionLabelHint_ScanType_DocuShare = "Sends scanned documents to a DocuShare folder."/>
<#assign optionLabel_ScanType_Folder = "Network Folder"/>
<#assign optionLabelHint_ScanType_Folder = "Sends scanned documents to a network folder."/>
<#assign optionLabel_ScanType_Email = "Email"/>
<#assign optionLabelHint_ScanType_Email = "Sends scanned documents to an email address."/>
<#assign optionLabel_ScanType_Email_ServerNotConfiguredLabel = "(Server not configured)"/>
<#assign optionLabel_ScanType_Email_ServerNotConfiguredTip = "The email server is not configured.  Go to the Email Setup page and make sure the email connection settings are correct."/>

<#assign propLabel_ScanToCollection="Scan to DocuShare Folder:"/>
<#assign propHelp_ScanToCollection="The destination Docushare folder for scanned documents."/>
<#assign propNote_ScanToCollection="Perform a search by typing a DocuShare Folder title. IMPORTANT NOTE: Only folders that the owner has write permission on will be returned."/>
<#assign noCollectionFoundPlaceholder="Please assign a button owner above before entering the folder."/>
<#assign propLabel_ScanToPerCollEnable="Scan to Personal Folder:"/>
<#assign propHelp_ScanToPerCollEnable="When checked, this option overrides the folder that is entered in the Scan to DocuShare Folder field, and scans documents to the DocuShare personal folder of the logged-in user. A guest user’s scanned documents are sent to the folder that is defined in the Scan to DocuShare Folder field."/>

<#assign propLabel_Owner="Owner:"/>
<#assign propHelp_Owner="The owner assigned to the scanned documents."/>
<#assign propNote_Owner>Perform a search by typing a user's username (e.g., <code>jdoe</code>). IMPORTANT NOTE: Only Coordinator level users should be used.</#assign>
<#assign propLabel_OwnerPassword="Owner Password:"/>
<#assign ownerAuthenticated_msg = "Owner authenticated"/>
<#assign ownerNotAuthenticated_msg = "Owner not authenticated.  Please type in a password and click the Authenticate Owner button."/>
<#assign btn_AuthenticateOwner_label="Authenticate Owner"/>
<#assign ownerNotFound_msg = "Owner not found in system.  Please try your search again."/>

<#assign propLabel_folderPath="Scan to Folder:"/>
<#assign propHelp_folderPath="The destination network folder for scanned documents."/>
<#assign propNote_folderPath>Type a network folder path using the UNC naming convention. (e.g., <code>\\server\share</code>)</#assign>
<#assign propLabel_folderUser="Folder Username:"/>
<#assign propHelp_folderUser="The username for the selected network folder."/>
<#assign propLabel_folderPassword="Folder Password:"/>
<#assign propHelp_folderPassword="The password for the selected network folder."/>
<#assign folderTestConnBtn_label="Test Connection"/>
<#assign folderTestConn_pleasewait = "Testing. Please wait..."/>
<#assign folderTestConnBtn_success="Connection successful!"/>
<#assign folderTestConnBtn_failure_authenticate="Login failure: unknown username or password."/>
<#assign folderTestConnBtn_failure_unknownDomain="Connection failure: Unknown domain."/>
<#assign folderTestConnBtn_failure_badNetworkPath="Connection failure: Network folder could not be found."/>
<#assign folderTestConnBtn_failure_others="Connection failure: Could not connect to the selected network folder."/>
<#assign propLabel_exportMeta = "Export Metadata:"/>
<#assign propNote_exportMeta = "Export selected metadata properties (in the property fields table below) as an xml file."/>
<#assign propLabel_browseCollection = "Browse Sub-folders at Scan Time:"/>
<#assign propNote_browseCollection = "Select to browse sub-folders on the device scan page. (Only for network folders or DocuShare folder scan types.)"/>
<#assign propLabel_defaultEmailAddress = "Email 'To:' Address:"/>
<#assign propNote_defaultEmailAddress = "The email address that the scan will be sent to.  If this is left blank, the logged-in user's email address will be used, if available."/>
<#assign propLabel_scanConfirmation = "Display Scan Confirmation:"/>
<#assign propNote_scanConfirmation = "Select to display a confirmation message on the device touch screen when the scanned document is stored in its defined location. Based on the document size and processing needed, it may take longer for a confirmation message to display."/>

<#assign propLabel_DefaultFormat="Default Format:"/>
<#assign propHelp_DefaultFormat="The default document file format."/>
<#assign optionLabel_DefaultFormat_pdf="Portable Document Format (PDF)"/>
<#assign optionLabelHint_DefaultFormat_pdf="Saves documents in PDF format."/>
<#assign optionLabel_PDF_A = "Portable Document Archive Format (PDF-A)"/>
<#assign optionLabelHint_PDF_A = "Saves documents in PDF-A format, an archive format that includes those PDF features ideal for long-term digital preservation. This option can be selected only if the device or DocuShare server supports it."/>
<#assign optionLabel_MRC_PDF = "High Compression (MRC) PDF" />
<#assign optionLabelHint_MRC_PDF = "Saves documents in highly compressed Mixed Raster Content (MRC) PDF format to create smaller, but lower quality, files. This option can be selected only if the device or DocuShare server supports it."/>
<#assign optionLabel_MRC_PDF_A = "High Compression (MRC) PDF-A"/>
<#assign optionLabelHint_MRC_PDF_A = "Saves documents in highly compressed Mixed Raster Content (MRC) PDF-A format to create smaller, but lower quality, files for long-term digital preservation. This option can be selected only if the device or DocuShare server supports it."/>

<#assign propLabel_DefaultOCR="Default OCR:"/>
<#assign propHelp_DefaultOCR="The default OCR (optical character recognition) setting."/>
<#assign optionLabel_DefaultOCR_imageonly="Image only"/>
<#assign optionLabelHint_DefaultOCR_imageonly="Converts a scan to an image-only document."/>

<#assign optionLabel_DefaultOCR_searchable="Searchable"/>
<#assign optionLabelHint_DefaultOCR_searchable="Converts a scan to a searchable text document."/>

<#assign optionLabel_DefaultOCR_searchableByServer="Searchable - converted by DocuShare"/>
<#assign optionLabelHint_DefaultOCR_searchableByServer="Converts a scan to a searchable text document using DocuShare's OCR software."/>
<#assign optionLabel_DefaultOCR_searchableByDevice="Searchable - converted by the device"/>
<#assign optionLabelHint_DefaultOCR_searchableByDevice="Converts a scan to a searchable text document using the multifunction printer's OCR software."/>

<#assign optionLabel_SEARCHABLE_IMAGE="Searchable"/>
<#assign optionLabel_IMAGE_ONLY="Image only"/>

<#assign propLabel_DefaultResolution="Default Resolution:"/>
<#assign propHelp_DefaultResolution="The default scan resolution."/>
<#assign optionLabel_DefaultResolution_300x300="High quality (300x300 dpi)"/>
<#assign optionLabelHint_DefaultResolution_300x300="High resolution scan"/>
<#assign optionLabel_DefaultResolution_200x200="Medium quality (200x200 dpi)"/>
<#assign optionLabelHint_DefaultResolution_200x200="Medium resolution scan"/>

<#assign propLabel_scanColor = "Default Scan Color:"/>
<#assign propHelp_scanColor = "The scan color setting of the document."/>
<#assign scanColorOption_AUTO ="Auto"/>
<#assign scanColorOption_FULL_COLOR ="Full Color"/>
<#assign scanColorOption_GRAYSCALE ="Grayscale"/>
<#assign scanColorOption_BLACK_AND_WHITE ="Black &amp; White"/>

<#assign propLabel_ScanOrientation="Scan Orientation:"/>
<#assign propHelp_ScanOrientation="The scan orientation of the document."/>
<#assign scanOrientationOption_Portrait="Portrait"/>
<#assign scanOrientationOption_Landscape="Landscape"/>
<#assign scanSizeOption_Auto="Auto"/>
<#assign scanSizeOption_Mixed="Mixed"/>

<#assign propLabel_ExportScanSettings="Export Scan Settings:"/>
<#assign propHelp_ExportScanSettings="Select to enable MFP users to change the OCR, File Format, Resolution, and Scan Color settings before scanning."/>

<#assign propLabel_MfpScanPage="Scan Page"/>
<#assign optionLabel_OneSided="1-Sided"/>
<#assign optionLabel_TwoSided="2-Sided"/>
<#assign optionLabel_SecondSideRotation="2-Sided, Rotate Side 2"/>

<#assign label_MfpScanSettings="Scan Settings..."/>
<#assign propLabel_MfpAdv_OCR="Scan OCR"/>
<#assign propLabel_MfpAdv_Format="Scan Format"/>
<#assign propLabel_MfpAdv_Resolution="Scan Resolution"/>
<#assign propLabel_MfpAdv_Color="Scan Color"/>
<#assign propLabel_MfpAdv_Orientation="Scan Orientation"/>
<#assign propLabel_MfpAdv_Size="Scan Paper Size"/>

<#assign networkfilenamesettings_title = "Filename Setup"/>
<#assign networkfilenamesettings_desc = "Provide a filename for scanned documents and optionally append additional information."/>
<#assign propLabel_networkfilename = "Filename"/>
<#assign propLabel_emailfilename = "Email Subject"/>
<#assign propLabelHint_networkfilename = "The base filename of scanned documents."/>

<#assign fieldsettings_title = "Document Property (Metadata) Setup"/>
<#assign fieldsettings_desc = "Select the document type to save scanned documents as and choose which property fields users can view and edit when scanning. Users cannot edit auto-generated property values."/>

<#assign fieldsettings_desc = "Select the document type and choose which property fields users can view and edit when scanning. Users cannot edit auto-generated property values."/>

<#assign fieldsettings_desc_networkfolder = "Select the document type and choose which property fields users can view and edit when scanning. Users cannot edit auto-generated property values. For network folder scans, the Title field value will be used as the document's filename.  Any other fields will be exported to an accompanying XML file if the 'Export Metadata' option is enabled."/>

<#assign fieldsettings_desc_email = "Select the document type and choose which property fields users can view and edit when scanning. Users cannot edit auto-generated property values. For email scans, the Title field value will be used as the email's attachment filename.  Any other fields will be exported to an attached XML file if the 'Export Metadata' option is enabled."/>


<#assign propLabel_doctype = "Document Type:"/>
<#assign propLabelHint_doctype = "The document type that each scan will be saved as."/>
<#assign doctype_change_confirm = "Are you sure you want to switch to another document type?  Doing so will remove your current field settings."/>
<#assign propLabel_autoFillProfile = "Autofill Profile:"/>
<#assign propLabelHint_autoFillProfile = "Choose a profile for this Document Type that specifies certain fields that once filled in at scan time will cause other property fields to automatically fill in with appropriate values from a specific data source."/>
<#assign optionLabel_autoFillProfile_noProfile ="No Profile"/>
<#assign afp_missingfields_error = "The following autofill profile field(s) must be added to the metadata fields table:"/>
<#assign dms_missingfields_error = "The following dependent menu set field(s) must be added to the metadata fields table:"/>
<#assign afp_mappedfield_defaultval_hint = "This field value is controlled by the autofill profile and cannot be manually edited. It is dynamically populated after the Required for Autofill fields have been filled in."/>

<#assign propLabel_propName="Field"/>
<#assign propLabelHint_propName="The property field to display to users when scanning. A field that requires a value is indicated with the text (Required) and cannot be removed."/>
<#assign propLabel_defaultValue="Default Value"/>
<#assign propLabelHint_defaultValue="The default value for the property field."/>

<#assign propLabel_displayOptions="Display Options"/>
<#assign propLabelHint_displayOptions="How to display the property field to users when scanning."/>
<#assign optionLabel_displayOptions_readonly="Read-only"/>
<#assign optionLabelHint_displayOptions_readonly="The field can be viewed at scan time, but not edited."/>
<#assign optionLabel_displayOptions_editable="Editable at scan time"/>
<#assign optionLabelHint_displayOptions_editable="The field can be edited at scan time."/>
<#assign optionLabel_displayOptions_editablerequired="Editable &amp; required at scan time"/>
<#assign optionLabelHint_displayOptions_editablerequired="The field can be edited and is required at scan time."/>
<#assign optionLabel_displayOptions_hidden="Hidden"/>
<#assign optionLabelHint_displayOptions_hidden="The field cannot be viewed or edited at scan time."/>

<#assign propLabel_AppendInfo="Append Information"/>
<#assign propLabelHint_AppendInfo_networkfile="Allows for appending additional information to the filename."/>
<#assign optionLabelHint_AppendInfo_networkfile_none="Does not append additional information to the filename."/>

<#assign propLabelHint_AppendInfo="Allows for appending additional information to the default value."/>
<#assign optionLabel_AppendInfo_none="No appended information"/>
<#assign optionLabelHint_AppendInfo_none="Does not append additional information to the default value."/>
<#assign optionLabel_AppendInfo_none_folder="Unique Id"/>
<#assign optionLabelHint_AppendInfo_none_folder="Adds a unique id string to the default value. (Network folder scans only)"/>
<#assign optionLabel_AppendInfo_timestamp="Timestamp"/>
<#assign optionLabelHint_AppendInfo_timestamp>Adds the date and time to the default value. Example: <code>ScanDoc-10.22.13</code></#assign>
<#assign optionLabel_AppendInfo_number="Incrementing number"/>
<#assign optionLabelHint_AppendInfo_number>Adds an auto-incrementing number to the default value. Example: <code>ScanDoc-00312</code></#assign>
<#assign optionLabel_AppendInfo_CurrentYear="Current year"/>
<#assign optionLabelHint_AppendInfo_CurrentYear="Adds the current year to the default value."/>
<#assign optionLabel_AppendInfo_CurrentMonth="Current month"/>
<#assign optionLabelHint_AppendInfo_CurrentMonth="Adds the current month to the default value."/>
<#assign optionLabel_AppendInfo_CurrentDayOfMonth="Current day of the month"/>
<#assign optionLabelHint_AppendInfo_CurrentDayOfMonth="Adds the current day of the month (e.g., 20) to the default value."/>
<#assign optionLabel_AppendInfo_CurrentDayOfWeek="Current day of the week"/>
<#assign optionLabelHint_AppendInfo_CurrentDayOfWeek="Adds the current weekday (e.g., Monday) to the default value."/>
<#assign optionLabel_AppendInfo_Username="Username"/>
<#assign optionLabelHint_AppendInfo_Username="Adds the username to the default value."/>
<#assign optionLabel_AppendInfo_Firstname="First name"/>
<#assign optionLabelHint_AppendInfo_Firstname="Adds the logged-in user's first name to the default value."/>
<#assign optionLabel_AppendInfo_Lastname="Last name"/>
<#assign optionLabelHint_AppendInfo_Lastname="Adds the logged-in user's last name to the default value."/>
<#assign optionLabel_AppendInfo_Fullname="Full name"/>
<#assign optionLabelHint_AppendInfo_Fullname="Adds the logged-in user's full name to the default value."/>

<#assign propLabel_appendLoc="Appended Location"/>
<#assign propLabelHint_appendLoc="Specifies the location of the appended information."/>
<#assign optionLabel_appendLoc_after="After default value"/>
<#assign optionLabelHint_appendLoc_after="Adds the appended information after the default value."/>
<#assign optionLabel_appendLoc_before="Before default value"/>
<#assign optionLabelHint_appendLoc_before="Adds the appended information before the default value."/>

<#assign optionLabel_appendLoc_networkfolder_after="After the filename"/>
<#assign optionLabelHint_appendLoc_networkfolder_after="Adds the appended information after the filename."/>
<#assign optionLabel_appendLoc_networkfolder_before="Before the filename"/>
<#assign optionLabelHint_appendLoc_networkfolder_before="Adds the appended information before the filename."/>
<#assign menuAgentLabel = "Use ODBC Menu:"/>
<#assign menuAgentTip = "Select a predefined menu whose values are retrieved from an ODBC data source."/>
<#assign menuAgent_none = "None Assigned"/>
<#assign odbcMenu_optgrouplabel_simplemenu = "ODBC Menus"/>
<#assign odbcMenu_optgrouplabel_dmsets = "Dependent Menu Sets"/>
<#assign autofillProfile_isMappedField = "This property is used by the selected autofill profile and is automatically filled in when one or more autofill profile required fields are populated."/>
<#assign autofillProfile_isMappedFieldRequired = "This property is used by the selected autofill profile and is required for autofilling mapped fields."/>
<#assign menuAgent_optionsRequestError = "Error: An error occurred attempting to retrieve the list of options from the data source."/>

<#assign fieldlist_requiredtag="(Required)"/>
<#assign btn_addfield="Add Field"/>
<#assign btn_removefield="Remove"/>

<#assign propLabel_accessMethod ="Access Level:"/>
<#assign propLabelHint_accessMethod ="The level of access to the button: Guest or a specific DocuShare group."/>
<#assign optionLabel_accessMethod_guest = "Guest"/>
<#assign optionLabelHint_accessMethod_guest = "Allows anyone to use this button."/>
<#assign optionLabel_accessMethod_group = "DocuShare Group"/>
<#assign optionLabelHint_accessMethod_group>Limits button access to users who are members of a specific DocuShare group (e.g., <code>Group-123</code>).</#assign>

<#assign optionLabel_inherit = "Inherit from Parent:"/>
<#assign optionLabelHint_inherit = "Use the parent button's group access setting."/>

<#assign optionLabel_specificgroup = "Select Group:"/>
<#assign optionLabelHint_specificgroup = "Choose a DocuShare group by typing its title (e.g., Marketing)."/>
<#assign fieldnote_usergroup = "Perform a search by typing a group title (e.g., Marketing)."/>

<#assign subFolderSection_title = "Sub-Folder Setup"/>
<#assign subFolderSection_subtitle = "Specify how to auto-generate sub-folders. Select the properties from the menus below to use to title each sub-folder. The actual title of each sub-folder is derived from the property values entered when scanning."/>

<#assign subFolderCollectionLabel_none = "Choose a Root Folder..."/>
<#assign subFolderOptgroup_label_reqfield = "Required Properties"/>
<#assign subFolderOptgroup_label_optionalfield = "Optional Properties"/>
<#assign subFolderOptgroup_label_userdata = "Scanning User Properties"/>
<#assign subFolderOptgroup_label_datadata = "Date Properties"/>
<#assign subFolderSelectOption_label_none = "None"/>

<#assign subFolderSelectOption_label_day = "Current Day"/>
<#assign subFolderSelectOption_label_week = "Current Weekday"/>
<#assign subFolderSelectOption_label_month = "Current Month"/>
<#assign subFolderSelectOption_label_year = "Current Year"/>

<#assign subFolderSelectOption_label_username = "Username"/>
<#assign subFolderSelectOption_label_lname = "Last Name"/>
<#assign subFolderSelectOption_label_fname = "First Name"/>
<#assign subFolderSelectOption_label_fullname = "Full Name"/>
<#assign propRequiredbySubFolder ="(Required by Sub-Folder Setup)"/>

<#assign propRequiredbyAFP = "(Required for Autofill)"/>

<#assign svcbtnicon_label = "Button Icon:"/>
<#assign svcbtnicon_hint = "The icon displayed on the button. Use the default icon or choose a different icon."/>
<#assign btn_editicon_label = "Edit Icon..."/>
<#assign btn_customizeicon_label = "Customize..."/>
<#assign customizeicon_dialog_title = "Customize Button Icon"/>
<#assign customizeicon_newval_uploadicon = "Uploading a new icon:"/>
<#assign customizeicon_newval_default = "Using the default icon:"/>
<#assign customizeicon_newval_useexisting = "Using an existing icon:"/>

<#assign editsvcbtndialog_title = "Edit Button Icon"/>
<#assign editsvcbtndialog_subtitle = "Use the default icon, upload an image file, or select an existing icon on the server."/>
<#assign icon_upload_label = "Upload a new icon:"/>
<#assign icon_upload_visiblehint>Select any web-viewable image file format: <code>.gif</code>,<code>.png</code>, or<code>.jpg</code>.  Maximum size is 128x128 pixels.</#assign>
<#assign icon_filetypein_label = "Select an existing icon:"/>
<#assign icon_resetdefault_label = "Use the default icon:"/>
<#assign icon_resetdefault_hint = "Use the default button icon."/>
<#assign icon_update_success = "The button icon was successfully updated."/>
<#assign icon_update_failure = "Error: The button icon could not be updated."/>
<#assign editsvcbtndialog_subtitle_noexistingicons = "No existing icons were found on the server."/>


<#-- Configure Devices Page -->
<#assign btn_cancelLabel = "Cancel"/>
<#assign btn_closeTip = "Close"/>

<#assign action_viewDeviceLabel="Edit device settings&#8230;"/>
<#assign action_viewDeviceTip="Edit device settings"/>

<#assign action_reassignButtonsFailureMsg="Error: Some devices did not have their buttons reassigned."/>
<#assign action_reassignButtonsSuccessMsg="The button assignments for the selected devices were successfully updated."/>
<#assign action_deleteSingleDeviceLabel="Remove this device from the list"/>
<#assign action_deleteSingleDeviceTip="Remove device"/>
<#assign action_deleteSingleDeviceConfirmMsg="Are you sure you want to delete this device? This cannot be undone."/>
<#assign action_deleteSingleDeviceSuccessMsg="The device was successfully deleted."/>
<#assign action_deleteSingleDeviceFailureMsg="Error: Device could not be deleted."/>

<#assign action_deleteMultiDeviceConfirmMsg="Are you sure you want to delete the selected devices?  This cannot undone."/>
<#assign action_deleteMultiDeviceSuccessMsg="The selected devices were successfully deleted."/>
<#assign action_deleteMultiDeviceFailureMsg="Error: The selected device(s) could not be deleted."/>

<#assign configDevices_title = "Configure Devices"/>
<#assign configDevices_subtitle = "Use this page to configure multifunction printers for use with the DocuShare Scan Service and manage the buttons assigned to devices."/>
<#assign btn_reassignBtnsLabel = "Assign/Unassign Buttons to Selected Devices&#8230;"/>
<#assign btn_reassignBtnsTip = "Assign/Unassign buttons to the selected devices."/>
<#assign btn_deleteSelDevices = "Delete Selected&#8230;"/>
<#assign btn_registerDevice = "Add New Device&#8230;"/>
<#assign btn_importDevices = "Import Devices from CSV File&#8230;"/>
<#assign devicetable_cbx_selectAll_tip = "Select/deselect all devices."/>
<#assign devicetable_colLabel_name = "Device Name"/>
<#assign devicetable_colLabel_address = "Host/IP Address"/>
<#assign devicetable_colLabel_buttons = "Scan Service Buttons"/>
<#assign devicetable_colLabel_actions = "Actions"/>
<#assign devicetable_deviceLabel_tip = "Edit device settings"/>
<#assign devicetable_nobuttonsassigned = "No buttons assigned."/>
<#assign devicetable_emptytablemsg = "No multifunction printers are registered yet."/>
<#assign devicetable_emptytablemsg_registerlinklabel = "Click here to add a new device."/>
<#assign devicetable_deviceBehindFirewallTip = "This device is behind a firewall"/>
<#assign devicetable_deviceBehindFirewallColHeadingTip = "Is device behind a firewall?"/>

<#assign btn_updateAssignmentsLabel = "Update Assignments"/>
<#assign editSelectedBtns_dialogtitle = "Edit Scan Service Buttons on the Selected Devices"/>
<#assign editSelectedBtns_dialogsubtitle = "Assign/Unassign Scan Service buttons to the selected devices. Doing this will override the list of currently assigned buttons for each device. Unchecking a button will remove it from all selected devices."/>
<#assign link_configurebuttons_label="Configure Buttons page" />
<#macro nobuttonsinsystemmsg link>No buttons have been added.  Go to the ${link} to add buttons.</#macro>

<#assign btn_importCSVLabel = "Import"/>
<#assign importDialog_title="Import Devices from a CSV File"/>
<#assign importDialog_subtitle="Browse and select a CSV file that contains the list of multifunction printers that you want to add with the DocuShare Scan Service."/>
<#assign importCSV_error="An error occurred importing the CSV file."/>

<#assign failedBtnReassignDialogTitle = "Failed Button Reassignments"/>
<#assign failedBtnReassignDialogSubtitle = "An error occurred when trying to update the button assignments on the following devices:"/>
<#assign failedBtnReassignDialog_idcolLabel = "ID"/>


<#-- Edit / Add Device Page -->
<#assign editDevicePage_title="Edit Device Settings:"/>
<#assign editDevicePage_subtitle1="Change the device information."/>
<#assign editDevicePage_subtitle2="Change the DocuShare Scan Service buttons assigned to the device."/>

<#assign addDevicePage_title="Add a New Device"/>
<#assign addDevicePage_subtitle1="Enter the device information."/>
<#assign addDevicePage_subtitle2="Assign Scan Service buttons to the device."/>

<#assign addDevice_successMsg="New device has been registered."/>
<#assign addDevice_errorMsg="Error: The device could not be registered."/>
<#assign editDevice_successMsg="Device settings updated"/>
<#assign editDevice_errorMsg="Error: Device updates could not be saved."/>

<#assign deviceLabel_label="Device Label:"/>
<#assign deviceLabel_tip="The friendly name for the Xerox multifunction printer."/>

<#assign deviceAddress_label="Device IP/Hostname:"/>
<#assign deviceAddress_tip="The network address (IP Address or DNS hostname) of the Xerox multifunction printer."/>

<#assign deviceUsername_label="Device Username:"/>
<#assign deviceUsername_tip="The administrator username for the Xerox multifunction printer."/>

<#assign devicePassword_label="Device Password:"/>
<#assign devicePassword_tip="The administrator password for the Xerox multifunction printer."/>

<#assign deviceBehindFirewall_label="Device Behind Firewall?:"/>
<#assign deviceBehindFirewall_tip="Check if the device is behind a corporate firewall and the Scan Service and DocuShare servers are outside it."/>

<#assign serviceBtnSectionTitle="Scan Service Buttons"/>

<#assign advancedBtn="Show Advanced Settings &#8250;"/>
<#assign advancedBtn_hide="&#8249; Hide Advanced Settings"/>
<#assign server_ip_label="Alternate Scan Service Server IP/Hostname:"/>
<#assign server_ip_tip="If the multifunction printer cannot connect to the default Scan Service server IP/Hostname (possibly because it is connected via a VPN tunnel with a NAT address), then enter an alternate IP/Hostname."/>
<#assign server_defaultNameLabel="Default Scan Service Server IP/Hostname:"/>
<#assign defaultServerTxt="(Default)"/>

<#assign editDevicePage_btn_applyLabel="Apply"/>
<#assign editDevicePage_btn_addLabel="Add"/>
<#assign editDevicePage_btn_deleteButtonLabel="Delete Device"/>
<#assign editDevicePage_link_returnToDeviceListLabel="&#8592; Return to the Device List Page"/>


<#--Scanning Log Page -->
<#assign scanningLog_title ="Scanning Log"/>
<#assign scanningLog_subtitle ="Use this page to view recent scan activity and to download the log of all scan jobs."/>
<#assign scanningLog_retrieveErrorMsg="Error: Could not retrieve the Scanning Log."/>
<#assign btn_downloadLogLabel = "Download Scanning Log as CSV File&#8230;"/>

<#assign logTable_colLabel_date="Scan Date"/>
<#assign logTable_colLabel_destination="Scan Destination"/>
<#assign logTable_colLabel_device="Scanning Device"/>
<#assign logTable_colLabel_button="Button"/>
<#assign logTable_colLabel_username="Username"/>
<#assign logTable_colLabel_status="Status"/>

<#assign logLoadingMsg="Loading scanning log&#8230;"/>
<#assign logEmptyMsg="Scanning Log is empty."/>
<#assign logpagesize_label = "Page Size:"/>
<#assign logpagesize_help = "The maximum number of scan jobs to display on the page."/>
<#assign logfilesize_label = "Log Size:"/>
<#assign logfilesize_help = "The maximum number of scan jobs to store in a single log file. Change this setting when first configuring the DocuShare Scan Service."/>
<#assign btn_updateLogfilesize_label = "Update"/>
<#assign updateLogFileSize_error = "An error occurred updating the Scanning Log file size."/>
<#assign updateLogFileSize_success = "The Scanning Log file size was successfully updated."/>
<#assign status_succeeded = "Succeeded"/>
<#assign status_failed = "Failed"/>

<#-- Server Log Page -->
<#assign serverLogPage_title = "Server Log"/>
<#assign serverLogPage_subtitle = "Use this page to change the server logging level and to download the Server Log."/>
<#assign loglevel_label="Logging Level"/>
<#assign logLevel_tip="The type of logging information you want the server to record. Logging levels are listed in decreasing order of severity with the information recorded equal or more severe than the selected logging level. For example, the TRACE level records information for all levels, whereas WARN only records WARN, ERROR, and FATAL information."/>
<#assign btn_logDownloadLabel="Download Log File&#8230;"/>

<#-- Email Service Page -->
<#assign EmailServicePage_title = "Email Setup"/>
<#assign EmailServicePage_subtitle = "Use this page to set up an email server to enable adding scan to email buttons."/>
<#assign EmailSetup_serverSectionLabel = "Outgoing Email Server Settings"/>
<#assign EmailSetup_servernameLabel = "Server Name / Address:"/>
<#assign EmailSetup_servernameTip = "The domain name or IP address of the email server."/>
<#assign EmailSetup_protocolLabel = "Protocol:"/>
<#assign EmailSetup_protocolTip = "The outgoing email server protocol. Values are SMTP (default), SMTP-TLS, SMTP-SSL."/>
<#assign EmailSetup_portLabel = "Port:"/>
<#assign EmailSetup_portTip = "The outgoing email server port number. The default for each protocol is SMTP:25, SMTP-TLS:250, SMTP-SSL:2500."/>
<#assign EmailSetup_emailUsernameLabel = "Username:"/>
<#assign EmailSetup_emailUsernameTip = "The username of the account authorized for sending email via the outgoing email server."/>
<#assign EmailSetup_passwordLabel = "Password:"/>
<#assign EmailSetup_passwordTip = "The password for the specified user account."/>
<#assign EmailSetup_messageSectionLabel = "Scan to Email Message Settings"/>
<#assign EmailSetup_defaultFromAddressLabel = "Default 'From:' Address:"/>
<#assign EmailSetup_defaultFromAddressTip = "The email address that displays in the From field for all outgoing emails sent by the DocuShare Scan Service."/>
<#assign EmailSetup_defaultFromAddressExample = "Example: scan-services-scan@mycompany.com"/>
<#assign EmailSetup_subjectLabel = "Default Email Subject:"/>
<#assign EmailSetup_subjectTip = "The default subject line for all outgoing emails sent by the DocuShare Scan Service if a button does not specify a subject."/>
<#assign EmailSetup_subjectExample = "Example: New Scan Document from the DocuShare Scan Service"/>
<#assign EmailSetup_bodyLabel = "Email Body:"/>
<#assign EmailSetup_bodyTip = "The email body for all outgoing emails sent by the DocuShare Scan Service."/>
<#assign EmailSetup_bodyExample = "Example: &ldquo;A new scanned document from the DocuShare Scan Service has been sent to you&rdquo;'"/>
<#assign EmailSetup_isHTML_label = "Use HTML for Body:"/>
<#assign EmailSetup_isHTML_tip = "Check to allow use of HTML tags in the email body."/>
<#assign EmailSetup_advancedSectionLabel = "Advanced Settings"/>
<#assign EmailSetup_timeoutLabel = "Timeout:"/>
<#assign EmailSetup_timeoutTip = "Amount of time, in milliseconds, to stop trying to send email or connect to the server. The default is 30000 ms."/>
<#assign EmailSetup_sslcertkeystoreLabel = "SSL Certificate Keystore File:"/>
<#assign EmailSetup_sslcertkeystoreTip = "The location of the SSL keystore file on the server file system.  This is required if the email server protocol is set to SMTP-SSL or SMTP-TLS. This may not be required for some server accounts such as Google or Yahoo that have domains that are trusted and registered from Java trusted store."/>
<#assign EmailSetup_sslcertkeystorePassLabel = "SSL Certificate Keystore File Password:"/>
<#assign EmailSetup_sslcertkeystorePassTip = "Password for the keystore file."/>
<#assign EmailServicePage_formsubmit_success = "The email settings have been successfully saved."/>
<#assign EmailServicePage_formsubmit_error = "An error occurred trying to save your email settings."/>

<#assign EmailServicePage_SendTestEmail_btnLabel = "Send Test Email..."/>
<#assign EmailSetup_testConnectionWait = "Sending email. Please wait..."/>
<#assign EmailSetup_testConnectionFailure = "Error: There was an error connecting to the email server.  Check your settings and try again."/>
<#assign EmailSetup_testConnectionSuccess = "The email was successfully sent by the server.  Check your test email's inbox to see if the message successfully arrived. If it has, make sure to click Apply if you made any setting changes."/>
<#assign EmailSetup_testConnection_dialog_title ="Send a Test Email"/>
<#assign EmailSetup_testConnection_dialog_subtitle ="Test your settings by sending an email."/>
<#assign EmailSetup_testConnection_emaillabel ="Test Email:"/>
<#assign EmailSetup_testConnection_emailtip ="The destination email address to use to test your settings."/>

<#-- Server Setup Page -->
<#assign ServerSetupPage_title = "Server Setup"/>
<#assign ServerSetupPage_subtitle = "Use this page to set up the server for use with the DocuShare Scan Service."/>
<#assign ServerSetupPage_subtitle2 = "If you need to change any of the server settings after devices are registered, it is recommended that you remove the buttons assigned to the devices before making the changes."/>
<#assign ServerSetupPage_subtitle3 = "You can change the firewall password at any time without re-registering devices."/>
<#assign ServerSetup_nameLabel = "Server Name / Address:"/>
<#assign ServerSetup_nameTip = "The domain name or IP address of the server."/>
<#assign ServerSetup_protocolLabel = "Protocol:"/>
<#assign ServerSetup_prototolTip = "The transfer protocol (e.g., http, https)."/>
<#assign ServerSetup_portLabel = "Port:"/>
<#assign ServerSetup_portTip = "The server port (e.g., 8000)."/>
<#assign ServerSetup_passwordLabel = "Device Update Utility Password:"/>
<#assign ServerSetup_passwordTip = "The password needed to access the update utility that is used to reconfigure devices. Provide this password to the person who is authorized to administer the MFPs so the devices can be enabled for use with the firewall."/>
<#assign ServerSetup_domainLabel = "DocuShare Domain:"/>
<#assign ServerSetup_domainTip = "The user/group domain in DocuShare."/>
<#assign ServerSetup_firewallPasscodeSubtitle = "To enable devices behind a firewall to connect to the DocuShare Scan Service server, the devices must be configured using the Device Update Utility. Provide the Device Update Utility Password and Download URL to the person who is authorized to administer the devices behind the firewall. The password is needed to access the update utility. If you change the server settings or register/unregister a device that is behind a firewall, you will need to provide the Device Update Utility Password and Download URL again so the utility can be re-run. <p>Before providing the utility, make sure you have registered at least one device behind the firewall and assigned a button to it. Otherwise, the person authorized to administer the devices will not be able to access the utility.</p>"/>
<#assign ServerSetup_registerDeviceBehindFirewallURLLabel = "Device Update Utility Download URL:"/>
<#assign ServerSetup_registerDeviceBehindFirewallURLTip = "The location of the web page from which the person who is authorized to administer the MFPs downloads a self-executing utility file for configuring the devices."/>
<#assign ServerSetup_registerDeviceBehindFirewallURLEndNote = "Copy this URL by selecting it and pressing Ctrl-C (Cmd-C on a Mac) and include it in an email."/>
<#macro devicesRegisteredEditWarning deviceNum> <strong>Note:</strong> ${deviceNum} device(s) have already been registered using these settings. If you change the settings, these devices will no longer connect to the DocuShare Scan Service server. First unassign the buttons for each device and then return to this page to change the server settings.</#macro>
<#assign editServerSettingsWhileRegisteredBtnLabel = "Edit Anyway"/>
<#assign ServerSetup_ServerSettingsSectionLabel = "Server Settings"/>
<#assign ServerSetup_FirewallPasscodeSectionLabel = "Firewall Settings"/>
<#assign ServerSetup_formsubmit_success = "The server settings have been successfully saved."/>
<#assign ServerSetup_formsubmit_error = "An error occurred trying to save your server settings."/>

<#assign ServerSetup_buttonSettings = "Scan Button Settings"/>
<#assign ServerSetup_dateFormatLabel = "Date Format"/>
<#assign ServerSetup_dateFormatHelp = "The date format to use when any scan button includes a date property field. The date format setting is not used for string properties."/>
<#assign ServerSetup_dateFormatMonthFirst = "mm/dd/yyyy"/>
<#assign ServerSetup_dateFormatDayFirst = "dd/mm/yyyy"/>
<#assign ServerSetup_dateFormatYearFirst = "yyyy-mm-dd"/>
<#assign ServerSetup_dateFormatYearFirst2 = "yyyymmdd"/>

<#assign ServerSetup_xeroxAppGallery = "Xerox&#174; App Gallery"/>
<#assign ServerSetup_xeroxAppGallerySubtitle = "The Xerox&#174; App Gallery provides DocuShare Scan Service apps to extend the capabilities of your DocuShare Scan Service-enabled MFPs. The Xerox&#174; Scanning App for DocuShare enables DocuShare users to scan documents to their personal folders. <p>Enabling usage of the app adds a DocuShare Scan Service button called Scan to DocuShare App and a Personal Folder scan button to the Button List page. Disabling the app, removes the buttons from the page. If the app is used on an MFP that you did not configure, then one of your licensed MFP connections is used.</p>"/>
<#assign ServerSetup_xeroxAppGalleryEnable = "Enable Scanning App for DocuShare"/>
<#assign ServerSetup_xeroxAppGalleryEnableHelp = "Check to allow usage of the DocuShare Scan Service Application, which lets DocuShare users scan documents to their personal folders."/>

<#-- Common dbAgent Page Messages. -->
<#assign dsConnectionProgress="Establishing connection.  Please wait&hellip;"/>
<#assign dsProperty_noMapping = "None"/>
<#assign dsWizard_next = "Next &#8250;"/>
<#assign dsWizard_back = "&#8249; Back"/>
<#assign dbsmPage_delete_btn_label = "Delete Menu"/>
<#assign dbsmPage_apply_btn_label = "Apply"/>
<#assign dbsmPage_return_to_listing_page = "&#8592; Return to the ODBC Menus List Page"/>
<#assign dataSourceTable_col_actions = "Actions" />
<#assign dataSourceTable_action_Edit_label = "Edit"/>
<#assign dataSourceTable_action_Delete_label = "Delete"/>
<#assign dsAssignedButtons = "Assigned Buttons:" />
<#assign dsAssignedDMS = "Assigned Dependent Menu Sets:" />
<#assign dsColumnLookupError = "Failed to load the data source columns."/>
<#assign dsConnectionError = "Failed to connect to the data source.  Please check your connection settings and try again."/>
<#assign dsObjPropsRequiredLookupError = "Could not load optional properties for the selected document type."/>
<#assign dsObjPropsOptionalLookupError = "Could not load required properties for the selected document type."/>
<#assign dbsmNoIllegalCharsError = "These characters are not allowed:"/>
<#assign datasource_prop_mapping_restricted = "Why can't I edit this?"/>
<#assign datasource_prop_mapping_restricted_delete = "Why can't I delete?"/>
<#assign datasource_restricted_modify = "Why can't I apply or delete?"/>

<#-- Autofill Profiles Listing Page -->
<#assign AutoFillProfilePage_title = "Autofill Profiles"/>
<#assign AutoFillProfilePage_subtitle = "Use this page to add autofill profiles for document types. When using an autofill profile with a scan button, additional property values are stored with scanned documents based on property values users enter on the MFP touch screen."/>
<#assign btnLabel_AddAutofillProfile = "Add Autofill Profile..."/>
<#assign btnLabel_DeleteSelAutofillProfiles = "Delete Selected"/>
<#assign autofillTable_col_name = "Profile Name" />
<#assign autofillTable_col_datasource = "ODBC Type &amp; Location" />
<#assign autofillTable_col_mapping = "Column &rarr; Property Mapping"/>
<#assign autofillTable_col_tablename = "Table/Worksheet" />
<#assign autofillTable_col_doctype = "Document Type" />
<#assign autofillTable_col_actions = "Actions" />
<#assign autofillTable_col_buttonsUsing = "Scan Button Assignments"/>
<#assign action_deleteAFPConfirmMsg = "Are you sure you want to delete the selected profiles?" />
<#assign action_deleteAFPSuccessMsg = "Profiles successfully deleted." />
<#assign action_deleteAFPFailureMsg = "An error occurred deleting the selected profiles." />
<#assign action_deleteAFPMappedFailureMsg = "Error: Cannot delete one or more of the selected profiles because they are currently being used on scan buttons." />
<#assign useforAutofillTip = "Use this property field for auto-filling all other mapped fields."/>
<#assign autofillTable_noAssignedButtons = "None"/>
<#assign autofillTable_noProfiles = "No autofill profiles have been set up. Click the 'Add Autofill Profile' button above to create a new one."/>
<#assign autofillTable_action_DeleteDisabled = "You cannot delete this autofill profile because it is used by one or more scan buttons.  Remove its use on each Edit Button Settings page before deleting."/>

<#-- Autofill Profile Add/Edit Page -->
<#assign AutoFillProfilePage_add_title = "Add Autofill Profile" />
<#assign AutoFillProfilePage_add_subtitle = "To add an autofill profile, you first set up the ODBC connection and then map DocuShare document properties to table columns. " />
<#assign AutoFillProfilePage_edit_title = "Edit Autofill Profile:" />
<#assign AutoFillProfilePage_edit_subtitle = "Change any of the autofill profile settings." />
<#assign AutoFillProfilePage_mappedBtnWarning = "<strong>Note:</strong> This profile is used by one or more scan buttons, so it cannot be changed or deleted.  Remove its use on each Edit Button Settings page before changing or deleting."/>

<#assign afp_name_label = "Profile Name:" />
<#assign afp_name_tip = "A unique name for the autofill profile." />
<#assign afp_name_fielderror_duplicatename="This name is already in use. Please enter another name."/>
<#assign afp_dsconn_heading ="Step 1 of 2: Set up the ODBC Connection"/>
<#assign afp_dsconn_subheading ="Enter the data source connection information."/>
<#assign afp_datasource_label = "ODBC Type:" />
<#assign afp_datasource_tip = "The data source type." />
<#assign afp_dbname_label = "ODBC Name/File Location:" />
<#assign afp_dbname_tip = "Specify either the database name, if using a server-based database, or the file location, if pointing to a database file on the file system or a Microsoft Excel spreadsheet file." />
<#assign afp_username_label = "Username:" />
<#assign afp_username_tip = "The database username." />
<#assign afp_password_label = "Password:" />
<#assign afp_password_tip = "The password for the database username." />
<#assign afp_host_label = "Host:" />
<#assign afp_host_tip = "The IP address or DNS of the database." />
<#assign afp_port_label = "Port:" />
<#assign afp_port_tip = "The port number for the database." />
<#assign afp_table_label = "Table/Worksheet Name:" />
<#assign afp_table_tip = "Specifies either a database table name or a Microsoft Excel worksheet name." />
<#assign afp_doctype_label = "Document Type:" />
<#assign afp_doctype_tip = "DocuShare document type." />

<#assign afp_return_to_listing_page = "&#8592; Return to the Autofill Profiles List Page"/>
<#assign afp_delete_profile_btn_label = "Delete Profile"/>
<#assign afp_dbsettings_heading = "ODBC Settings"/>

<#assign afp_mapping_heading = "Step 2 of 2: Map DocuShare Document Properties to Table Columns"/>
<#assign afp_mapping_subheading = "Map the columns from the specified data source table to properties of the selected document type. When users scan documents at a device and they enter values for the properties marked as 'Required to Autofill', all the other mapped properties will automatically fill in with the correct values from the assigned ODBC data source. Note: To add or save a profile, you need at least one required mapped field ('Required to Autofill') and one optional mapped field."/>
<#assign afp_mapping_table_colhead_name = "Column Name"/>
<#assign afp_mapping_table_colhead_dsprop = "DocuShare Property"/>
<#assign afp_mapping_table_colhead_primary = "Required to Autofill"/>
<#assign afp_mapping_table_colhead_primary_tip = "Select the fields that will be required to have a value in order for the other mapped fields to autofill."/>
<#assign afp_mapping_table_notsetup = "Select a data source table/worksheet and a DocuShare document type to set up property mapping for the autofill feature."/>

<#assign afp_mapping_property_requiredFields = "Required Fields"/>
<#assign afp_mapping_property_optionalFields = "Optional Fields"/>
<#assign afp_edit_successMsg = "The autofill profile has been successfully updated."/>
<#assign afp_edit_failureMsg = "Error: An error occurred updating the autofill profile."/>
<#assign afp_add_successMsg = "An autofill profile has been successfully added."/>
<#assign afp_add_failureMsg = "Error: An error occurred when adding the autofill profile."/>
<#assign action_deleteSingleAFPConfirmMsg = "Are you sure you want to delete this autofill profile? This cannot be undone."/>
<#assign action_deleteSingleAFPSuccessMsg = "The autofill profile has been successfully deleted."/>
<#assign action_deleteSingleAFPFailureMsg = "Error: An error occurred when deleting the autofill profile."/>
<#assign noAutofillCbxError = "Please select at least one 'Required to Autofill' checkbox."/>
<#assign twoMappedFieldMinimumError = "To add or save a profile, you need at least one required mapped field ('Required to Autofill') and one optional mapped field."/>
<#assign afp_EditDisabled = "You cannot delete or change this autofill profile because it is used by one or more scan buttons.  Remove its use on each Edit Button Settings page before deleting or making any changes. See the list of assigned scanned buttons."/>



<#-- Simple Datasource Menus Listing Page -->
<#assign DatasourceMenuPage_title = "ODBC Menus" />
<#assign DatasourceMenuPage_subtitle = "Use this page to add ODBC menus. Add an ODBC menu to retrieve values from a data source that are used in a menu assigned to a DocuShare document property." />
<#assign btnLabel_AddDatasourceMenu = "Add ODBC Menu..."/>
<#assign btnLabel_DeleteSelDataSourceMenus = "Delete Selected"/>
<#assign dataSourceTable_col_menuname = "Name" />
<#assign dataSourceTable_col_type = "Type" />
<#assign dataSourceTable_col_datasource = "ODBC Type &amp; Location" />
<#assign dataSourceTable_col_tablesource = "Menu Label & Value Source (Table/Column)"/>
<#assign dataSourceTable_col_tablesource_label = "Label:"/>
<#assign dataSourceTable_col_tablesource_value = "Value:"/>
<#assign dataSourceTable_col_property = "Assigned to DocuShare Property (Document Type/Property)" />
<#assign dataSourceTable_col_dms = "Dependent Menu Set Assignments">
<#assign dataSourceTable_type_dsMenuTip = "Simple ODBC Menu">
<#assign dataSourceTable_empty = "No ODBC menus have been set up. Click the 'Add ODBC Menu...' button above to create a new one."/>

<#assign dsm_deleteaction_mappedbtn_msg="This ODBC menu is used by one or more <strong>scan buttons</strong>. Remove its use on each Edit Button Settings page before deleting."/>
<#assign dsm_deleteaction_dm_msg="This ODBC menu is used by one or more <strong>dependent menu sets</strong>. Remove its use on each dependent menu set before deleting."/>
<#assign dsm_deleteaction_mappedbtnanddm_msg="This ODBC menu is used by one or more <strong>dependent menu sets</strong> and <strong>scan buttons</strong>.  Deleting the menu will cause all assigned scan buttons or dependent menu sets to no longer function. Remove its use on each assigned dependent menu set and scan button before deleting."/>
<#assign dbsmPage_mappingDisabledPropTip = "This ODBC menu is used by one or more assigned scan buttons.  Editing the menu will cause all assigned scan buttons to no longer function.  Remove its use on each assigned scan button before editing this property."/>

<#-- ODBC Menu Add/Edit Page -->
<#assign dbsmPage_add_title = "Add ODBC Menu" />
<#assign dbsmPage_add_subtitle = "To add an ODBC menu, you first set up the ODBC connection and then assign the ODBC menu to a DocuShare document property." />
<#assign dbsmPage_edit_title = "Edit ODBC Menu:" />

<#assign dbsmPage_mappedBtnWarning = "This ODBC menu is used by one or more <strong>scan buttons</strong>, so its assigned Document Type and DocuShare property values (shown on step 2) cannot be edited.  First remove its use in the assigned buttons (shown in the assignment list) and then return here to edit the properies or delete the menu."/>
<#assign dbsmPage_mappedDMSWarning = "This ODBC menu is used by one or more <strong>dependent menu sets</strong>, so its settings cannot be changed.  First remove its use in the listed assigned dependent menu sets and then return here to make any changes."/>
  <#assign dbsmPage_mappedBtnAndDMSWarning = "This ODBC menu is used by one or more <strong>dependent menu sets</strong> and <strong>scan buttons</strong>. If this menu is used in dependent menu sets, its settings cannot be changed.  First remove its use in the listed assigned dependent menu sets and then return here to make any changes.  If this menu is assigned to a scan button, its Document Type and DocuShare property values (shown on step 2) cannot be changed."/>

<#assign dbsmPage_edit_subtitle = "Change any of the ODBC menu settings." />
<#assign dbsm_name_label = "Menu Name:"/>
<#assign dbsm_name_tip = "A unique name for the ODBC menu."/>
<#assign dbsm_name_fielderror_duplicatedtitle="There is another ODBC menu with this name. Please enter a unique name."/>
<#assign dbsm_property_label = "DocuShare Property:"/>
<#assign dbsm_property_tip = "The DocuShare property to use for the menu with options from the ODBC data."/>
<#assign dbsm_columnforlabel_label = "Column for Menu Label:"/>
<#assign dbsm_columnforlabel_tip = "The data source column to use for the list of menu option labels. By default, this is set to the same column assigned to the Menu Value."/>
<#assign dbsm_columnforvalue_label = "Column for Menu Value:"/>
<#assign dbsm_columnforvalue_tip = "The data source column to use for the list of menu option values."/>
<#assign dbsmPage_mapping_title = "Step 2 of 2: Assign the ODBC Menu to a DocuShare Property"/>
<#assign dbsmPage_mapping_subtitle = "Choose a table / worksheet and a column from the selected data source to use as values for an ODBC menu. You can optionally select a column that will be used as a menu item label. Then select a DocuShare document type and one of its properties to be used for the menu whose options will be populated at scan time."/>

<#assign dbsmPage_prop_mappingdisabledwarningtp = ""/>

<#assign dbsmPage_edit_successMsg = "The ODBC menu has been successfully updated."/>
<#assign dbsmPage_edit_failureMsg = "Error: An error occurred when updating the ODBC menu."/>
<#assign dbsmPage_add_successMsg = "An ODBC menu has been successfully added."/>
<#assign dbsmPage_add_failureMsg = "Error: An error occurred when adding the ODBC menu."/>

<#assign action_deleteDSMenuConfirmMsg = "Are you sure you want to delete the selected ODBC menus? This cannot be undone."/>
<#assign action_deleteDSMenuSuccessMsg = "You have successfully deleted the selected ODBC menus."/>
<#assign action_deleteDSMenuFailureMsg = "Error: An error occurred when deleting the selected ODBC menus."/>
<#assign action_deleteDSMenuMappedFailureMsg = "Error: One or more of the selected ODBC menus are used by scan buttons or dependent menu sets and cannot be deleted."/>

<#assign action_deleteSingleDSMenuConfirmMsg = "Are you sure you want to delete this ODBC menu? This cannot be undone."/>
<#assign action_deleteSingleDSMenuSuccessMsg = "The ODBC menu has been successfully deleted."/>
<#assign action_deleteSingleDSMenuFailureMsg = "Error: An error occurred when deleting the ODBC menu."/>


<#-- ODBC Dependent Menu Set Listing Page -->
<#assign dmsPage_title = "ODBC Dependent Menu Sets" />
<#assign dmsPage_subtitle = "Use this page to add an ODBC dependent menu set by linking one or more predefined ODBC menus." />
<#assign dmsPage_addBtn = "Add ODBC Dependent Menu Set..."/>
<#assign dmsPage_deleteSelectedBtn = "Delete Selected"/>

<#assign dmsPage_action_deleteConfirmMsg_multi = "Are you sure you want to delete the selected ODBC dependent menu sets?" />
<#assign dmsPage_action_deleteSuccessMsg_multi = "The selected ODBC dependent menu sets were successfully deleted." />
<#assign dmsPage_action_deleteFailureMsg_multi = "An error occurred deleting the selected ODBC dependent menu sets." />
<#assign dmsPage_action_deleteFailureMappingMsg_multi = "Error: One or more of the sets selected are being used on scan buttons and cannot be deleted." />
<#assign dmsPage_action_deleteConfirmMsg_single = "Are you sure you want to delete the selected ODBC dependent menu set?" />
<#assign dmsPage_action_deleteSuccessMsg_single= "The selected ODBC dependent menu set was successfully deleted." />
<#assign dmsPage_action_deleteFailureMsg_single = "An error occurred when deleting the selected ODBC dependent menu set." />

<#assign dmsPage_table_empty = "No ODBC dependent menu sets have been set up. Click the 'Add ODBC Dependent Menu Set' button above to create a new one.">
<#assign dmsPage_table_iconTip = "ODBC Dependent Menu Set">
<#assign dmsPage_table_col_name = "Menu Set Name">
<#assign dmsPage_table_col_menus = "Menus Used">
<#assign dmsPage_table_col_btnsassigned = "Buttons Using">
<#assign dmsPage_table_col_actions = "Actions">
<#assign dmsPage_table_col_action_DeleteDisabled = "You cannot delete this dependent menu set because one or more scan buttons use it.  Remove its use on the Edit Button Settings page for each button before deleting."/>


<#-- ODBC Dependent Menu Set Add/Edit Page -->
<#assign dmPage_add_title = "Add ODBC Dependent Menu Set"/>
<#assign dmPage_add_subtitle = "Select a series of existing ODBC menus that are dependent on each other for their values. Select a primary menu and then choose one or more dependent menus. Map the label for each menu option to a value from a data source table column to link its dependent menu."/>
<#assign dmPage_edit_title = "Edit ODBC Dependent Menu Set:"/>
<#assign dmPage_edit_subtitle = "Change any of the ODBC dependent menu set settings."/>
<#assign dmPage_mappedBtnWarning = "<strong>Note:</strong> Since this dependent menu set is used by one or more scan buttons, you cannot change its data source menu selections or delete it.  First remove the use of the dependent menu set on the Edit Button Settings page for each button and then return to this page to change its data source menu selections or to delete it.  You can change the settings in the Map Menu Values section."/>
<#assign dmPage_mappedBtnNoDeleteTip = ""/>

<#assign dmPage_profileName_label="Dependent Menu Set Name:"/>
<#assign dmPage_profileName_tip="A unique name for the ODBC dependent menu set."/>
<#assign dmPage_profileName_fielderror_duplicatedtitle="There is another ODBC dependent menu set with this name. Please enter a unique name."/>
<#assign dmPage_section_SelectODBCMenus = "Select Data Source Menus"/>
<#assign dmPage_section_SelectODBCMenus_subtitle = "Select a primary menu, and then choose one or more menus that are dependent on each other for their values."/>
<#assign dmPage_primaryMenuLabel= "Primary Menu:"/>
<#assign dmPage_primaryMenuTip= "The primary ODBC menu in the set. It uses the ODBC menu's database, table and column settings."/>
<#assign dmPage_dependentMenuLabel1= "Dependent Menu 1:"/>
<#assign dmPage_dependentMenuTip1= "The first dependent ODBC menu in the set. It uses the ODBC menu's database and table settings only."/>
<#assign dmPage_dependentMenuLabel2= "Dependent Menu 2:"/>
<#assign dmPage_dependentMenuTip2= "The second dependent ODBC menu in the set. It uses the ODBC menu's database and table settings only."/>
<#assign dmPage_add_dm="Add dependent menu"/>
<#assign dmPage_remove_dm="Remove dependent menu"/>
<#assign dmPage_menuoption_none="None"/>
<#assign dmPage_noODBCMenus = "You cannot add an ODBC dependent menu set as there are no ODBC menus. Go to the ODBC Menus page to add one."/>

<#assign dmPage_section_MapMenuValues = "Map Menu Values"/>
<#assign dmPage_section_MapMenuValues_subtitle = "Map the values for each menu option to its dependent menu by setting the data source column for its menu values and optionally, for its labels."/>
<#assign dmPage_returntolisting = "&#8592; Return to the ODBC Dependent Menu Sets List Page"/>
<#assign dmPage_mapingtable_emptyoptionshelp="&larr; Select columns for option labels and values."/>
<#assign dmPage_addBtnLabel="Add"/>
<#assign dmPage_deleteBtnLabel="Delete Menu Set"/>
<#assign dmPage_colMenuNoSelection="Select a column&#8230;"/>
<#assign dmPage_maptblhdr_mapping ="Mapping"/>
<#assign dmPage_maptblhdr_options ="Options"/>
<#assign dmPage_maptblhdr_optscolsubheading ="Label : Value"/>
<#assign dmPage_maptblhdr_colforlabel ="Column for Label"/>
<#assign dmPage_maptblhdr_colforvalue ="Column for Value"/>


<#-------------------------------------->
<#---------- MFD UI Messages ----------->
<#-------------------------------------->
<#assign browseCollection_MenuLabel = "Select a Folder:">
<#assign browseCollection_selectBtnLabel = "Select Folder"/>
<#assign browseCollection_ResponseError = "Error: the folder was not found or there is a connection problem with the DocuShare server."/>
<#assign browseCollection_UpOneLevel = "Up One Level"/>

<#assign browseFolder_MenuLabel = "Select a Folder:">
<#assign browseFolder_selectBtnLabel = "Select Folder"/>
<#assign browseFolder_ResponseError = "Error: the network folder was not found or there is a network connection problem."/>
<#assign emailSubjectLabel = "Email Subject"/>
<#assign folderSubjectLabel = "Filename"/>
<#assign sendingScanToTxt = "Sending Scan to:"/>

<#-- MFP Device Emulator List Page -->

<#assign EmulatorPage_title="MFP Device Emulator"/>
<#assign EmulatorPage_subtitle="Use this page to emulate MFP functionality. Click on any button to start scanning."/>


