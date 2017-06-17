<#assign buttonxml = buttonData.EIPConfig["//button[@buttonId='${buttonId}']"] />
<#assign config = buttonData.EIPConfig />
<#assign activeMenuAgents = EIP_MenuAgents.MenuAgent />
<#assign mfdxml = mfdData.device_configuration["device[@name='default']"] />
<#assign parentGroup= buttonData.EIPConfig["//button[@buttonId='${parentId}']/@dsGroup"][0]!"" />
<#import "StandaloneMenu.ftl" as menu />
<#import "/locale/messages_${locale}.ftl" as msg />

<#-- Determine if the button is a scan, folder, or mfd service button -->
<#assign buttontype = ""/>
<#if buttonxml.metadata[0]??>         <#-- Contain metadata elements - is a scan button-->
  <#assign buttontype = "scan"/>
<#elseif buttonxml.@parentId == "0">   <#-- Is the parent Id 0 (i.e. a service button) -->
  <#assign buttontype = "mfd"/>
<#else>                               <#-- otherwise, we have a folder button -->
  <#assign buttontype = "folder"/>
</#if>

<#-- Determine the button type label -->
<#assign buttontypelabel = ""/>
<#if buttontype == "scan">
  <#assign buttontypelabel = "${msg.btntitle_Scan}"/>
<#elseif buttontype == "mfd">
  <#assign buttontypelabel = "${msg.btntitle_Service}"/>
<#else>
  <#assign buttontypelabel = "${msg.btntitle_Folder}"/>
</#if>

<#-- Determine the page title based on the button type and edit action (edit permissions or edit properties) -->
<#assign title>
  <#assign buttonlabel = "${buttonxml.@name}"/>
  <#if action == "editsettings">
    <@msg.title_editsettings buttontypelabel buttonlabel/>
  <#elseif action == "editpermissions">
    <@msg.title_editpermissions buttontypelabel buttonlabel/>
  </#if>
</#assign>

<#-- Determine the page subtitle based on the edit action type -->
<#assign subtitle>
  <#if action = "editsettings">
    ${msg.subtitle_editsettings}
  <#elseif action == "editpermissions">
    ${msg.subtitle_editpermissions}
  </#if>
</#assign>

