<#assign mfdxml = mfdData.device_configuration["device[@name='default']"] />
<#assign config = buttonData.EIPConfig />
<#import "/locale/messages_${locale}.ftl" as msg />
<#import "StandaloneMenu.ftl" as menu />

<#-- Determine if the button is a scan, folder, or mfd service button -->
<#assign buttontype = ""/>
<#if params["type"]??>
  <#assign buttontype = params["type"][0] />
<#else>
  <#assign buttontype = "mfd"/>
</#if>

<#-- Determine the parent DocuShare Group Handle -->
<#assign parentgroup = ""/>
<#assign parentId = "0"/>

<#if params["parentId"]??>
  <#assign parentId = params["parentId"][0] />
  <#assign parentgroup = buttonData.EIPConfig["//button[@buttonId='${parentId}']/@dsGroup"] />
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

<#assign initialDocType = EIP_DSData.getDocumentObjectList()[0]?values[0]/>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta charset="utf-8" />
    <title><@msg.title_add buttontypelabel /></title>
    ${ds_admin_site_style}
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/admin_styles.css" />
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/scripts/lib/jquery-ui/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/jquery.smallipop.css" media="all" title="Screen"/>
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/image-picker.css" media="all" title="Screen"/>
    <!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/admin_ds6_ie8-7.css" /><![endif]-->

    <script src="${EIP_RealPath}/scripts/lib/jquery.js" type="text/javascript"></script>
    <script src="${EIP_RealPath}/scripts/lib/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
    <script src="${EIP_RealPath}/scripts/jquery.nimble.loader.js" type="text/javascript"></script>
    <script src="${EIP_RealPath}/scripts/jquery.smallipop.js" type="text/javascript"></script>
    <script src="${EIP_RealPath}/scripts/jquery.fix.clone.js" type="text/javascript"></script>
    <script src="${EIP_RealPath}/scripts/jquery.form.js" type="text/javascript"></script>
    <script src="${EIP_RealPath}/scripts/image-picker.js" type="text/javascript"></script>
    <script src="${EIP_RealPath}/scripts/modernizr.js" type="text/javascript"></script>
    <script src="${EIP_RealPath}/scripts/xml2json.min.js" type="text/javascript"></script>
    <script src="${EIP_RealPath}/scripts/connectkey.js" type="text/javascript"></script>
    <script>

      $(document).ready(function() {

        <#if buttontype == "scan">

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

        //List of Dependent Menu Sets grouped by Menu Agent...
        connectkey.dependentMenuSets = {<@compress single_line=true>
          <#list config["DependentMenuProfile//menuAgent[not(. = preceding::menuAgent)]"] as menu>
            "${menu}" : [<#list config["DependentMenuProfile//menuAgent[text()='${menu}']/.."] as set>"${set.@name?xml}"<#if set_has_next>,</#if></#list>]
          <#if menu_has_next>,</#if>
          </#list>
        }</@compress>

        //object literal of all properties actively mapped to a dependent menu set.
        connectkey.dmsprops = {};

        //ODBC menu labels object...
        connectkey.odbcMenuLabels = {"simplemenu":"${msg.odbcMenu_optgrouplabel_simplemenu}","dmset":"${msg.odbcMenu_optgrouplabel_dmsets}"};
        
        //Labels for Email and Network folder title property
        connectkey.metalistFilenameLabels = {"email":"${msg.propLabel_emailfilename}","folder":"${msg.propLabel_networkfilename}"};

        //Labels for the Appended Information menu
        connectkey.AppendedInfoMenuLabels = {"none" : "${msg.optionLabel_AppendInfo_none}", "uniqueid" : "${msg.optionLabel_AppendInfo_none_folder}"}
          
        //setup an empty data object for the sub-collection field control.
        $("#subCollectionSettings").data({"${EIP_DSData.getDocumentObjectList()[0]?values[0]}": ["", "", ""]});
        // put a data object on the OCR menu that tells the UI the MRC or PDFA ability of the server
        $("#ocr").data({"isServerMRC" : ${isServerMRC?string}, "isServerPDFA" : ${isServerPDFA?string}});


        //Functions to run after page load...

        //http://www.foliotek.com/devblog/make-table-rows-sortable-using-jquery-ui-sortable/
        var helperRowWidthRetainer = function(e, ui) {
          ui.children().each(function() {
              $(this).width($(this).width());
          });
          return ui;
        };
        $("#field_list").sortable({placeholder: "ui-state-highlight", helper: helperRowWidthRetainer});

        connectkey.initScanBtnAutocompleteFields();
        connectkey.loadRequiredFieldRows(); // load required field rows for the Document field list.
        connectkey.createFieldPropertyOptions("pageload"); //load optional properties


        //Event listeners to start after page load...
        $("#addButtonForm").submit(function(e){connectkey.validateForm(e, "${msg.validationErrorGeneralMsg}", '<p class="fielderror error_empty"><strong>${msg.fieldErrorTitle}</strong> ${msg.fielderror_empty}</p>', "${msg.editbtn_formsubmit_success}", "${msg.editbtn_formsubmit_error}", "${EIP_RealPath}/EIPAdmin/ConfigureButtons", null, connectkey.validateODBCSettings("${msg.afp_missingfields_error} ", "${msg.dms_missingfields_error} "));});
        $("#addfieldrow").click(function(){connectkey.addFieldRow();});
        $("#docType").change(function(e){connectkey.changeDocType(e);});
        $("#dbAgent").change(function(e){connectkey.changeAutoFillMenu(e)});
        $("#field_list").on("click", "button.removefield", function(e){connectkey.removeFieldRow(e);});
        $("#field_list").on("change", ".propchooser", function(e){connectkey.changeOrAddPropertyMenu(e.target)});
        $("#field_list").on("change", "select.menu_concat_type", function(e){connectkey.toggleConcatLocMenu(e);});
        $("#field_list").on("change", "select.meta_type", function(e){connectkey.changeMetaType(e)});
        $("#field_list").on("change", ".odbc-menu", function(e){connectkey.changeODBCMenu(e, "${EIP_RealPath}/EIPAdmin/Search?searchType=metaMenuValue&menuAgent=", "${EIP_RealPath}/EIPServer/SearchDB?searchType=queryDependencyMenus&profileName=", "${msg.menuAgent_optionsRequestError}")});
        $("#field_list").on("change", ".meta_defaultvaluemenu.odbc-dm", function(e){connectkey.changeDMDefaultMenuVal(e,"${EIP_RealPath}/EIPServer/SearchDB?searchType=queryDependencyMenus&profileName=", "${msg.menuAgent_optionsRequestError}")});
        $("#field_list").on("keyup blur", ".autofill-mapped-prop-required .meta_defaultvalue", function(e){connectkey.delayLoadAFPValues(e)});
        $("#field_list").on("change", ".autofill-mapped-prop-required .meta_defaultvaluemenu", function(e){connectkey.loadAFPValues(e)});

        $("#scanType").change(function(e){connectkey.changeScanType(e)});
        $("#ocr").change(function(e){connectkey.changeOCRType(e)});
        $("#scanColor").change(function(e){connectkey.changeScanColor(e)});
        $(".subCollectionSelect").change(function(e){connectkey.toggleOptionalFieldRequired(e)});
        $("#exportMeta").change(function(e){connectkey.checkMetadataMode()});
        $("#authenticateOwnerBtn").click(function(){connectkey.authenticateOwner()});
        $("#ownerHandleLabel").blur(function(){connectkey.checkOwnerExistance()});
        $("#collHandleLabel").blur(function(){connectkey.checkDSFolderExistance()});


        <#elseif buttontype == "mfd">
          //load the autocomplete Widget for the Group field.
          connectkey.initGroupAutocompleteField();
          //initialize the edit icon dialog widget.
          connectkey.initEditIconDialog("${msg.btn_apply}", "${msg.btn_cancelLabel}","${msg.btn_closeTip}", "${EIP_RealPath}/images/", "AddButton");

          //Event listeners to start after page load...
        $("#addButtonForm").submit(function(e){connectkey.validateForm(e, "${msg.validationErrorGeneralMsg}", '<p class="fielderror error_empty"><strong>${msg.fieldErrorTitle}</strong> ${msg.fielderror_empty}</p>', "${msg.editbtn_formsubmit_success}", "${msg.editbtn_formsubmit_error}", null, connectkey.submitIconEditForm);});

          $("#access_method").change(function(){connectkey.toggleGroupField()});
          $("#btn_editIcon").click(function(e){$("#updatebtnicon-dialog-form").dialog("open");});
          $("#toggle_advanced").click(function(e){connectkey.toggleAdvancedDeviceOptions(e, "${msg.advancedBtn}", "${msg.advancedBtn_hide}")});
          $("#updatebtnicon-dialog-form").on("click", "input[type='radio']", connectkey.validateEditIconDialog);
          $("#updatebtnicon-dialog-form").on("change", "#icon_select", connectkey.handleIconFormSelectField);
          $("#updatebtnicon-dialog-form").on("change", "#icon_upload", connectkey.handleIconFormUploadField);

          //initialize plugins...
          $('#updateicon-form').ajaxForm({ //initialize ajaxform (submits file uploads too)...
            success: function(){
              connectkey.showMessage("${msg.icon_update_success}", "success");
              setTimeout(function(){window.location.href="${EIP_RealPath}/EIPAdmin/ConfigureButtons"}, 1000);
          },
            failure: function(){connectkey.showMessage("${msg.icon_update_failure}", "error")}
          }); //prepare form to submit via ajax.

          $("#icon_select").imagepicker();


        <#else> <#-- Add Folder Button -->
        //Event listeners to start after page load...
        $("#addButtonForm").submit(function(e){connectkey.validateForm(e, "${msg.validationErrorGeneralMsg}", '<p class="fielderror error_empty"><strong>${msg.fieldErrorTitle}</strong> ${msg.fielderror_empty}</p>', "${msg.editbtn_formsubmit_success}", "${msg.editbtn_formsubmit_error}", "${EIP_RealPath}/EIPAdmin/ConfigureButtons", null);});
        </#if>


        //focus the name field when pages loads...
        $("#buttonName").focus();

        //Event listeners to start after page load...
        $("#buttonName").blur(function(e){connectkey.updateReqDefaultTitleVal();})
        $("#collHandleLabel").blur(function(e){connectkey.updateSubFolderRootLabel(e);})
        $("body").on("blur", ".required_error", function(e){connectkey.checkRequiredErrorField(e);})
        $("#btn_folderAccessTest").click(function(e){connectkey.testNetworkFolderSettings(e, "${EIP_RealPath}/EIPAdmin/FolderAccessTest")});


      });  //end document ready code...

    </script>

  </head>

  <body id="AddButton" class="adminsection">
  
    <#include "adminheader.ftl">
    <@menu.show/>
    <section id="content" class=''>

      <h2><@msg.title_add buttontypelabel /></h2>
      <!-- page description -->
      <p id="page_description"><@msg.subtitle_add buttontypelabel/></p>
      <!-- page body -->
      <section id="page_body">
        <form action="${EIP_RealPath}/EIPAdmin/Button" method="post" id="addButtonForm">

          <!--hidden fields -->
          <input type="hidden" id="parentId" name="parentId" value="${parentId}" />
          <input type="hidden" id="action" name="action" value="update_add" />
          <input type="hidden" id="buttontype" name="buttonType" value="${buttontype}" />
          <#if buttontype != "mfd"><input type="hidden" id="groupHandle" name="groupHandle" value="${parentgroup}" /></#if>

          <#if buttontype == "scan">
            <@body_scan/>
          <#else>
            <@body/>
          </#if>

          <div id="buttonrow">
            <button type="submit">${msg.btn_addButton}</button>
            <a href="${EIP_RealPath}/EIPAdmin/ConfigureButtons"> &#8592; ${msg.link_returnToButtonList}</a>
          </div>

        </form>
      </section>
    </section>

    <#if buttontype == "mfd">
      <div id="updatebtnicon-dialog-form" title="${msg.customizeicon_dialog_title}">
        <form id="updateicon-form" action="${EIP_RealPath}/EIPAdmin/Button" method="post">
        <input type="hidden" name="buttonId" id="buttonId" value="">
        <fieldset>
          <p>${msg.editsvcbtndialog_subtitle}</p>
          <ul>
            <li>
              <input type="radio" id="seticon_reset" name="action" value="reset_icon" checked="checked" newval="${msg.customizeicon_newval_default}">
              <label for="seticon_reset">${msg.icon_resetdefault_label}</label>
              <img id="defaultsrvbtnicon" src="${EIP_RealPath}/images/eip_icon.png"/>
            </li>
            <li>
              <input type="radio" id="seticon_upload" name="action" value="upload_icon" newval="${msg.customizeicon_newval_uploadicon}">
              <label for="seticon_upload">${msg.icon_upload_label}</label>
              <input type="file" id="icon_upload" name="iconfile"/>
              <p class="fieldnote_below">${msg.icon_upload_visiblehint}</p>
            </li>
            <li>
              <#assign isExistingRadioDissabled><#if buttonData.EIPConfig["//button/icon"][0]??><#else>disabled="disabled"</#if></#assign>

              <input type="radio" id="seticon_image" name="action" value="select_icon" newval="${msg.customizeicon_newval_useexisting}" ${isExistingRadioDissabled}>
              <label for="seticon_image">${msg.icon_filetypein_label}</label>

              <#if buttonData.EIPConfig["//button/icon"][0]??>
                <select id="icon_select" class="image-picker masonry" name="iconname">
                  <option value="" selected="selected"></option>
                  <#list buttonData.EIPConfig["//icon[not(. = preceding::icon)]"] as icon>
                    <option data-img-src="../images/${icon}" value="${icon}">${icon}</option>
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



<!-- Edit Settings Body for MFD, Scan, or Folder Buttons -->
<#macro body_editsettings>
  <fieldset>
    <ul>
      <li>
        <label for="name" class="label-required labeltip" title="${msg.propHelp_ButtonLabel}">${msg.propLabel_ButtonLabel}</label>
        <input id="buttonName" name="buttonName" type="text" class="large required" value="">
      </li>
    </ul>
  </fieldset>


</#macro>


<!-- Edit Settings Body for MFD, Scan, or Folder Buttons -->
<#macro body_scan>

  <@body_editsettings/>
  
  <fieldset>
    <h3>${msg.scanOwner_title}</h3>
    <p>${msg.scanOwner_description}</p>
    <ul>
      <li>
        <label for="ownerHandleLabel" class="label-required labeltip" title="${msg.propHelp_Owner}">${msg.propLabel_Owner}</label>
        <input type="text" id="ownerHandleLabel" name="ownerHandleLabel" class="required medium" value="">
        <span class="owner-auth-fail" style="display: none;">${msg.ownerNotAuthenticated_msg}</span>
        <span class="owner-not-found" style="display: none;">${msg.ownerNotFound_msg}</span>
        <input id="ownerHandle" name="ownerHandle" type="hidden" value="" />
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
          <option value="DocuShare">${msg.optionLabel_ScanType_DocuShare}</option>
          <option value="Folder">${msg.optionLabel_ScanType_Folder}</option>
          <#assign isEmailServerDisabled><#if config.EmailConfig.emailHost = "">disabled="disabled" title="${msg.optionLabel_ScanType_Email_ServerNotConfiguredTip}"</#if></#assign>
          <option value="Email" ${isEmailServerDisabled}>
            ${msg.optionLabel_ScanType_Email}
            <#if config.EmailConfig.emailHost = "">
              ${msg.optionLabel_ScanType_Email_ServerNotConfiguredLabel}
            </#if>
          </option>
        </select>
      </li>

      <!-- DocuShare Folder Scan Type Fields -->
      <li class="scanType_coll">
        <label for="collHandleLabel" class="label-required labeltip" title="${msg.propHelp_ScanToCollection}">${msg.propLabel_ScanToCollection}</label>
        <input id="collHandleLabel" type="text" name="collHandleLabel" class="large required" value="" data-noownerplaceholder="${msg.noCollectionFoundPlaceholder}" placeholder="${msg.noCollectionFoundPlaceholder}" disabled/>
        <span class="folder-not-found" style="display: none;">Folder not found in DocuShare.</span>
        <input id="collHandle" type="hidden" name="collHandle" value="" />
        <p class="fieldnote_below">${msg.propNote_ScanToCollection}</p>
      </li>
      
      <!-- Network Folder Scan Type Fields -->
      <li class="scanType_nfolder" style="display:none">
      <label for="uncPath" class="label-required labeltip" title="${msg.propHelp_folderPath}">${msg.propLabel_folderPath}</label>
        <input type="text" id="uncPath" name="uncPath" class="large" value="" disabled="disabled">
        <p class="fieldnote_below">${msg.propNote_folderPath}</p>
      </li>

      <li class="scanType_nfolder" style="display:none"><label for="uncUser" class="label-required labeltip" title="${msg.propHelp_folderUser}">${msg.propLabel_folderUser}</label>
        <input type="text" id="uncUser" name="uncUser" value="" disabled="disabled">
      </li>
      <li class="scanType_nfolder" style="display:none"><label for="uncPassword" class="label-required labeltip" title="${msg.propHelp_folderPassword}">${msg.propLabel_folderPassword}</label>
        <input type="password" id="uncPassword" name="uncPassword" value="" disabled="disabled">
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
      <li class="scanType_email" style="display:none">
        <label for="defaultEmailAddress" class="label-required labeltip" title="${msg.propNote_defaultEmailAddress}">${msg.propLabel_defaultEmailAddress}</label>
        <input type="input" id="defaultEmailAddress" name="defaultEmailAddress" value="" class="large"/>
      </li>


      <!-- Common Fields -->
      <li>
        <label for="ocr" class="label-required labeltip">${msg.propLabel_DefaultOCR}
          <span class="smallipopHint">${msg.propHelp_DefaultOCR}
          <dl>
            <dt>${msg.optionLabel_DefaultOCR_imageonly}</dt>
            <dd>${msg.optionLabelHint_DefaultOCR_imageonly}</dd>
            <#if isServerOCR == false>
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
            <option value="IMAGE_ONLY">${msg.optionLabel_DefaultOCR_imageonly}</option>
            <option value="SEARCHABLE_IMAGE">${msg.optionLabel_DefaultOCR_searchableByDevice}</option>
            <option value="SEARCHABLE_IMAGE_SERVER">${msg.optionLabel_DefaultOCR_searchableByServer}</option>
          <#else>
            <#list mfdxml["scan[@name='scan_ocr']/option"] as option>
              <option value="${option.@value}"><@getMDFOptionLabel option.@value/></option>
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
        <select id="format" name="format">
          <option value="PDF">${msg.optionLabel_DefaultFormat_pdf}</option>
          <option class="pdfa_only" value="PDFA-1b">${msg.optionLabel_PDF_A}</option>
          <option class="mrc_only" value="MRC-PDF">${msg.optionLabel_MRC_PDF}</option>
          <option class="mrc_only" value="MRC-PDFA-1b">${msg.optionLabel_MRC_PDF_A}</option>
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
          <option value="${option.@value}"><@getMDFOptionLabel option.@value/></option>
        </#list>
        </select>
      </li>

      <li>
        <label for="scanColor" class="label-required labeltip" title="${msg.propHelp_scanColor}">${msg.propLabel_scanColor}</label>
        <select id="scanColor" name="scanColor">
          <option value="AUTO">${msg.scanColorOption_AUTO}</option>
          <option value="FULL_COLOR">${msg.scanColorOption_FULL_COLOR}</option>
          <option value="GRAYSCALE">${msg.scanColorOption_GRAYSCALE}</option>
          <option value="BLACK_AND_WHITE">${msg.scanColorOption_BLACK_AND_WHITE}</option>
        </select>
      </li>

      <!-- Export scan settings -->
      <li class="scanType_nfolder scanType_coll scanType_email"><label for="exportScanSetting" class="labeltip" title="${msg.propHelp_ExportScanSettings}">${msg.propLabel_ExportScanSettings}</label>
        <input type="checkbox" id="exportScanSetting" name="exportScanSetting" value="true" />
      </li>

      <!-- Folder & Email Scan Type Fields -->
      <li class="scanType_nfolder scanType_email" style="display:none"><label for="exportMeta" class="labeltip" title="${msg.propNote_exportMeta}">${msg.propLabel_exportMeta}</label>
        <input type="checkbox" id="exportMeta" name="exportMeta" value="true" />
      </li>

      <!-- Folder & Collection Scan Type Fields -->
      <li class="scanType_nfolder scanType_coll"><label for="browseCollection" class="labeltip" title="${msg.propNote_browseCollection}">${msg.propLabel_browseCollection}</label>
        <input type="checkbox" id="browseCollection" name="browseCollection" value="true" />
      </li>

      <#-- Wait for scan confirmation -->
      <li class="scanType_nfolder scanType_coll scanType_email"><label for="scanConfirmation" class="labeltip" title="${msg.propNote_scanConfirmation}">${msg.propLabel_scanConfirmation}</label>
        <input type="checkbox" id="scanConfirmation" name="scanConfirmation" value="true"/> 
      </li>     

    </ul>
  </fieldset>

  <fieldset id="propertysettings">
    <h3>${msg.fieldsettings_title}</h3>
    <p class="scanType_coll">${msg.fieldsettings_desc}</p>
    <p class="scanType_nfolder" style="display:none">${msg.fieldsettings_desc_networkfolder}</p>
    <p class="scanType_email" style="display:none">${msg.fieldsettings_desc_email}</p>
    <fieldset id="doctype_wrapper">
    <ul>
      <li>
        <label for="docType" class="labeltip" title="${msg.propLabelHint_doctype}">${msg.propLabel_doctype}</label>
        <select id="docType" name="docType" curval="${EIP_DSData.getDocumentObjectList()[0]?values[0]}" />
          <#list EIP_DSData.getDocumentObjectList() as map>
            <#list map?keys as entry>
              <#if map[entry] != "com.xerox.xcm.falcon.EmailMessageDocument">
                <option value="${map[entry]}">${entry}</option>
              </#if>
            </#list>
          </#list>
        </select>
      </li>

      <#assign initAutofillVisibility = ""/>
      <#if config["DBAgent[documentType='${initialDocType}']"]?has_content = false>
        <#assign initAutofillVisibility>display:none</#assign>
      </#if>

      <li id="autofill_profile_wrapper" style="${initAutofillVisibility}">
        <label for="dbAgent" class="labeltip" title="${msg.propLabelHint_autoFillProfile}">${msg.propLabel_autoFillProfile}</label>
        <select id="dbAgent" name="dbAgent" curval="">
          <option value="">${msg.optionLabel_autoFillProfile_noProfile}</option>
          <#list config["DBAgent[documentType='${initialDocType}']"] as dbAgent>
            <option value="${dbAgent.name}">${dbAgent.name}</option>
          </#list>
        </select>
      </li>
    </ul>
  </fieldset>


    <!-- Field List Table with Options -->
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
      <tbody id="field_list"></tbody>
    </table>


    <!-- Required and Optional Field Row Templates -->
    <table id="field_list_template">
      <@fieldlist_template "optional"/>
      <@fieldlist_template "required"/>
    </table>

    <div id="field_list_footer"><button type="button" id="addfieldrow">${msg.btn_addfield}</button></div>

  </fieldset>

  <!-- Scan to Collection Sub-Folder Options -->
  <fieldset id="subCollectionSettings">
    <h3>${msg.subFolderSection_title}</h3>
    <p>${msg.subFolderSection_subtitle}</p>
    <ul id="subCollectionPathTemplate">
      <li id="subfolder-rootlabel">${msg.subFolderCollectionLabel_none}</li>
      <li><@subfolderSelectMenuOptions/></li>
      <li><@subfolderSelectMenuOptions/></li>
      <li><@subfolderSelectMenuOptions/></li>
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
                <span class="label display_name" dsname=""></span>
                <span class="filename_tag" style="display:none">${msg.propLabel_networkfilename}</span>
                <span class="required_tag">${msg.fieldlist_requiredtag}</span>
                <input id="prop_" name="metaName[]" class="meta_name" value="" type="hidden" disabled="disabled"/>
              <#else>
                <span class="afpmappedbadge"><span class="smallipopHint">${msg.autofillProfile_isMappedField}</span></span>
                <select id="prop_" name="metaName[]" class="propchooser meta_name" disabled="disabled"></select>
                <span class="requiredBySubCol_tag" style="display:none">${msg.propRequiredbySubFolder}</span>
              </#if>
              <input id="require_" name="metaRequire[]" type="hidden" class="meta_require" value="${isRequired}" disabled="disabled"/>
              <input id="dependentMenuProfile_" name="dependentMenuProfile[]" class="meta-dmprofile" type="hidden" value="" disabled="disabled"/>
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
                <input id="defaultvalue_" name="metaValue[]" type="text" class="meta_defaultvalue dv-string ${isRequiredClass}" value="" disabled="disabled" style="display:none"/>
                <span class="smallipopHint">${msg.afp_mappedfield_defaultval_hint}</span>
              </span>
              <select id="defaultvaluemenu_" name="metaValue[]" class="meta_defaultvaluemenu dv-menu" disabled="disabled" style="display:none"/>
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
              <input id="concat_location_hidden" name="metaConcatLocation[]" type="hidden" value="" disabled="disabled" class="metaConcatLocHidden"/>
            </td>
            <#if type="required">
              <td class="actions"></td>
            <#else>
              <td class="actions"><button type="button" class="removefield btn_danger">${msg.btn_removefield}</button></td>
            </#if>
          </tr>
        </tbody>
</#macro>



<!-- Content for Add Folder or MFD buttons -->
<#macro body>
  <@body_editsettings/>

  <#-- Set Permissions if button being added is MFD -->
  <#if buttontype="mfd">
  <fieldset>
    <ul>
      <li>
        <label for="access_method" class="labeltip" title="${msg.propLabelHint_accessMethod}" >${msg.propLabel_accessMethod}
          <span class="smallipopHint">${msg.propLabelHint_accessMethod}
          <dl>
            <dt>${msg.optionLabel_accessMethod_guest}</dt>
            <dd>${msg.optionLabelHint_accessMethod_guest}</dd>
            <dt>${msg.optionLabel_accessMethod_group}</dt>
            <dd>${msg.optionLabelHint_accessMethod_group}</dd>
          </dl>
          </span>
        </label>
        <select id="access_method">
          <option value="guest" selected="selected">${msg.optionLabel_accessMethod_guest}</option>
          <option value="group">${msg.optionLabel_accessMethod_group}</option>
        </select>
      </li>
      <li>
        <label for="dsdomain" class="labeltip" title="${msg.ServerSetup_domainTip}">${msg.ServerSetup_domainLabel}</label>
        <div class="field">
          <select name="dsdomain" id="dsdomain" class="required">
            <#list EIP_domains as domain>
            <option value="${domain}">${domain}</option>
            </#list>
          </select>
        </div>
      </li>
      <li>
        <ul id="accessOptions" style="display:none">
          <li>
            <label for="groupHandleLabel" class="labeltip" title="${msg.optionLabelHint_specificgroup}">${msg.optionLabel_specificgroup}</label>
            <input id="groupHandleLabel" name="groupHandleLabel" disabled="disabled" type="text" class="large required" value=""/>
            <input id="groupHandle" name="groupHandle" type="hidden" value=""/>
            <p class="fieldnote_below">${msg.fieldnote_usergroup}</p>
          </li>
        </ul>
      </li>
      <li><button type="button" id="toggle_advanced">${msg.advancedBtn}</button>
        <div id="advanced_settings" style="display:none">
          <label class="labeltip" for="" title="${msg.svcbtnicon_hint}">${msg.svcbtnicon_label}</label>
          <span id="iconsetting">${msg.customizeicon_newval_default}</span>
          <span id="iconpreview"><img id="iconimg" src="${EIP_RealPath}/images/eip_icon.png"/></span>
          <button type="button" id="btn_editIcon">${msg.btn_customizeicon_label}</button>
        </div>
      </li>
    </ul>
  </fieldset>
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



<#macro subfolderSelectMenuOptions>
  <span class="subfolder-backslash">/</span>
  <select class="subCollectionSelect" name="subCollectionType[]" currval="">
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