<#assign scanType = buttonxml.@scanType/>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta charset="utf-8" />
    <title>${title}</title>
    ${ds_admin_site_style}
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/admin_styles.css" />
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/scripts/lib/jquery-ui/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/jquery.smallipop.css" media="all" title="Screen"/>
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/image-picker.css" media="all" title="Screen"/>

    <!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/admin_ds6_ie8-7.css" /><![endif]-->

    <script src="${EIP_RealPath}/scripts/lib/jquery.js" type="text/javascript"></script>
    <script src="${EIP_RealPath}/scripts/lib/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
    <!--jquery plugins -->
    <script src="${EIP_RealPath}/scripts/jquery.nimble.loader.js" type="text/javascript"></script>
    <script src="${EIP_RealPath}/scripts/jquery.form.js" type="text/javascript"></script>
    <script src="${EIP_RealPath}/scripts/jquery.smallipop.js" type="text/javascript"></script>
    <script src="${EIP_RealPath}/scripts/jquery.fix.clone.js" type="text/javascript"></script>
    <script src="${EIP_RealPath}/scripts/image-picker.js" type="text/javascript"></script>
    <script src="${EIP_RealPath}/scripts/modernizr.js" type="text/javascript"></script>
    <script src="${EIP_RealPath}/scripts/xml2json.min.js" type="text/javascript"></script>
    <script src="${EIP_RealPath}/scripts/ObjTree.js" type="text/javascript"></script>
    <script src="${EIP_RealPath}/scripts/connectkey.js" type="text/javascript"></script>
    <script>

      $(document).ready(function() {
        <#if action=="editsettings">

          <#if buttontype =="scan">

          //Store the list of Autofill profiles as jQuery data on the #dbAgent select menu.
          $("#dbAgent").data({<@compress single_line=true>
            <#list EIP_DSData.getDocumentObjectList() as map>
              <#list map?keys as entry>
                "${map[entry]}":[
                <#list config["DBAgent[documentType='${map[entry]}']"] as dbAgent>
                  {"${dbAgent.name}" : [
                    <#list dbAgent.columns.column as column>
                      {"property" : "${column.@dsProperty}", "primary" : "${column.@primary}"}
                      <#if column_has_next>,</#if>
                    </#list>
                  ]}<#if dbAgent_has_next>,</#if>
                </#list>
                ]<#if map_has_next>,</#if>
              </#list>
            </#list>
          });</@compress>

          //Autofill profile labels...
          connectkey.afpRequiredStrings = {"requiredbadgetitle":"${msg.autofillProfile_isMappedFieldRequired}","requiredtag":"${msg.propRequiredbyAFP}"};

          //Autofill profile textbox typein lookup timer...
          connectkey.afpTextboxTimeout;
          
          //Store the list of menuAgents as jQuery data on the #docType select menu.
          $("#docType").data({<@compress single_line=true>
            <#list EIP_DSData.getDocumentObjectList() as map>
              <#list map?keys as entry>
                "${map[entry]}":{
                  <#list config["MenuAgent[documentType='${map[entry]}' and not(property=(preceding-sibling::*/property))]/property"] as prop>
                    "${prop}" : [
                      <#list config["MenuAgent[documentType='${map[entry]}' and property='${prop}']/name"] as MenuAgentName>
                        "${MenuAgentName}"
                        <#if MenuAgentName_has_next>,</#if>
                      </#list>
                    ]
                    <#if prop_has_next>,</#if>
                  </#list>
                }<#if map_has_next>,</#if>
              </#list>
            </#list>
          });</@compress>

          //handle invalid primary key default values for Autofill Profiles...
          <#if buttonxml.@dbAgent != "">
            var afpbtnmetadatalist = {<@compress single_line=true>
            <#list buttonxml.metadata as field>
              "${field.@name}" : "${field.@value}"<#if field_has_next>,</#if>
            </#list>
            </@compress>};

            connectkey.loadValidAFPVals("${EIP_RealPath}/EIPServer/ValidateMetadata?documentType=${buttonxml.@documentType}&dbAgent=${buttonxml.@dbAgent}", "${buttonxml.@documentType}", "${buttonxml.@dbAgent}", afpbtnmetadatalist);
          </#if>

          // DEPENDENT MENU SCRIPTS...
          //List of Dependent Menu Sets grouped by Menu Agent...
          connectkey.dependentMenuSets = {<@compress single_line=true>
            <#list config["DependentMenuProfile//menuAgent[not(. = preceding::menuAgent)]"] as menu>
              "${menu}" : [<#list config["DependentMenuProfile//menuAgent[text()='${menu}']/.."] as set>"${set.@name?xml}"<#if set_has_next>,</#if></#list>]
            <#if menu_has_next>,</#if>
            </#list>
          }</@compress>

          //List of Metadata fields for the button grouped by Dependent Menu Set...
          connectkey.dependentMenuFields = {<@compress single_line=true>
            <#list config.DependentMenuProfile as profile>
              "${profile.@name}" : {
              <#list buttonxml["metadata[@dependentMenuProfile ='${profile.@name}']"] as field>
                "${field.@name}" : "${field.@value}"<#if field_has_next>,</#if>
              </#list>
              }<#if profile_has_next>,</#if>
            </#list>
          }</@compress>

          connectkey.dmProfiles = {<@compress single_line=true>
          <#list EIP_MetaDependentMenuProfiles as profile>
            <#assign profiledata = 'EIP_'+ profile />
            <#assign profilemarkup = .vars[profiledata].@@markup />
            '${profile}' : '${profilemarkup?js_string}'<#if profile_has_next>,</#if>
          </#list>
          </@compress>};

          /**
           * loadDependentMenuSetData
           * This function converts the xml inside the dmProfiles object into JSON
           */
          connectkey.loadDependentMenuSetData(connectkey.dmProfiles);

          //object literal of all properties actively mapped to a dependent menu set.
          connectkey.dmsprops = {};
        
          //ODBC menu labels object...
          connectkey.odbcMenuLabels = {"simplemenu":"${msg.odbcMenu_optgrouplabel_simplemenu}","dmset":"${msg.odbcMenu_optgrouplabel_dmsets}"};

          //Labels for Email and Network folder title property
          connectkey.metalistFilenameLabels = {"email":"${msg.propLabel_emailfilename}","folder":"${msg.propLabel_networkfilename}"};

          //Labels for the Appended Information menu
          connectkey.AppendedInfoMenuLabels = {"none" : "${msg.optionLabel_AppendInfo_none}", "uniqueid" : "${msg.optionLabel_AppendInfo_none_folder}"}
        
            //Functions to run after page load...
            connectkey.initScanBtnAutocompleteFields();
            $('#field_list .textboxhint').smallipop({popupOffset:10, popupDistance:0, popupAnimationSpeed:0, popupDelay:500, preferredPosition: 'right', hideDelay:0, handleInputs:false});
            $("#field_list .afpmappedbadge").smallipop({popupDistance:0, popupAnimationSpeed: 0, popupDelay:500, popupOffset:150, popupYOffset:-14, hideDelay:200});
            
            //http://www.foliotek.com/devblog/make-table-rows-sortable-using-jquery-ui-sortable/
            var helperRowWidthRetainer = function(e, ui) {
              ui.children().each(function() {
                  $(this).width($(this).width());
              });
              return ui;
            };

            $("#field_list").sortable({placeholder: "ui-state-highlight", helper: helperRowWidthRetainer});

            <#if scanType = "DocuShare" && buttonxml.subCollection[0]??>
              $("#subCollectionSettings").data({"${buttonxml.@documentType}":["${buttonxml.subCollection[0].@type[0]!''}", "${buttonxml.subCollection[1].@type[0]!''}", "${buttonxml.subCollection[2].@type[0]!''}"]}) //use jquery data to store array of to the subCollectionFieldset for later use.
            </#if>
            connectkey.createFieldPropertyOptions("pageload");
            connectkey.convertRequiredNamestoLabels('<@compress single_line=true><#if buttonxml.@documentType = "">Document<#else>${buttonxml.@documentType}</#if></@compress>');

            <#if buttonxml.@scanType == "DocuShare">
            connectkey.convertHandleToTitle("<p class='fielderror'><strong>${msg.fieldErrorTitle}</strong> <@msg.fielderror_CollectionHandleNotFound buttonxml.@collHandle/></p>", "${EIP_RealPath}/EIPAdmin/Search?searchType=handle&stringSearch=${buttonxml.@collHandle}", "collHandleLabel", "${buttonxml.@collHandle}");
            </#if>

            <#if buttonxml.@ownerHandle != "">
            connectkey.convertHandleToTitle("<p class='fielderror'><strong>${msg.fieldErrorTitle}</strong> <@msg.fielderror_userHandleNotFound buttonxml.@ownerHandle/></p>", "${EIP_RealPath}/EIPAdmin/Search?searchType=handle&stringSearch=${buttonxml.@ownerHandle}", "ownerHandleLabel", "${buttonxml.@ownerHandle}");
            </#if>


            //Event listeners to start after page load...
            $("#addfieldrow").click(function(){connectkey.addFieldRow();});
            $("#docType").change(function(e){connectkey.changeDocType(e);});
            $("#dbAgent").change(function(e){connectkey.changeAutoFillMenu(e, "${msg.afp_mappedfield_defaultval_hint}")});
            $("#field_list").on("click", "button.removefield", function(e){connectkey.removeFieldRow(e);});
            $("#field_list").on("change", "select.menu_concat_type", function(e){connectkey.toggleConcatLocMenu(e);});
            $("#field_list").on("change", ".propchooser", function(e){connectkey.changeOrAddPropertyMenu(e.target)});
            $("#field_list").on("change", "select.meta_type", function(e){connectkey.changeMetaType(e)});
            $("#field_list").on("change", ".odbc-menu", function(e){connectkey.changeODBCMenu(e, "${EIP_RealPath}/EIPAdmin/Search?searchType=metaMenuValue&menuAgent=", "${EIP_RealPath}/EIPServer/SearchDB?searchType=queryDependencyMenus&profileName=", "${msg.menuAgent_optionsRequestError}")});
            $("#field_list").on("change", ".meta_defaultvaluemenu.odbc-dm", function(e){connectkey.changeDMDefaultMenuVal(e,"${EIP_RealPath}/EIPServer/SearchDB?searchType=queryDependencyMenus&profileName=", "${msg.menuAgent_optionsRequestError}")});
            $("#field_list").on("keyup blur", ".autofill-mapped-prop-required .meta_defaultvalue", function(e){connectkey.delayLoadAFPValues(e)});
            $("#field_list").on("change", ".autofill-mapped-prop-required .meta_defaultvaluemenu", function(e){connectkey.loadAFPValues(e)});

            $("#scanType").change(function(e){connectkey.changeScanType(e)});
            $("#collHandleLabel").blur(function(e){connectkey.updateSubFolderRootLabel(e);});
            $("#btn_folderAccessTest").click(function(e){connectkey.testNetworkFolderSettings(e, "${EIP_RealPath}/EIPAdmin/FolderAccessTest")});
            $("#ocr").change(function(e){connectkey.changeOCRType(e)});
            $("#scanColor").change(function(e){connectkey.changeScanColor(e)});
            $(".subCollectionSelect").change(function(e){connectkey.toggleOptionalFieldRequired(e)});
            $("#exportMeta").change(function(e){connectkey.checkMetadataMode(e)});

            $("#ocr").data({"isServerMRC" : ${isServerMRC?string}, "isServerPDFA" : ${isServerPDFA?string}}); // put a data object on the OCR menu that tells the UI the MRC or PDFA ability of the server

            $("#editButtonForm").submit(function(e){connectkey.validateForm(e, "${msg.validationErrorGeneralMsg}", '<p class="fielderror error_empty"><strong>${msg.fieldErrorTitle}</strong> ${msg.fielderror_empty}</p>', "${msg.editbtn_formsubmit_success}", "${msg.editbtn_formsubmit_error}", document.location, null, connectkey.validateODBCSettings("${msg.afp_missingfields_error} ", "${msg.dms_missingfields_error} "));});
            $("#authenticateOwnerBtn").click(function(){connectkey.authenticateOwner()});
            $("#ownerHandleLabel").blur(function(){connectkey.checkOwnerExistance()});
            $("#collHandleLabel").blur(function(){connectkey.checkDSFolderExistance()});

          <#elseif buttontype == "mfd">
            connectkey.initEditIconDialog("${msg.btn_apply}", "${msg.btn_cancelLabel}","${msg.btn_closeTip}", "EditButton"); //prepare edit icon form dialog box.
            $("#btn_editIcon").click(function(e){$("#updatebtnicon-dialog-form").dialog("open");});
            $('#updateicon-form').ajaxForm({
              success: function(){connectkey.showMessage("${msg.icon_update_success}", "success");setTimeout(function(){window.location.reload(true)}, 1000)},
              failure: function(){connectkey.showMessage("${msg.icon_update_failure}", "error")}
            }); //prepare form to submit via ajax.
            $("#updatebtnicon-dialog-form").on("click", "input[type='radio']", connectkey.validateEditIconDialog);
            $("#updatebtnicon-dialog-form").on("change", "#icon_select", connectkey.handleIconFormSelectField);
            $("#updatebtnicon-dialog-form").on("change", "#icon_upload", connectkey.handleIconFormUploadField);
            $("#icon_select").imagepicker();

            $("#editButtonForm").submit(function(e){connectkey.validateForm(e, "${msg.validationErrorGeneralMsg}", '<p class="fielderror error_empty"><strong>${msg.fieldErrorTitle}</strong> ${msg.fielderror_empty}</p>', "${msg.editbtn_formsubmit_success}", "${msg.editbtn_formsubmit_error}", document.location, null);});

          <#elseif buttontype == "folder">
            $("#editButtonForm").submit(function(e){connectkey.validateForm(e, "${msg.validationErrorGeneralMsg}", '<p class="fielderror error_empty"><strong>${msg.fieldErrorTitle}</strong> ${msg.fielderror_empty}</p>', "${msg.editbtn_formsubmit_success}", "${msg.editbtn_formsubmit_error}", document.location, null);});

          </#if>

          //Common edit page load functions...
          $("#buttonName").focus();
          //Common edit page event listeners...
          $("#deletebutton").click(function(e){e.preventDefault(); connectkey.deleteButton(e, "${msg.deleteAction_confirm}", "${msg.deleteAction_error}", "${msg.deleteAction_success}", "${EIP_RealPath}/EIPAdmin/ConfigureButtons", "${EIP_RealPath}/EIPAdmin/Button");});
          $("body").on("blur", ".required_error", function(e){connectkey.checkRequiredErrorField(e);})


        <#elseif action =="editpermissions">

          //Functions to run after page load...
          connectkey.initGroupAutocompleteField("editpermissions");

          <#if buttontype != "mfd">
          connectkey.convertHandleToTitle("<p class='fielderror'><strong>${msg.fieldErrorTitle}</strong> <@msg.fielderror_groupHandleNotFound parentGroup /></p>", "${EIP_RealPath}/EIPAdmin/Search?searchType=handle&stringSearch=${parentGroup}", "parentGroupHandleLabel", "${parentGroup}");
          </#if>

          //Don't run this function if button has guest access...
          <#if buttonxml.@guest == "false" && (buttonxml.@dsGroup != parentGroup)>
          connectkey.convertHandleToTitle("<p class='fielderror'><strong>${msg.fieldErrorTitle}</strong> <@msg.fielderror_groupHandleNotFound buttonxml.@dsGroup/></p>", "${EIP_RealPath}/EIPAdmin/Search?searchType=handle&stringSearch=${buttonxml.@dsGroup}", "groupHandleLabel", "${buttonxml.@dsGroup}");
          </#if>

          //Event listeners for the Edit permissions page...
          $("#accessTypeMenu").change(function(e){connectkey.toggleAccessOptions(this, "${buttontype}") })
          $("input[name='groupHandle']").change(connectkey.toggleGroupRequired);

          $("#editButtonForm").submit(function(e){connectkey.validateForm(e, "${msg.validationErrorGeneralMsg}", '<p class="fielderror error_empty"><strong>${msg.fieldErrorTitle}</strong> ${msg.fielderror_empty}</p>', "${msg.editbtn_formsubmit_success}", "${msg.editbtn_formsubmit_error}", document.location, null);});

        </#if>
      });  //end document ready code...
  
    </script>

  </head>
  <body id="EditButton" class="adminsection">
   <#include "adminheader.ftl">
    <@menu.show/>
    <section id="content" class=''>

      <h2>${title}</h2>
      <!-- page description -->
      <p id="page_description">${subtitle}</p>
      <!-- page body -->
      <section id="page_body">
          <form action="${EIP_RealPath}/EIPAdmin/Button" method="post" id="editButtonForm">

          <#if action !="editpermissions"><input type="hidden" id="groupHandle" name="groupHandle" value="${buttonxml.@dsGroup}" /></#if>
          <#if action !="add">
            <input type="hidden" id="buttonId" name="buttonId" value="${buttonxml.@buttonId}" />
            <input type="hidden" id="parentId" name="parentId" value="${buttonxml.@parentId}" />
          </#if>

          <input type="hidden" id="buttontype" name="buttonType" value="${buttontype}" />

          <#if action == "editsettings">
            <input type="hidden" id="action" name="action" value="update_settings" />
            <#if buttontype == "scan">
              <@body_editsettings_scan/>
            <#else>
              <@body_editsettings/>
            </#if>
          <#else>
            <input type="hidden" id="action" name="action" value="update_permissions" />
            <@body_editpermissions/>
          </#if>

          <div id="buttonrow">
            <button type="submit">${msg.btn_apply}</button>
            <#if action !="editpermissions"><button id="deletebutton" type="button" class="btn_danger">${msg.btn_deleteButton}</button></#if>
            <a href="${EIP_RealPath}/EIPAdmin/ConfigureButtons"> &#8592; ${msg.link_returnToButtonList}</a>
          </div>

        </form>
      </section>
    </section>

    <#if buttontype == "mfd" && action != "editpermissions">
      <div id="updatebtnicon-dialog-form" title="${msg.editsvcbtndialog_title}">
        <form id="updateicon-form" action="${EIP_RealPath}/EIPAdmin/Button" method="post" enctype="multipart/form-data">
        <input type="hidden" name="buttonId" value="${buttonId}">
        <fieldset>
          <p>${msg.editsvcbtndialog_subtitle}</p>
          <ul>
            <li>
              <input type="radio" id="seticon_reset" name="action" value="reset_icon" <@isIconOptionChecked_onload "default" /> >
              <label for="seticon_reset">${msg.icon_resetdefault_label}</label>
              <img src="${EIP_RealPath}/images/eip_icon.png"/>
            </li>
            <li>
              <input type="radio" id="seticon_upload" name="action" value="upload_icon">
              <label for="seticon_upload">${msg.icon_upload_label}</label>
              <input type="file" id="icon_upload" name="iconfile"/>
              <p class="fieldnote_below">${msg.icon_upload_visiblehint}</p>
            </li>
            <li>
              <#assign isExistingRadioDissabled><#if buttonData.EIPConfig["//button/icon"][0]??><#else>disabled="disabled"</#if></#assign>
              <input type="radio" id="seticon_image" name="action" value="select_icon" <@isIconOptionChecked_onload "typein" /> ${isExistingRadioDissabled}>
              <label for="seticon_image">${msg.icon_filetypein_label}</label>

              <#if buttonData.EIPConfig["//button/icon"][0]??>
              <select id="icon_select" class="image-picker masonry" name="iconname">
                <option value=""></option>
                <#list buttonData.EIPConfig["//icon[not(. = preceding::icon)]"] as icon>
                  <option data-img-src="../images/${icon}" value="${icon}" <@isOptionSelected icon buttonxml.icon[0]!'' /> >${icon}</option>
                </#list>
              </select>
              <#else>
                <span id="updateicon_noticonsmsg">${msg.editsvcbtndialog_subtitle_noexistingicons}</span>
              </#if>
            </li>
          </ul>
        </fieldset>
        </form>
      </div>
    </#if>
  </body>
</html>


<!-- Edit Settings Body for MFD or Folder Buttons -->
<#macro body_editsettings>
  <fieldset>
    <ul>
      <li>
        <label for="name" class="label-required labeltip" title="${msg.propHelp_ButtonLabel}">${msg.propLabel_ButtonLabel}</label>
        <input id="buttonName" name="buttonName" type="text" class="large required" value="${buttonxml.@name}">
      </li>
      <#if buttontype == "mfd">
      <li>
        <label for="dsdomain" class="label-required labeltip" title="${msg.ServerSetup_domainTip}">${msg.ServerSetup_domainLabel}</label>
        <div class="field">
          <select name="dsdomain" id="dsdomain" class="required">
            <#list EIP_domains as domain>
            <option value="${domain}" <@isOptionSelected domain buttonxml.@dsdomain /> >${domain}</option>
            </#list>
          </select>
        </div>
      </li>
      </#if>
    </ul>
  </fieldset>

  <#if buttontype == "mfd">
    <fieldset id="icon_settings">
      <label class="label-required hastip" title="${msg.svcbtnicon_hint}">${msg.svcbtnicon_label}</label>
      <div id="icon_preview">
        <#if buttonxml.icon[0]??> <#-- if a button image is specified -->
          <img src="${EIP_RealPath}/images/${buttonxml.icon}"/>
        <#else> <#-- otherwise, just show the default button image -->
          <img src="${EIP_RealPath}/images/eip_icon.png"/>
        </#if>
      </div>
      <button type="button" id="btn_editIcon">${msg.btn_editicon_label}</button>
    </fieldset>
  </#if>

</#macro>


<!-- Edit Settings Body for Scan button -->
<#macro body_editsettings_scan>

  <@body_editsettings/>

    <#-- What's visible? (onload)-->
  <#assign folderFieldsVisibility><#if buttonxml.@scanType = "Email" || buttonxml.@scanType = "DocuShare">display:none</#if></#assign>
  <#assign colFieldsVisibility><#if buttonxml.@scanType = "Folder"  || buttonxml.@scanType = "Email">display:none</#if></#assign>
  <#assign initEmailFieldsVisibility><#if buttonxml.@scanType = "Folder" || buttonxml.@scanType = "DocuShare">display:none</#if></#assign>
  <#assign folderAndEmailFieldsVisibility><#if buttonxml.@scanType = "DocuShare">display:none</#if></#assign>
  <#assign initFolderAndCollectionFieldsVisibility><#if buttonxml.@scanType = "Email">display:none</#if></#assign>

  <#-- What's disabled? (onload)-->
  <#assign initFolderFieldsEnabled><#if buttonxml.@scanType != "Folder">disabled="disabled"</#if></#assign>
  <#assign initCollFieldsEnabled><#if buttonxml.@scanType != "DocuShare">disabled="disabled"</#if></#assign>
  <#assign initFolderAndEmailFieldsEnabled><#if buttonxml.@scanType = "DocuShare">disabled="disabled"</#if></#assign>
  <#assign initFolderAndCollectionFieldsEnabled><#if buttonxml.@scanType = "Email">disabled="disabled"</#if></#assign>
  <#assign initEmailFieldsEnabled><#if buttonxml.@scanType != "Email">disabled="disabled"</#if></#assign>

  <fieldset>
    <h3>${msg.scanOwner_title}</h3>
    <p>${msg.scanOwner_description}</p>
    <ul>
      <li>
        <label for="ownerHandleLabel" class="label-required labeltip" title="${msg.propHelp_Owner}">${msg.propLabel_Owner}</label>
        <input type="text" id="ownerHandleLabel" name="ownerHandleLabel" class="required medium" value="" />
        <span class="owner-auth-fail" style="display: none;">${msg.ownerNotAuthenticated_msg}</span>
        <span class="owner-not-found" style="display: none;">${msg.ownerNotFound_msg}</span>
        <input id="ownerHandle" name="ownerHandle" type="hidden" value="${buttonxml.@ownerHandle}" />
        <p class="fieldnote_below">${msg.propNote_Owner}</p>
      </li>
      <li id="ownerPasswordLI" style="display: none;">
        <label for="ownerPassword" class="labeltip" title="">${msg.propLabel_OwnerPassword}</label>
        <input type="password" id="ownerPassword" class="medium" value="">
        <button type="button" id="authenticateOwnerBtn">${msg.btn_AuthenticateOwner_label}</button>
      </li>
    </ul>
  </fieldset>


  <fieldset>
    <h3>${msg.scanSettings_title}</h3>
    <ul>
      <li>
        <label for="format" class="label-required labeltip">${msg.propLabel_ScanType}
          <span class="smallipopHint">${msg.propHelp_ScanType}
          <dl>
            <dt>${msg.optionLabel_ScanType_DocuShare}</dt>
            <dd>${msg.optionLabelHint_ScanType_DocuShare}</dd>
            <dt>${msg.optionLabel_ScanType_Folder}</dt>
            <dd>${msg.optionLabelHint_ScanType_Folder}</dd>
            <dt>${msg.optionLabel_ScanType_Email}</dt>
            <dd>${msg.optionLabelHint_ScanType_Email}</dd>
          </dl>
          </span>
        </label>

        <select id="scanType" name="scanType">
          <option value="DocuShare" <@optionselected "DocuShare" buttonxml.@scanType/> >${msg.optionLabel_ScanType_DocuShare}</option>
          <option value="Folder" <@optionselected "Folder" buttonxml.@scanType/> >${msg.optionLabel_ScanType_Folder}</option>
          <#assign isEmailServerDisabled><#if config.EmailConfig.emailHost = "">disabled="disabled" title="${msg.optionLabel_ScanType_Email_ServerNotConfiguredTip}"</#if></#assign>
          <option value="Email" <@optionselected "Email" buttonxml.@scanType/> ${isEmailServerDisabled}>
            ${msg.optionLabel_ScanType_Email}
            <#if config.EmailConfig.emailHost = "">
              ${msg.optionLabel_ScanType_Email_ServerNotConfiguredLabel}
            </#if>
          </option>

        </select>
      </li>


      <!-- DocuShare Folder Scan Type Fields -->
      <li class="scanType_coll" style="${colFieldsVisibility}"><label for="collHandleLabel" class="label-required labeltip" title="${msg.propHelp_ScanToCollection}">${msg.propLabel_ScanToCollection}</label>
        <input id="collHandleLabel" type="text" name="collHandleLabel" class="large required" value="" ${initCollFieldsEnabled} data-noownerplaceholder="${msg.noCollectionFoundPlaceholder}" />
        <span class="folder-not-found" style="display: none;">Folder not found in DocuShare.</span>
        <input id="collHandle" type="hidden" name="collHandle" value="${buttonxml.@collHandle}" ${initCollFieldsEnabled} />
        <p class="fieldnote_below">${msg.propNote_ScanToCollection}</p>
        <!-- Empty out Folder-specific fields on post using these hidden fields... -->
        <input type="hidden" name="uncPath" value="" ${initCollFieldsEnabled} />
        <input type="hidden" name="uncUser" value="" ${initCollFieldsEnabled} />
        <input type="hidden" name="uncPassword" value="" ${initCollFieldsEnabled} />
      </li>


      <!-- Folder Scan Type Fields -->
      <li class="scanType_nfolder" style="${folderFieldsVisibility}"><label for="uncPath" class="label-required labeltip" title="${msg.propHelp_folderPath}">${msg.propLabel_folderPath}</label>
        <input type="text" id="uncPath" name="uncPath" class="large required" value="${buttonxml.@uncPath}" ${initFolderFieldsEnabled} />
        <p class="fieldnote_below">${msg.propNote_folderPath}</p>
        <!-- Empty out Collection-specific fields on post using these hidden fields... -->
        <input type="hidden" name="collHandle" value="" ${initFolderFieldsEnabled} />
        <input type="hidden" name="ownerHandle" value="" ${initFolderFieldsEnabled} />

      </li>

      <li class="scanType_nfolder" style="${folderFieldsVisibility}"><label for="uncUser" class="label-required labeltip" title="${msg.propHelp_folderUser}">${msg.propLabel_folderUser}</label>
        <input type="text" id="uncUser" name="uncUser" value="${buttonxml.@uncUser}" ${initFolderFieldsEnabled} />
      </li>

      <li class="scanType_nfolder" style="${folderFieldsVisibility}"><label for="uncPassword" class="label-required labeltip" title="${msg.propHelp_folderPassword}">${msg.propLabel_folderPassword}</label>
        <input type="password" id="uncPassword" name="uncPassword" value="${buttonxml.@uncPassword}" ${initFolderFieldsEnabled} />
        <button type="button" id="btn_folderAccessTest">${msg.folderTestConnBtn_label}</button>
        <!-- connection test error/success messages -->
        <span id="nfconnwait" style="display:none">${msg.folderTestConn_pleasewait}</span>
        <span class="nfconnmsg mfconnmsg_success" id="nfconn_success_msg" style="display:none">${msg.folderTestConnBtn_success}</span>
        <span class="nfconnmsg mfconnmsg_error" id="nfconn_failure_authenticate_msg" style="display:none">${msg.folderTestConnBtn_failure_authenticate}</span>
        <span class="nfconnmsg mfconnmsg_error" id="nfconn_failure_unknownDomain_msg" style="display:none">${msg.folderTestConnBtn_failure_unknownDomain}</span>
        <span class="nfconnmsg mfconnmsg_error" id="nfconn_failure_badNetworkPath_msg" style="display:none">${msg.folderTestConnBtn_failure_badNetworkPath}</span>
        <span class="nfconnmsg mfconnmsg_error" id="nfconn_failure_others_msg" style="display:none">${msg.folderTestConnBtn_failure_others}</span>
      </li>

      <!-- Email Scan Type Fields -->
      <li class="scanType_email" style="${initEmailFieldsVisibility}">
        <label for="defaultEmailAddress" class="label-required labeltip" title="${msg.propNote_defaultEmailAddress}">${msg.propLabel_defaultEmailAddress}</label>
        <input type="input" id="defaultEmailAddress" name="defaultEmailAddress" value="${buttonxml.@defaultEmailAddress}" class="large" ${initEmailFieldsEnabled}/>
      </li>

      <!-- Common Fields -->
      <li>
        <label for="ocr" class="label-required labeltip">${msg.propLabel_DefaultOCR}
          <span class="smallipopHint">${msg.propHelp_DefaultOCR}
          <dl>
            <dt>${msg.optionLabel_DefaultOCR_imageonly}</dt>
            <dd>${msg.optionLabelHint_DefaultOCR_imageonly}</dd>
            <#if isServerOCR == true>
              <dt>${msg.optionLabel_DefaultOCR_searchableByDevice}</dt>
              <dd>${msg.optionLabelHint_DefaultOCR_searchableByDevice}</dd>
              <dt>${msg.optionLabel_DefaultOCR_searchableByServer}</dt>
              <dd>${msg.optionLabelHint_DefaultOCR_searchableByServer}</dd>
            <#else>
              <dt>${msg.optionLabel_DefaultOCR_searchable}</dt>
              <dd>${msg.optionLabelHint_DefaultOCR_searchable}</dd>
            </#if>
          </dl>
          </span>
        </label>
        <select id="ocr" name="ocr">
          <#if isServerOCR == true>
            <option value="IMAGE_ONLY" <@optionselected "IMAGE_ONLY" buttonxml.@ocr/> >${msg.optionLabel_DefaultOCR_imageonly}</option>
            <option value="SEARCHABLE_IMAGE" <@optionselected "SEARCHABLE_IMAGE" buttonxml.@ocr/> >${msg.optionLabel_DefaultOCR_searchableByDevice}</option>
            <option value="SEARCHABLE_IMAGE_SERVER" <@optionselected "SEARCHABLE_IMAGE_SERVER" buttonxml.@ocr/> >${msg.optionLabel_DefaultOCR_searchableByServer}</option>
          <#else>
            <#list mfdxml["scan[@name='scan_ocr']/option"] as option>
              <option value="${option.@value}" <@optionselected option.@value buttonxml.@ocr/> ><@getMDFOptionLabel option.@value/></option>
            </#list>
          </#if>
        </select>
      </li>

      <li id="scanformatsettings">
        <label for="format" class="label-required labeltip">${msg.propLabel_DefaultFormat}
          <span class="smallipopHint">${msg.propHelp_DefaultFormat}
          <dl>
            <dt>${msg.optionLabel_DefaultFormat_pdf}</dt>
            <dd>${msg.optionLabelHint_DefaultFormat_pdf}</dd>
            <dt>${msg.optionLabel_PDF_A}</dt>
            <dd>${msg.optionLabelHint_PDF_A}</dd>
            <dt>${msg.optionLabel_MRC_PDF}</dt>
            <dd>${msg.optionLabelHint_MRC_PDF}</dd>
            <dt>${msg.optionLabel_MRC_PDF_A}</dt>
            <dd>${msg.optionLabelHint_MRC_PDF_A}</dd>
          </dl>
          </span>
        </label>

        <#assign isMRCDisabled><#if buttonxml.@scanColor = "BLACK_AND_WHITE">disabled="disabled"</#if></#assign>

        <select id="format" name="format">
          <option value="PDF" <@optionselected "PDF" buttonxml.@format/> >${msg.optionLabel_DefaultFormat_pdf}</option>
          <option class="pdfa_only" value="PDFA-1b" <@optionselected "PDFA-1b" buttonxml.@format/> >${msg.optionLabel_PDF_A}</option>
          <option class="mrc_only" value="MRC-PDF" <@optionselected "MRC-PDF" buttonxml.@format/> ${isMRCDisabled} >${msg.optionLabel_MRC_PDF}</option>
          <option class="mrc_only" value="MRC-PDFA-1b" <@optionselected "MRC-PDFA-1b" buttonxml.@format/> ${isMRCDisabled} >${msg.optionLabel_MRC_PDF_A}</option>
          <#--
          <#list mfdxml["scan[@name='scan_format']/option"] as option>
            <option value="${option.@value}" <@optionselected option.@value buttonxml.@format/> ><@getMDFOptionLabel option.@value/></option>
          </#list>
          -->
        </select>
      </li>

      <li>
        <label for="resolution" class="label-required labeltip">${msg.propLabel_DefaultResolution}
          <span class="smallipopHint">${msg.propHelp_DefaultResolution}
          <dl>
            <dt>${msg.optionLabel_DefaultResolution_300x300}</dt>
            <dd>${msg.optionLabelHint_DefaultResolution_300x300}</dd>
            <dt>${msg.optionLabel_DefaultResolution_200x200}</dt>
            <dd>${msg.optionLabelHint_DefaultResolution_200x200}</dd>
          </dl>
          </span>
        </label>
        <select id="resolution" name="resolution">
        <#list mfdxml["scan[@name='scan_res']/option"] as option>
          <option value="${option.@value}" <@optionselected option.@value buttonxml.@res/> ><@getMDFOptionLabel option.@value/></option>
        </#list>
        </select>
      </li>

      <li>
        <label for="scanColor" class="label-required labeltip" title="${msg.propHelp_scanColor}">${msg.propLabel_scanColor}</label>
        <select id="scanColor" name="scanColor">
          <option value="AUTO" <@optionselected "AUTO" buttonxml.@scanColor/> >${msg.scanColorOption_AUTO}</option>
          <option value="FULL_COLOR" <@optionselected "FULL_COLOR" buttonxml.@scanColor/> >${msg.scanColorOption_FULL_COLOR}</option>
          <option value="GRAYSCALE" <@optionselected "GRAYSCALE" buttonxml.@scanColor/> >${msg.scanColorOption_GRAYSCALE}</option>
          <option value="BLACK_AND_WHITE" <@optionselected "BLACK_AND_WHITE" buttonxml.@scanColor/> >${msg.scanColorOption_BLACK_AND_WHITE}</option>
        </select>
      </li>

      <#assign exportScanSettingsState><#if buttonxml.@exportScanSetting = "true">checked=checked</#if></#assign>
      <li class="scanType_nfolder scanType_coll scanType_email"><label for="exportScanSetting" class="labeltip" title="${msg.propHelp_ExportScanSettings}">${msg.propLabel_ExportScanSettings}</label>
        <input type="checkbox" id="exportScanSetting" name="exportScanSetting" value="true" ${exportScanSettingsState} />
      </li>

      <!-- Folder & Email Scan Type Fields -->
      <#assign exportMetaState><#if buttonxml.@exportMeta = "true">checked=checked</#if></#assign>
      <li class="scanType_nfolder scanType_email" style="${folderAndEmailFieldsVisibility}"><label for="exportMeta" class="labeltip" title="${msg.propNote_exportMeta}">${msg.propLabel_exportMeta}</label>
        <input type="checkbox" id="exportMeta" name="exportMeta" value="true" ${initFolderAndEmailFieldsEnabled} ${exportMetaState} />
      </li>

      <#assign browseCollectionState><#if buttonxml.@browseCollection = "true">checked=checked</#if></#assign>
      <li class="scanType_nfolder scanType_coll" style="${initFolderAndCollectionFieldsVisibility}"><label for="browseCollection" class="labeltip" title="${msg.propNote_browseCollection}">${msg.propLabel_browseCollection}</label>
        <input type="checkbox" id="browseCollection" name="browseCollection" value="true" ${initFolderAndCollectionFieldsEnabled} ${browseCollectionState} />
      </li>

      <#-- Wait for scan confirmation -->
      <#assign scanConfirmationState><#if buttonxml.@scanConfirmation = "true">checked=checked</#if></#assign>
      <li class="scanType_nfolder scanType_coll scanType_email"><label for="scanConfirmation" class="labeltip" title="${msg.propNote_scanConfirmation}">${msg.propLabel_scanConfirmation}</label>
        <input type="checkbox" id="scanConfirmation" name="scanConfirmation" value="true"  ${scanConfirmationState} />
      </li>     

    </ul>
  </fieldset>

  <#-- Handle email scan type setup on intital page load, where the propertysettings table is hidden if metadata export is turned off -->
  <#assign initpropertytablevisibility = ""/>
  <#assign initdoctypestate = "" />
  <#if (buttonxml.@scanType = "Email" || buttonxml.@scanType = "Folder") && buttonxml.@exportMeta == "false">
    <#assign initpropertytablevisibility>display:none</#assign>
    <#assign initdoctypestate>disabled="disabled"</#assign>
  </#if>

  <fieldset id="propertysettings">
    <h3>${msg.fieldsettings_title}</h3>
    <p>${msg.fieldsettings_desc}</p>
    
    <fieldset id="doctype_wrapper" style="${initpropertytablevisibility}">
      <ul>
        <li>
          <label for="docType" class="labeltip" title="${msg.propLabelHint_doctype}">${msg.propLabel_doctype}</label>
            <select id="docType" name="docType" curval="${buttonxml.@documentType}" ${initdoctypestate} />
              <#list EIP_DSData.getDocumentObjectList() as map>
                <#list map?keys as entry>
                <#if map[entry] != "com.xerox.xcm.falcon.EmailMessageDocument">
                  <option value="${map[entry]}" <@isOptionSelected buttonxml.@documentType map[entry]/> >${entry}</option>
                </#if>
                </#list>
              </#list>
          </select>
        </li>

        <#assign initAutofillVisibility = ""/>
        <#if config["DBAgent[documentType='${buttonxml.@documentType}']"]?has_content = false>
          <#assign initAutofillVisibility>display:none</#assign>
        </#if>

        <li id="autofill_profile_wrapper" style="${initAutofillVisibility}">
          <label for="dbAgent" class="labeltip" title="${msg.propLabelHint_autoFillProfile}">${msg.propLabel_autoFillProfile}</label>
          <select id="dbAgent" name="dbAgent" curval="${buttonxml.@dbAgent}">
            <option value="">${msg.optionLabel_autoFillProfile_noProfile}</option>
            <#assign initDocType><#if buttonxml.@documentType = "">${EIP_DSData.getDocumentObjectList()[0]?values[0]}<#else>${buttonxml.@documentType}</#if></#assign>
            <#list config["DBAgent[documentType='${initDocType}']"] as dbAgent>
              <option value="${dbAgent.name}" <@isOptionSelected buttonxml.@dbAgent dbAgent.name/> >${dbAgent.name}</option>
            </#list>
          </select>
        </li>
      </ul>
    </fieldset>
    
      <table id="fieldlisttable" cellpadding="0" cellspacing="0">
        <thead>
          <tr>
            <th><label for="prop" class="labeltip" title="${msg.propLabelHint_propName}">${msg.propLabel_propName}</label></th>
            <th><label for="default_value" class="labeltip" title="${msg.propLabelHint_defaultValue}">${msg.propLabel_defaultValue}</label></th>
            <th>
              <label for="display_option" class="labeltip">${msg.propLabel_displayOptions}
                <span class="smallipopHint">${msg.propLabelHint_displayOptions}
                <dl>
                  <dt>${msg.optionLabel_displayOptions_readonly}</dt>
                  <dd>${msg.optionLabelHint_displayOptions_readonly}</dd>
                  <dt>${msg.optionLabel_displayOptions_editable}</dt>
                  <dd>${msg.optionLabelHint_displayOptions_editable}</dd>
                  <dt>${msg.optionLabel_displayOptions_editablerequired}</dt>
                  <dd>${msg.optionLabelHint_displayOptions_editablerequired}</dd>
                  <dt>${msg.optionLabel_displayOptions_hidden}</dt>
                  <dd>${msg.optionLabelHint_displayOptions_hidden}</dd>
                </dl>
                </span>
              </label>
            </th>
            <th>
              <label for="append_info" class="labeltip">${msg.propLabel_AppendInfo}
                <span class="smallipopHint">${msg.propLabelHint_AppendInfo}
                <dl>
                  <dt>${msg.optionLabel_AppendInfo_none}</dt>
                  <dd>${msg.optionLabelHint_AppendInfo_none}</dd>
                  <dt>${msg.optionLabel_AppendInfo_none_folder}</dt>
                  <dd>${msg.optionLabelHint_AppendInfo_none_folder}</dd>                  
                  <dt>${msg.optionLabel_AppendInfo_timestamp}</dt>
                  <dd>${msg.optionLabelHint_AppendInfo_timestamp}</dd>
                  <dt>${msg.optionLabel_AppendInfo_number}</dt>
                  <dd>${msg.optionLabelHint_AppendInfo_number}</dd>
                  <dt>${msg.optionLabel_AppendInfo_CurrentYear}</dt>
                  <dd>${msg.optionLabelHint_AppendInfo_CurrentYear}</dd>
                  <dt>${msg.optionLabel_AppendInfo_CurrentMonth}</dt>
                  <dd>${msg.optionLabelHint_AppendInfo_CurrentMonth}</dd>
                  <dt>${msg.optionLabel_AppendInfo_CurrentDayOfMonth}</dt>
                  <dd>${msg.optionLabelHint_AppendInfo_CurrentDayOfMonth}</dd>
                  <dt>${msg.optionLabel_AppendInfo_CurrentDayOfWeek}</dt>
                  <dd>${msg.optionLabelHint_AppendInfo_CurrentDayOfWeek}</dd>
                  <dt>${msg.optionLabel_AppendInfo_Username}</dt>
                  <dd>${msg.optionLabelHint_AppendInfo_Username}</dd>
                  <dt>${msg.optionLabel_AppendInfo_Firstname}</dt>
                  <dd>${msg.optionLabelHint_AppendInfo_Firstname}</dd>
                  <dt>${msg.optionLabel_AppendInfo_Lastname}</dt>
                  <dd>${msg.optionLabelHint_AppendInfo_Lastname}</dd>
                  <dt>${msg.optionLabel_AppendInfo_Fullname}</dt>
                  <dd>${msg.optionLabelHint_AppendInfo_Fullname}</dd>
                </dl>
                </span>
              </label>
            </th>
            <th class="appendloc">
              <label for="append_location" class="labeltip">${msg.propLabel_appendLoc}
                <span class="smallipopHint">${msg.propLabelHint_appendLoc}
                <dl>
                  <dt>${msg.optionLabel_appendLoc_after}</dt>
                  <dd>${msg.optionLabelHint_appendLoc_after}</dd>
                  <dt>${msg.optionLabel_appendLoc_before}</dt>
                  <dd>${msg.optionLabelHint_appendLoc_before}</dd>
                </dl>
                </span>
              </label>
            </th>
            <th class="actions"></th>
          </tr>
        </thead>
        <tbody id="field_list">
          <#-- Generate the list of metadata properties found in the button xml data -->
          <#list buttonxml.metadata as field>
            <#assign isRequired><#if (field.@require = 'true' || buttonxml["subCollection[@type='${field.@name}']"][0]??) && field.@type != 'writerequired'>required</#if></#assign>
            <#assign isRequiredBySubCol><#if buttonxml["subCollection[@type='${field.@name}']"][0]??>true<#else>false</#if></#assign>
            <#assign isRequiredBySubColBadgeVis><#if isRequiredBySubCol = "false">display:none</#if></#assign>
            <#assign isMenu><#if field.@menu != "">true<#else>false</#if></#assign>
            <#assign isMenuAgent><#if field.@menuAgent !="">true<#else>false</#if></#assign>
            <#assign isAutoProfileMappedField = "false"/>
            <#assign isAutoProfileMappedFieldClass = ""/>
            <#assign isRequiredByAutoFillProfile = 'false'/>
            <#assign isDependentMenu><#if field.@dependentMenuProfile != "">true<#else>false</#if></#assign>
            <#assign displayMenuAgentMenu = "display:none" />
            <#assign afpbadgetitle = ""/>
            <#assign hasMenu><#if config["MenuAgent[documentType='${buttonxml.@documentType}' and property='${field.@name}']/name"][0]??>true<#else>false</#if></#assign>
            <#assign hasDependentMenuSets = "false"/>

            <#-- check to see if this field is assigned to an ODBC menu -->
            <#if hasMenu="true"><#assign displayMenuAgentMenu = ""/></#if>

            <#-- check to see if this field is mapped to the selected autofill profile AND is an output property -->
            <#if config["DBAgent[documentType='${buttonxml.@documentType}' and name='${buttonxml.@dbAgent}']/columns/column[@dsProperty='${field.@name}']"][0]??>
              <#assign isAutoProfileMappedFieldClass ="autofill-mapped-prop"/>
              <#assign isAutoProfileMappedField = "true"/>
              <#assign displayMenuAgentMenu = "display:none" />
              <#assign afpbadgetitle = "${msg.autofillProfile_isMappedField}"/>
            </#if>

            <#-- check to see if this field is mapped to the selected autofill profile AND is a primary key-->
            <#if config["DBAgent[documentType='${buttonxml.@documentType}' and name='${buttonxml.@dbAgent}']/columns/column[@dsProperty='${field.@name}' and @primary='true']"][0]??>
              <#assign isRequiredByAutoFillProfile = 'true'/>
              <#if hasMenu="true"><#assign displayMenuAgentMenu = ""/></#if>
              <#assign isAutoProfileMappedFieldClass ="autofill-mapped-prop-required"/>
              <#assign afpbadgetitle = "${msg.autofillProfile_isMappedFieldRequired}"/>
            </#if>

            <#assign disabledByMenuProp><#if isMenu = "true" || isMenuAgent = "true" || isAutoProfileMappedField = "true" || isDependentMenu = "true">disabled="disabled"</#if></#assign>
            <#assign enabledByMenuProp><#if isMenu == "false" && isMenuAgent == "false" && isAutoProfileMappedField == "false">disabled="disabled"</#if></#assign>

            <tr id="proprow_${field.@name}" class="${isAutoProfileMappedFieldClass}">
              <td>
                <span class="afpmappedbadge" title="${afpbadgetitle}"><span class="smallipopHint">${afpbadgetitle}</span></span>
                <#if field.@require = 'true' || isRequiredByAutoFillProfile = 'true'>
                  <span class="label display_name meta_requiredbyafp" id="label_${field.@name}" dsname="${field.@name}"></span>
                  <#if buttonxml.@scanType = "Folder" && field.@name = "com.xerox.xcm.elf.Displayable.title">
                    <span class="filename_tag">${msg.propLabel_networkfilename}</span>
                  <#elseif buttonxml.@scanType = "Email" && field.@name = "com.xerox.xcm.elf.Displayable.title">
                    <span class="filename_tag">${msg.propLabel_emailfilename}</span>
                  <#else>
                    <span class="filename_tag" style="display:none" >${msg.propLabel_networkfilename}</span>
                  </#if>
                  <span class="required_tag">
                  <#if field.@require = 'true' && isRequiredByAutoFillProfile = 'false'>
                    ${msg.fieldlist_requiredtag}
                  <#elseif isRequiredByAutoFillProfile = 'true'>
                    ${msg.propRequiredbyAFP}
                  </#if>
                  </span>
                  <input id="prop_${field.@name}" name="metaName[]" class="meta_name" type="hidden" value="${field.@name}" />
                <#elseif isAutoProfileMappedField="true">
                  <span class="label display_name meta_optionalforafp" id="label_${field.@name}" dsname="${field.@name}"></span>
                  <input id="prop_${field.@name}" name="metaName[]" class="meta_name" type="hidden" value="${field.@name}" />
                <#else>
                  <select id="prop_${field.@name}" name="metaName[]" class="propchooser meta_name" seldsprop="${field.@name}"></select>
                  <span class="requiredBySubCol_tag" style="${isRequiredBySubColBadgeVis}">${msg.propRequiredbySubFolder}</span>
                </#if>
                  <input id="require_${field.@name}" name="metaRequire[]" class="meta_require" type="hidden" value="${field.@require}"/>
                  <input id="dependentMenuProfile_${field.@name}" class="meta-dmprofile" name="dependentMenuProfile[]" type="hidden" value="${field.@dependentMenuProfile}"/>
                  <input id="menuAgent_${field.@name}" name="menuAgent[]" class="meta-menuagent" type="hidden" value="${field.@menuAgent}" />
                  
    
                  <div class="odbc-menu-wrapper" style="${displayMenuAgentMenu}">
                    <label class="odbc-menu-label" for="odbcmenu_${field.@name}" title="${msg.menuAgentTip}">${msg.menuAgentLabel}</label>

                    <#-- Setup preval and preval attributes for the odbc menu -->
                    <#assign odbcmenu_preval = ""/>
                    <#assign odbcmenu_prevaltype = ""/>

                    <#if field.@dependentMenuProfile != "">
                      <#assign odbcmenu_preval = field.@dependentMenuProfile />
                      <#assign odbcmenu_prevaltype = "dependentmenuset" />
                    <#elseif field.@menuAgent != "">
                      <#assign odbcmenu_preval = field.@menuAgent />
                      <#assign odbcmenu_prevaltype = "simplemenu" />
                    </#if>

                    <select id="odbcmenu_${field.@name}" class="odbc-menu" preval="${odbcmenu_preval}" prevaltype="${odbcmenu_prevaltype}">
                      <option value="">${msg.menuAgent_none}</option>
                      <optgroup label="${msg.odbcMenu_optgrouplabel_simplemenu}">
                      <#list config["MenuAgent[documentType='${buttonxml.@documentType}' and property='${field.@name}']/name"] as MenuAgentName>
                        <option odbctype="simplemenu" value="${MenuAgentName}" <@isOptionSelected field.@menuAgent MenuAgentName/> >${MenuAgentName}</option>
                      </#list>
                      </optgroup>
                      
                      <#-- Determine if Depenent Menu Sets are available for this property... -->
                      <#list config["MenuAgent[documentType='${buttonxml.@documentType}' and property='${field.@name}']/name"] as MenuAgentName>
                        <#list config["DependentMenuProfile//menuAgent[not(. = preceding::menuAgent)]"] as menu>
                          <#if menu == MenuAgentName>
                            <#assign hasDependentMenuSets = "true"/>
                            <#break>
                          </#if>
                        </#list>
                      </#list>

                      <#if hasDependentMenuSets = "true">
                        <optgroup label="${msg.odbcMenu_optgrouplabel_dmsets}">
                          <#list config["MenuAgent[documentType='${buttonxml.@documentType}' and property='${field.@name}']/name"] as MenuAgentName>
                            <#list config["DependentMenuProfile//menuAgent[not(. = preceding::menuAgent)]"] as menu>
                              <#if menu == MenuAgentName>
                                <#list config["DependentMenuProfile//menuAgent[text()='${menu}']/.."] as set>
                                <option odbctype="dependentmenuset" value="${set.@name?xml}" <@isOptionSelected field.@dependentMenuProfile set.@name?xml /> >${set.@name?xml}</option>
                                </#list>
                              </#if>
                            </#list>
                          </#list>
                        </optgroup>
                      </#if>

                    </select>
                </div>
              </td>
              <td>
                <#if isMenu == "true" || isMenuAgent == "true" || field.@dependentMenuProfile != "">
                  <input id="defaultvalue_${field.@name}" name="metaValue[]" class="meta_defaultvalue defaultval ${isRequired} dv-string" type="text" value="" disabled="disabled" style="display:none" />

                  <#assign odbc_defaultmenu_class = ""/>
                  <#if isMenuAgent == "true">
                    <#assign odbc_defaultmenu_class = "odbc-sm" />
                  <#elseif field.@dependentMenuProfile != "">
                    <#assign odbc_defaultmenu_class ="odbc-dm" />
                  </#if>
                  <select id="defaultvaluemenu_${field.@name}" name="metaValue[]" class="meta_defaultvaluemenu defaultval dv-menu ${odbc_defaultmenu_class}">
                    <#-- Load DocuShare Menu Options -->
                    <#if isMenu == "true">
                      <#list field.@menu?split("||") as opt>
                        <option value="${opt?split(':')[0]}" <@isOptionSelected opt?split(':')[0] field.@value/> >${opt?split(':')[1]}</option>
                      </#list>
                    <#-- Load DataSource Menu Options -->
                    <#elseif isMenuAgent == "true">
                      <#list activeMenuAgents["agent[@name='${field.@menuAgent}']/menu/@value"]?split("||") as opt>
                        <option value="${opt?split(':')[0]}" <@isOptionSelected opt?split(':')[0] field.@value/> >${opt?split(':')[1]}</option>
                      </#list>
                    </#if>
                  </select>

                <#else>
                  <#assign isDefaultValueTextBoxRequired ="" />
                  <#assign afpmappedfield_hintclass =""/>
                  <#assign afpmappedfield_readonly =""/>
                  <#if isAutoProfileMappedField = "true" && isRequiredByAutoFillProfile = "false">
                    <#assign afpmappedfield_hintclass = "textboxhint" />
                    <#assign afpmappedfield_readonly = "readonly='readonly'" />
                  <#else>
                    <#assign isDefaultValueTextBoxRequired = isRequired />
                  </#if>
                  <span class="inputhintwrapper ${afpmappedfield_hintclass}">
                    <input id="defaultvalue_${field.@name}" name="metaValue[]" class="meta_defaultvalue dv-string defaultval ${isDefaultValueTextBoxRequired}" type="text" value="${field.@value}" ${afpmappedfield_readonly} />
                    <span class="smallipopHint">${msg.afp_mappedfield_defaultval_hint}</span>
                  </span>
                  <select id="defaultvaluemenu_${field.@name}" name="metaValue[]" class="meta_defaultvaluemenu dv-menu defaultval" disabled="disabled" style="display:none"/>
                </#if>
                <input id="menu_${field.@name}" name="metaMenu[]" class="meta_menu" type="hidden" value="${field.@menu}"/>
              </td>
              <td>
                <#assign afpdisplaystate><#if isAutoProfileMappedField = "true" && isRequiredByAutoFillProfile = 'false'>style="display:none"</#if></#assign>
                <select id="type_${field.@name}" class="meta_type" name="metaType[]">
                  <option value="read" <@optionselected field.@type "read"/> >${msg.optionLabel_displayOptions_readonly}</option>
                   <#if field.@require = 'false'><option value="write" ${afpdisplaystate} <@optionselected field.@type "write"/> >${msg.optionLabel_displayOptions_editable}</option></#if>
                  <option value="writerequired" ${afpdisplaystate} <@optionselected field.@type "writerequired"/> >${msg.optionLabel_displayOptions_editablerequired}</option>
                  <option value="hidden" <@optionselected field.@type "hidden"/> >${msg.optionLabel_displayOptions_hidden}</option>
                </select>
              </td>

              <td>
                <#assign disabledByEmail><#if buttonxml.@scanType = "Email" && field.@type = "writerequired">disabled='disabled'</#if></#assign>

                <#assign concat_emptylabel><#if buttonxml.@scanType = "Folder">${msg.optionLabel_AppendInfo_none_folder}<#else>${msg.optionLabel_AppendInfo_none}</#if></#assign>

                <select id="concat_type_${field.@name}" name="metaConcatType[]" class="menu_concat_type" ${disabledByMenuProp} ${disabledByEmail}>
                  
                  <option value="" <@optionselected field.@metaConcatType ""/> style="<@concat_options_vis field.@name buttonxml.@scanType field.@type ''/>" >${concat_emptylabel}</option>
                  <option value="date" <@optionselected field.@metaConcatType "date"/> style="<@concat_options_vis field.@name buttonxml.@scanType field.@type 'date'/>" >${msg.optionLabel_AppendInfo_timestamp}</option>
                  <option value="autoCount" <@optionselected field.@metaConcatType "autoCount"/> style="<@concat_options_vis field.@name buttonxml.@scanType field.@type 'autoCount'/>" >${msg.optionLabel_AppendInfo_number}</option>

                  <option value="year" <@optionselected field.@metaConcatType "year"/> style="<@concat_options_vis field.@name buttonxml.@scanType field.@type 'year'/>">${msg.optionLabel_AppendInfo_CurrentYear}</option>
                  <option value="month" <@optionselected field.@metaConcatType "month"/> style="<@concat_options_vis field.@name buttonxml.@scanType field.@type 'month'/>">${msg.optionLabel_AppendInfo_CurrentMonth}</option>
                  <option value="day" <@optionselected field.@metaConcatType "day"/> style="<@concat_options_vis field.@name buttonxml.@scanType field.@type 'day'/>">${msg.optionLabel_AppendInfo_CurrentDayOfMonth}</option>
                  <option value="weekday" <@optionselected field.@metaConcatType "weekday"/> style="<@concat_options_vis field.@name buttonxml.@scanType field.@type 'weekday'/>">${msg.optionLabel_AppendInfo_CurrentDayOfWeek}</option>
                  <option value="userLogin" <@optionselected field.@metaConcatType "userLogin"/> style="<@concat_options_vis field.@name buttonxml.@scanType field.@type 'userLogin'/>">${msg.optionLabel_AppendInfo_Username}</option>
                  <option value="userFirstName" <@optionselected field.@metaConcatType "userFirstName"/> style="<@concat_options_vis field.@name buttonxml.@scanType field.@type 'userFirstName'/>">${msg.optionLabel_AppendInfo_Firstname}</option>
                  <option value="userLastName" <@optionselected field.@metaConcatType "userLastName"/> style="<@concat_options_vis field.@name buttonxml.@scanType field.@type 'userLastName'/>">${msg.optionLabel_AppendInfo_Lastname}</option>
                  <option value="userFullName" <@optionselected field.@metaConcatType "userFullName"/> style="<@concat_options_vis field.@name buttonxml.@scanType field.@type 'userFullName'/>">${msg.optionLabel_AppendInfo_Fullname}</option>

                </select>
                <input id="concat_type_novalue_${field.@name}" name="metaConcatType[]" class="menu_concat_type_novalue" type="hidden" value="" ${enabledByMenuProp} >
                <input id="concat_char_${field.@name}" name="metaConcatSeparator[]" type="hidden" value="${field.@metaConcatSeparator}">
                <input id="concat_value_${field.@name}" name="metaConcatValue[]" type="hidden" value="${field.@metaConcatValue}">
              </td>

              <td class="appendloc">
                <select id="concat_location_${field.@name}" name="metaConcatLocation[]" class="metaConcatLocMenu" <@isConcatLocationDisabled field "menu"/> >
                  <option value="after" <@optionselected field.@metaConcat "after"/> >${msg.optionLabel_appendLoc_after}</option>
                  <option value="before" <@optionselected field.@metaConcat "before"/> >${msg.optionLabel_appendLoc_before}</option>
                </select>
                <input type="hidden" id="concat_location_hidden_${field.@name}" class="metaConcatLocHidden" name="metaConcatLocation[]" value="" <@isConcatLocationDisabled field "hidden"/> >
              </td>

              <td class="actions"><#if (field.@require != 'true' && isRequiredByAutoFillProfile != 'true' && isAutoProfileMappedField !="true") || isRequiredBySubCol == "true"><button type="button" class="removefield btn_danger">${msg.btn_removefield}</button></#if>
              </td>
            </tr>
          </#list>
        </tbody>
      </table>

      <!-- Required and Optional Field Row Templates -->
      <table id="field_list_template">
        <@fieldlist_template "optional"/>
        <@fieldlist_template "required"/>
      </table>
      
      <div id="field_list_footer" style="${initpropertytablevisibility}"><button type="button" id="addfieldrow">${msg.btn_addfield}</button></div>



  </fieldset>


  <!-- Scan to Collection Sub-Folder Options -->
  <fieldset id="subCollectionSettings" style="${colFieldsVisibility}">
    <h3>${msg.subFolderSection_title}</h3>
    <p>${msg.subFolderSection_subtitle}</p>
    <ul id="subCollectionPathTemplate">
      <li id="subfolder-rootlabel">${msg.subFolderCollectionLabel_none}</li>
      <#if buttonxml.@scanType = "DocuShare" && buttonxml.subCollection[0]??>
        <li><@subfolderSelectMenuOptions buttonxml.subCollection[0].@type initCollFieldsEnabled/></li>
        <li><@subfolderSelectMenuOptions buttonxml.subCollection[1].@type initCollFieldsEnabled/></li>
        <li><@subfolderSelectMenuOptions buttonxml.subCollection[2].@type initCollFieldsEnabled/></li>
      <#else>
        <li><@subfolderSelectMenu/></li>
        <li><@subfolderSelectMenu/></li>
        <li><@subfolderSelectMenu/></li>
      </#if>
    </ul>
  </fieldset>

</#macro>



<#-- The Fieldlist Row Template -->
<#macro fieldlist_template type>
  <#assign id><#if type="required">fieldlist_rowtemplate_required<#else>fieldlist_rowtemplate</#if></#assign>
  <#assign isRequired><#if type="required">true<#else>false</#if></#assign>
  <#assign isRequiredClass><#if type="required">required</#if></#assign>
        <tbody id="${id}">
          <tr>
            <td>
              <#if type="required">
                <span class="afpmappedbadge"><span class="smallipopHint">${msg.autofillProfile_isMappedField}</span></span>
                <span class="label display_name" id="" dsname=""></span>
                <span class="filename_tag" style="display:none">${msg.propLabel_networkfilename}</span>
                <span class="required_tag">${msg.fieldlist_requiredtag}</span>
                <input id="prop_" name="metaName[]" class="meta_name" value="" type="hidden" disabled="disabled"/>
              <#else>
                <span class="afpmappedbadge"><span class="smallipopHint">${msg.autofillProfile_isMappedField}</span></span>
                <select id="prop_" name="metaName[]" class="propchooser meta_name" disabled="disabled"></select>
                <span class="requiredBySubCol_tag" style="display:none">${msg.propRequiredbySubFolder}</span>
              </#if>
              <input id="require_" name="metaRequire[]" type="hidden" class="meta_require" value="${isRequired}" disabled="disabled"/>
              <input id="dependentMenuProfile_" name="dependentMenuProfile[]" class="meta-dmprofile" type="hidden" value="" disabled="disabled" />
              <input id="menuAgent_" name="menuAgent[]" class="meta-menuagent" type="hidden" value="" disabled="disabled"/>
              <div class="odbc-menu-wrapper" style="display:none">
                <label class="odbc-menu-label" for="odbcmenu_" title="${msg.menuAgentTip}">${msg.menuAgentLabel}</label>
                <select id="odbcmenu_" class="odbc-menu" disabled="disabled">
                  <option value="">${msg.menuAgent_none}</option>
                </select>
              </div>
            </td>
            <td>
              <span class="inputhintwrapper">
                <input id="defaultvalue_" name="metaValue[]" type="text" class="meta_defaultvalue ${isRequiredClass} defaultval" value="" disabled="disabled" style="display:none"/>
                <span class="smallipopHint">${msg.afp_mappedfield_defaultval_hint}</span>
              </span>
              <select id="defaultvaluemenu_" name="metaValue[]" class="meta_defaultvaluemenu defaultval" disabled="disabled" style="display:none"/>
              <input id="menu_" name="metaMenu[]" class="meta_menu" disabled="disabled" type="hidden" value=""/>
            </td>
            <td>
              <select id="type_" name="metaType[]" class="meta_type" disabled="disabled">
                <option value="read">${msg.optionLabel_displayOptions_readonly}</option>
                <#if isRequired = "false"><option value="write">${msg.optionLabel_displayOptions_editable}</option></#if>
                <option value="writerequired">${msg.optionLabel_displayOptions_editablerequired}</option>
                <option value="hidden">${msg.optionLabel_displayOptions_hidden}</option>
              </select>
            </td>
            <td>
              <select id="concat_type_" name="metaConcatType[]" class="menu_concat_type" disabled="disabled">
                <option value="">${msg.optionLabel_AppendInfo_none}</option>
                <option value="date">${msg.optionLabel_AppendInfo_timestamp}</option>
                <option value="autoCount">${msg.optionLabel_AppendInfo_number}</option>
                <option value="year">${msg.optionLabel_AppendInfo_CurrentYear}</option>
                <option value="month">${msg.optionLabel_AppendInfo_CurrentMonth}</option>
                <option value="day">${msg.optionLabel_AppendInfo_CurrentDayOfMonth}</option>
                <option value="weekday">${msg.optionLabel_AppendInfo_CurrentDayOfWeek}</option>
                <option value="userLogin">${msg.optionLabel_AppendInfo_Username}</option>
                <option value="userFirstName">${msg.optionLabel_AppendInfo_Firstname}</option>
                <option value="userLastName">${msg.optionLabel_AppendInfo_Lastname}</option>
                <option value="userFullName">${msg.optionLabel_AppendInfo_Fullname}</option>
              </select>
              <input id="concat_type_novalue_" name="metaConcatType[]" class="menu_concat_type_novalue" type="hidden" value="" disabled="disabled">
              <input id="concat_char_" name="metaConcatSeparator[]" type="hidden" value="-" disabled="disabled">
              <input id="concat_value_" name="metaConcatValue[]" type="hidden" value="" disabled="disabled">
            </td>
            <td class="appendloc">
              <select id="concat_location_" name="metaConcatLocation[]" disabled="disabled" class="metaConcatLocMenu">
                <option value="after">${msg.optionLabel_appendLoc_after}</option>
                <option value="before">${msg.optionLabel_appendLoc_before}</option>
              </select>
              <input id="concat_location_hidden_" name="metaConcatLocation[]" type="hidden" value="" disabled="disabled" class="metaConcatLocHidden"/>
            </td>
            <#if type="required">
              <td class="actions"></td>
            <#else>
              <td class="actions"><button type="button" class="removefield btn_danger">${msg.btn_removefield}</button></td>
            </#if>
          </tr>
        </tbody>
</#macro>




<#-- Edit Properties for Scan button -->
<#macro body_editpermissions>
  <#assign optsdisplay><#if buttonxml.@guest == "true">display:none</#if></#assign>
  <fieldset>
    <ul>
      <li>
        <label for="accessTypeMenu" title="${msg.propLabelHint_accessMethod}" class="labeltip">${msg.propLabel_accessMethod}
          <span class="smallipopHint">${msg.propLabelHint_accessMethod}
          <dl>
            <dt>${msg.optionLabel_accessMethod_guest}</dt>
            <dd>${msg.optionLabelHint_accessMethod_guest}</dd>
            <dt>${msg.optionLabel_accessMethod_group}</dt>
            <dd>${msg.optionLabelHint_accessMethod_group}</dd>
          </dl>
          </span>
        </label>
        <select id="accessTypeMenu">
          <option value="guest" <@optionselected "true" buttonxml.@guest /> >${msg.optionLabel_accessMethod_guest}</option>
          <option value="account" <@optionselected "false" buttonxml.@guest /> >${msg.optionLabel_accessMethod_group}</option>
        </select>
      </li>
      <li>
        <ul id="accessOptions" style="${optsdisplay}">

          <#if buttontype !="mfd">

            <#assign isRequired>
              <#if buttonxml.@guest == "false" && (buttonxml.@dsGroup != parentGroup)>required</#if>
            </#assign>

            <li><input name="groupHandle" id="access_inherit" type="radio" value="${parentGroup}" <@accessOption "inherit" /> ><label for="access_inherit" title="${msg.optionLabelHint_inherit}" class="labeltip">${msg.optionLabel_inherit}</label> <span id="parentGroupHandleLabel"></span></li>
            <li>
              <input name="groupHandle" id="access_specific" type="radio" value="<#if buttonxml.@dsGroup != parentGroup>${buttonxml.@dsGroup}</#if>" <@accessOption "specify" /> ><label for="access_specific" title="${msg.optionLabelHint_specificgroup}" class="labeltip">${msg.optionLabel_specificgroup}</label>
              <div class="field">
                <input id="groupHandleLabel" type="text" class="large ${isRequired}" value=""/>
                <p class="fieldnote_below">${msg.fieldnote_usergroup}</p>
              </div>
            </li>
          <#else>
            <#assign isRequired><#if buttonxml.@guest == "false">required</#if></#assign>
            <li>
              <label for="groupHandleLabel" title="${msg.optionLabelHint_specificgroup}" class="labeltip">${msg.optionLabel_specificgroup}</label>
              <div class="field">
                <input id="groupHandleLabel" type="text" class="large ${isRequired}" value=""/>
                <input type="hidden" name="groupHandle" id="groupHandle" value="${buttonxml.@dsGroup}"/>
                <p class="fieldnote_below">${msg.fieldnote_usergroup}</p>
              </div>
            </li>
          </#if>
        </ul>
      </li>
    </ul>
  </fieldset>
</#macro>


<#-- Determine currently selected value -->
<#macro optionselected setting curvalue><#if setting=curvalue>selected="selected"</#if></#macro>



<#-- Retrieve label for select menu option -->
<#macro optionlabel optionname>${optionname}</#macro>



<#--
    isConcatLocationDisabled
    Determine if the concat location menu for a specific metadata field is disabled or not on page initialization.
    args:
      concatType - (string) - the field data element.
      control - (string) UI Element that contains the concatLocation value (either "hidden" or "menu").
-->
<#macro isConcatLocationDisabled field control>
  <@compress single_line=true>

  <#if control="menu">
    <#-- disable if field is a menu, or it has NO metaConcatType...-->
    <#if field.@metaConcatType == "">disabled="disabled"</#if>

  <#elseif control="hidden">
    <#-- disable if field is NOT a menu, or it has a metaConcatType...-->
    <#if field.@metaConcatType != "">disabled="disabled"</#if>
  </#if>
  </@compress>
</#macro>



<#-- Check if the button's dsGroup is the same as it's parent.  If so, make the inherit option selected. -->
<#macro accessOption value>
  <#if buttonxml.@guest == "true" && value="inherit">checked="checked"
  <#elseif buttonxml.@guest == "false">
    <#if (buttonxml.@dsGroup == buttonData.EIPConfig["//button[@buttonId='${parentId}']/@dsGroup"] && value="inherit") ||
         (buttonxml.@dsGroup != buttonData.EIPConfig["//button[@buttonId='${parentId}']/@dsGroup"] && value="specify")>checked="checked"
    </#if>
  </#if>
</#macro>



<#--Get Select Option Translatable Labels -->
<#macro getMDFOptionLabel value>
  <#if value="SEARCHABLE_IMAGE">${msg.optionLabel_SEARCHABLE_IMAGE}
  <#elseif value="IMAGE_ONLY">${msg.optionLabel_IMAGE_ONLY}
  <#elseif value="RES_200X200">${msg.optionLabel_DefaultResolution_200x200}
  <#elseif value="RES_300X300">${msg.optionLabel_DefaultResolution_300x300}
  <#elseif value="PDF">${msg.optionLabel_DefaultFormat_pdf}
  <#else>${value}
  </#if>
</#macro>



<#-- Render a sub Collection title select menu -->
<#macro subfolderSelectMenuOptions type state>
  <span class="subfolder-backslash">/</span>
  <select class="subCollectionSelect" name="subCollectionType[]" ${state} currval="${type}">
    <option value="">${msg.subFolderSelectOption_label_none}</option>
    <optgroup class="subfolder-reqfield-optgroup" label="${msg.subFolderOptgroup_label_reqfield}"></optgroup>
    <optgroup class="subfolder-optionalfield-optgroup" label="${msg.subFolderOptgroup_label_optionalfield}"></optgroup>
    <optgroup label="${msg.subFolderOptgroup_label_datadata}">
      <option value="day" <@isOptionSelected "day" type/> >${msg.subFolderSelectOption_label_day}</option>
      <option value="weekday" <@isOptionSelected "weekday" type/> >${msg.subFolderSelectOption_label_week}</option>
      <option value="month" <@isOptionSelected "month" type/> >${msg.subFolderSelectOption_label_month}</option>
      <option value="year" <@isOptionSelected "year" type/> >${msg.subFolderSelectOption_label_year}</option>
    </optgroup>
    <optgroup label="${msg.subFolderOptgroup_label_userdata}">
      <option value="userLogin" <@isOptionSelected "userLogin" type/> >${msg.subFolderSelectOption_label_username}</option>
      <option value="userLastName" <@isOptionSelected "userLastName" type/> >${msg.subFolderSelectOption_label_lname}</option>
      <option value="userFirstName" <@isOptionSelected "userFirstName" type/> >${msg.subFolderSelectOption_label_fname}</option>
      <option value="userFullName" <@isOptionSelected "userFullName" type/> >${msg.subFolderSelectOption_label_fullname}</option>
    </optgroup>
  </select>
</#macro>


<#-- Render a disabled sub Collection title select menu for use when the loaded button is a network folder scan type.
Ready to be enabled if the type is switched to DocuShare Collection type-->
<#macro subfolderSelectMenu>
  <span class="subfolder-backslash">/</span>
  <select class="subCollectionSelect" name="subCollectionType[]" disabled="disabled" currval="">
    <option value="">${msg.subFolderSelectOption_label_none}</option>
    <optgroup class="subfolder-reqfield-optgroup" label="${msg.subFolderOptgroup_label_reqfield}"></optgroup>
    <optgroup class="subfolder-optionalfield-optgroup" label="${msg.subFolderOptgroup_label_optionalfield}"></optgroup>
    <optgroup label="${msg.subFolderOptgroup_label_datadata}">
      <option value="day">${msg.subFolderSelectOption_label_day}</option>
      <option value="weekday">${msg.subFolderSelectOption_label_week}</option>
      <option value="month">${msg.subFolderSelectOption_label_month}</option>
      <option value="year">${msg.subFolderSelectOption_label_year}</option>
    </optgroup>
    <optgroup label="${msg.subFolderOptgroup_label_userdata}">
      <option value="userLogin">${msg.subFolderSelectOption_label_username}</option>
      <option value="userLastName">${msg.subFolderSelectOption_label_lname}</option>
      <option value="userFirstName">${msg.subFolderSelectOption_label_fname}</option>
      <option value="userFullName">${msg.subFolderSelectOption_label_fullname}</option>
    </optgroup>
  </select>
</#macro>


<#-- isOptionSelected
      Determines if a select option is selected or not.
-->
<#macro isOptionSelected optval selval><#if optval = selval>selected="selected"</#if></#macro>

<#--  isIconOptionChecked_onload
      Determines if the icon settings radio button is selected or not on page load.
      args:
        radioval (string) The radio button (either default or typein.)
-->
<#macro isIconOptionChecked_onload radioval>

  <#if radioval == "default">
    <#if buttonxml.icon[0]??>
      <#if buttonxml.icon == "eip_icon.png">checked="checked"</#if>
    <#else>
      checked="checked"
    </#if>
  <#elseif radioval == "typein">
    <#if buttonxml.icon[0]??>
      <#if buttonxml.icon != "eip_icon.png">checked="checked"</#if>
    </#if>
  </#if>
</#macro>


<#-- Determines if the selected concatination option is visible or not... -->
<#macro concat_options_vis fieldname scantype fieldtype optionval>
  <@compress single_line=true>
  <#if fieldname = 'title'>
      <#if (scantype = "Folder" || scantype = "Email") && fieldtype !="writerequired" && (optionval != "" && optionval != "autoCount" && optionval != "date")>display:none
      <#elseif scantype = "Folder" && fieldtype ="writerequired" && (optionval != "date" && optionval != "")>display:none
      </#if>
  </#if>
  </@compress>
</#macro>
