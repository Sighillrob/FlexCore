<#import "StandaloneMenu.ftl" as menu />
<#import "/locale/messages_${locale}.ftl" as msg />

<#if action = "edit">
  <#assign dsmenu = serverConfigData["//MenuAgent[name='${name}']"] />
  <#assign title>${msg.dbsmPage_edit_title} <span class="quiet">${dsmenu.name}</span></#assign>
  <#assign headertitle>${msg.dbsmPage_edit_title} ${dsmenu.name}</#assign>
  <#assign description><li>${msg.dbsmPage_edit_subtitle}</li></#assign>
  <#assign hasMappedBtns = serverConfigData["//metadata[@menuAgent='${dsmenu.name}']/.."][0]?? />
  <#assign hasDependentMenus = serverConfigData["//DependentMenuProfile[menuAgent='${dsmenu.name}']"][0]?? />
  <#assign mappingDisabled = ""/>
  <#assign dms_mappingDisabled = ""/>
  <#assign mappingDisabledPropTip = ""/>

  <#if hasMappedBtns>
    <#assign mappingDisabled = "disabled='disabled'"/>
    <#assign mappingDisabledPropTip = "${msg.dbsmPage_mappingDisabledPropTip}"/>
  </#if>
  <#if hasDependentMenus>
    <#assign dms_mappingDisabled = "disabled='disabled'"/>
  </#if>

<#elseif action = "add">
  <#assign title="${msg.dbsmPage_add_title}"/>
  <#assign headertitle="${msg.dbsmPage_add_title}"/>
  <#assign description>
        <li>${msg.dbsmPage_add_subtitle}</li>
  </#assign>
</#if>


<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta charset="utf-8" />
    <meta http-equiv="cache-control" content="max-age=0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="pragma" content="no-cache" />
    <title>${headertitle}</title>
    ${ds_admin_site_style}
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/admin_styles.css" />
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/scripts/lib/jquery-ui/jquery-ui.css" />   
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/jquery.smallipop.css" media="all" title="Screen"/>
    <!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/admin_ds6_ie8-7.css" /><![endif]-->
    
    <script src="${EIP_RealPath}/scripts/lib/jquery.js"></script>
    <script src="${EIP_RealPath}/scripts/lib/jquery-ui/jquery-ui.min.js"></script>
    <script src="${EIP_RealPath}/scripts/jquery.smallipop.js"></script>
    <script src="${EIP_RealPath}/scripts/modernizr.js"></script>
    <script src="${EIP_RealPath}/scripts/jquery.nimble.loader.js"></script>
    <script src="${EIP_RealPath}/scripts/connectkey.js"></script>
    
    <script>
      $(document).ready(function() {

        //event listeners...
        $("#dataSource").change(function(e){connectkey.changeDataSourceType(e)});
                
        $("body").on("blur", ".required_error", function(e){connectkey.checkRequiredErrorField(e);});
        
        $("#editSDSMenuForm").submit(function(e){connectkey.validateForm(e, "${msg.validationErrorGeneralMsg}", '<p class="fielderror error_empty"><strong>${msg.fieldErrorTitle}</strong> ${msg.fielderror_empty}</p>', "${msg.dbsmPage_edit_successMsg}", "${msg.dbsmPage_edit_failureMsg}", "${EIP_RealPath}/EIPAdmin/DataSourceMenus", null)});

        $("#addSDSMenuForm").submit(function(e){connectkey.validateForm(e, "${msg.validationErrorGeneralMsg}", '<p class="fielderror error_empty"><strong>${msg.fieldErrorTitle}</strong> ${msg.fielderror_empty}</p>', "${msg.dbsmPage_add_successMsg}", "${msg.dbsmPage_add_failureMsg}", "${EIP_RealPath}/EIPAdmin/DataSourceMenus", null, null);});
        

        $("#dsNext").click(function(e){connectkey.updateDataSourceSettings(e,"#dsSetupWrapper", "#dsMappingWrapper", 
          "${EIP_RealPath}/EIPAdmin/DBAgent?action=listTables", "${EIP_RealPath}/EIPAdmin/DBAgent?action=listColumns",
          '<p class="fielderror error_empty"><strong>${msg.fieldErrorTitle}</strong> ${msg.fielderror_empty}</p>',
          '<p class="fielderror error_illegalchars"><strong>${msg.fieldErrorTitle}</strong> ${msg.dbsmNoIllegalCharsError} \',\",<,>,&,\~,\!,\@,#,$,*,(,),=,:,+</p>', 
          '<p class="fielderror error_duplicatetitle"><strong>${msg.fieldErrorTitle}</strong> ${msg.afp_name_fielderror_duplicatename}</p>', 
          "${msg.dsConnectionError}", "${msg.dsColumnLookupError}")});
        
        $("#dsBack").click(function(e){connectkey.dsSetupWizNav(e,"#dsMappingWrapper", "#dsSetupWrapper")});

        $("#dataSource, #host, #dbname, #port, #username, #password, #name").change(function(){
          $("#dsSetupWrapper").data("modifiedFlag", true);
        });

        $("#table").change(function(e){connectkey.changeDataSourceTableODBC(e, "${EIP_RealPath}/EIPAdmin/DBAgent?action=listColumns")});

        $("#documentType").change(function(e){
          connectkey.changeDataSourceDocTypeODBC(e, "${EIP_RealPath}/EIPAdmin/Search?searchType=docRequiredProperties&stringSearch=", "EIPAdmin/Search?searchType=docProperties&stringSearch=", "#property","${msg.dsObjPropsRequiredLookupError}","${msg.dsObjPropsOptionalLookupError}");
        });

        $("body").on("blur", ".required_error", function(e){connectkey.checkRequiredErrorField(e);});

        <#if action = "add">
          connectkey.usedtitles = [<@compress single_line=true>
          <#if serverConfigData.EIPConfig.MenuAgent[0]??>
            <#list serverConfigData.EIPConfig.MenuAgent as menu>"${menu.name}"<#if menu_has_next>,</#if></#list>
          </#if>
          </@compress>]

          $("#name").blur(function(e){connectkey.duplicateMenunameCheck(e,connectkey.usedtitles, '<p class="fielderror error_duplicatetitle"><strong>${msg.fieldErrorTitle}</strong> ${msg.dbsm_name_fielderror_duplicatedtitle}</p>')})

          $("#name").blur(function(e){connectkey.illegalCharInMenuNameCheck(e,'<p class="fielderror error_illegalchars"><strong>${msg.fieldErrorTitle}</strong> ${msg.dbsmNoIllegalCharsError} \',\",<,>,&,\~,\!,\@,#,$,*,(,),=,:,+</p>')});

          //force datasource connection check with the modifed flag after page loads for the Add page.
          $("#dsSetupWrapper").data("modifiedFlag", true);
        
        <#elseif action = "edit">
          //delete button
          $("#deletebutton").click(function(e){connectkey.deleteDSAgent(e,"editpage", "${EIP_RealPath}/EIPAdmin/DBAgent?agentType=simpleMenu&action=delete&name[]=${dsmenu.name}", "${msg.action_deleteSingleDSMenuConfirmMsg}", "${msg.action_deleteSingleDSMenuSuccessMsg}", "${msg.action_deleteSingleDSMenuFailureMsg}", "${EIP_RealPath}/EIPAdmin/DataSourceMenus");});
          </#if>

      }); //end document ready code...    
    </script>
  
  </head>

  <body id="SimpleDataSourceMenu" class="adminsection">
    <#include "adminheader.ftl">
    <@menu.show/>
    <section id="content" class=''>
      <!-- page title -->
      <h2>${title}</h2>
      <!-- page description -->
      <ul id="page_description">${description}</ul>
      <!-- page body -->
      <section id="page_body">
        <#if action=="add">
          <@add_form/>
        <#elseif action=="edit">
          <@edit_form/>
        </#if>
      </section>
    </section>
  </body>
</html>



<#macro edit_form>

<#if hasMappedBtns || hasDependentMenus>
  <#-- Mapping Notice Message -->
  <div id="mapped-btn-warn">
    <#if hasMappedBtns && !hasDependentMenus><p>${msg.dbsmPage_mappedBtnWarning}</p>
    <#elseif !hasMappedBtns && hasDependentMenus><p>${msg.dbsmPage_mappedDMSWarning}</p>
    <#elseif hasMappedBtns && hasDependentMenus><p>${msg.dbsmPage_mappedBtnAndDMSWarning}</p></#if>
  </div>
  <#-- Mapping List -->
  <div class="mappedListing">
    <#if serverConfigData["//metadata[@menuAgent='${dsmenu.name}']/.."][0]??>
    <div id="assignedScanBtns">
      <span class="mappedListingTypeLabel">${msg.dsAssignedButtons}</span>
      <#list serverConfigData["//metadata[@menuAgent='${dsmenu.name}']/.."] as button>
        <a href="${EIP_RealPath}/EIPAdmin/Button?action=editsettings&buttonId=${button.@buttonId}&parentId=${button.@parentId}">${button.@name}</a>
        <#if button_has_next>, </#if>
      </#list>
    </div>
    </#if>
    <#if hasDependentMenus>
    <div id="assignedDMS">
      <span class="mappedListingTypeLabel">${msg.dsAssignedDMS}</span>
      <#list serverConfigData["//DependentMenuProfile[menuAgent='${dsmenu.name}']"] as dms>
        <a href="${EIP_RealPath}/EIPAdmin/DBAgent?agentType=dependentMenu&action=edit&profileName=${dms.@name}">${dms.@name}</a>
        <#if dms_has_next>, </#if>
      </#list>      
    </div>
    </#if>
  </div>
</#if>

<form action="${EIP_RealPath}/EIPAdmin/DBAgent" method="post" id="editSDSMenuForm">
  
  <#assign dbFieldsVisibility><#if dsmenu.dataSource = "Microsoft Access" || dsmenu.dataSource = "Microsoft Excel">style="display:none"</#if></#assign>
  <#assign isdbFieldRequiredOnLoad><#if dsmenu.dataSource != "Microsoft Access" && dsmenu.dataSource != "Microsoft Excel">required</#if></#assign>

  <input name="name" type="hidden" value="${dsmenu.name}"/>
  <input name="action" type="hidden" value="update"/>
  <input name="agentType" type="hidden" value="simpleMenu"/>

  <fieldset id="dsSetupWrapper">
    <h3>${msg.afp_dsconn_heading}</h3>
    <p>${msg.afp_dsconn_subheading}</p>
    <ul>
      <li>
        <label for="dataSource" class="labeltip" title="${msg.afp_datasource_tip}">${msg.afp_datasource_label}</label>
        <div class="field">
          <select id="dataSource" name="dataSource" class="required" ${dms_mappingDisabled}>
            <#list dataSources as src>
            <option value="${src}" <@isOptionSelected src dsmenu.dataSource/> >${src}</option>
            </#list>
          </select>
        </div>
      </li>



      <!-- Server Database Only Fields -->
      <li class="db-only" ${dbFieldsVisibility}>
        <label for="host" class="labeltip" title="${msg.afp_host_tip}">${msg.afp_host_label}</label>
        <div class="field"><input id="host" name="host" type="text" class="${isdbFieldRequiredOnLoad}" value="${dsmenu.host}" ${dms_mappingDisabled}></div>
      </li>
      <li class="db-only" ${dbFieldsVisibility}>
        <label for="port" class="labeltip" title="${msg.afp_port_tip}">${msg.afp_port_label}</label>
        <div class="field"><input id="port" name="port" type="text" class="${isdbFieldRequiredOnLoad}" value="${dsmenu.port}" ${dms_mappingDisabled}></div>
      </li>
      <li class="db-only" ${dbFieldsVisibility}>
        <label for="username" class="labeltip" title="${msg.afp_username_tip}">${msg.afp_username_label}</label>
        <div class="field"><input id="username" name="username" type="text" class="${isdbFieldRequiredOnLoad}" value="${dsmenu.username}" ${dms_mappingDisabled}/></div>
      </li>
      <li class="db-only" ${dbFieldsVisibility}>
        <label for="password" class="labeltip" title="${msg.afp_password_tip}">${msg.afp_password_label}</label>
        <div class="field"><input id="password" name="password" type="password" class="${isdbFieldRequiredOnLoad}" value="${dsmenu.password}" ${dms_mappingDisabled}/></div>
      </li>
      <!-- Common Fields -->
      <li>
        <label for="dbname" class="labeltip" title="${msg.afp_dbname_tip}">${msg.afp_dbname_label}</label>
        <div class="field"><input id="dbname" name="dbname" type="text" class="large required" value="${dsmenu.dbname}" ${dms_mappingDisabled}></div>
      </li>
    </ul>

    </fieldset>

    <fieldset id="dsMappingWrapper" style="display:none">
      <h3>${msg.dbsmPage_mapping_title}</h3>
      <p>${msg.dbsmPage_mapping_subtitle}</p>
      <ul>
      <li>
        <label for="table" class="labeltip" title="${msg.afp_table_tip}">${msg.afp_table_label}</label>
        <div class="field">
          <select id="table" name="table" ${dms_mappingDisabled}>
            <#list DB_ListTables as table>
              <option value="${table}" <@isOptionSelected table dsmenu.table /> >${table}</option>
            </#list>
          </select>
        </div>
      </li>
      <li>
        <label for="columnvalue" class="labeltip" title="${msg.dbsm_columnforvalue_tip}">${msg.dbsm_columnforvalue_label}</label>
        <div class="field">
          <select id="columnvalue" name="columnName" ${dms_mappingDisabled}>
            <#list DB_ListColumns as column>
              <option value="${column}" <@isOptionSelected column dsmenu.column.@value /> >${column}</option>
            </#list>
          </select>
        </div>
      </li>
      <li>
        <label for="columnlabel" class="labeltip" title="${msg.dbsm_columnforlabel_tip}">${msg.dbsm_columnforlabel_label}</label>
        <div class="field">
          <select id="columnlabel" name="columnLabel" ${dms_mappingDisabled}>
            <#list DB_ListColumns as column>
              <option value="${column}" <@isOptionSelected column dsmenu.column.@label />>${column}</option>
            </#list>
          </select>
        </div>
      </li>
      <li>
        <label for="documentType" class="labeltip" title="${msg.afp_doctype_tip}">${msg.afp_doctype_label}</label>
        <div class="field">
          <select id="documentType" name="documentType" ${mappingDisabled}>
            <#list EIP_DSData.getDocumentObjectList() as map>
              <#list map?keys as entry>
                <option value="${map[entry]}" <@isOptionSelected map[entry] dsmenu.documentType /> >${entry}</option>
              </#list>
            </#list>
          </select>
          <#if hasMappedBtns && !hasDependentMenus>
          <span class="mappedwarnforprop hastip" title="${mappingDisabledPropTip}">${msg.datasource_prop_mapping_restricted}</span>
          <input type="hidden" name="documentType" value="${dsmenu.documentType}" />
          </#if>
        </div>
      </li>
      <li>
        <label for="property" class="labeltip" title="${msg.dbsm_property_tip}">${msg.dbsm_property_label}</label>
        <div class="field">
          <select id="property" name="property" ${mappingDisabled}>
            <optgroup class="dsprops-reqfields" label="${msg.afp_mapping_property_requiredFields}">
              <#list EIP_DSData.getDocumentRequiredProperties("${dsmenu.documentType}") as map>
                  <option value="${map['value']}" <@isOptionSelected map['value'] dsmenu.property /> >${map['label']}</option>
              </#list>
            </optgroup>
            <optgroup class="dsprops-optionalfields" label="${msg.afp_mapping_property_optionalFields}">
              <#list EIP_DSData.getDocumentProperties("${dsmenu.documentType}") as map>
                  <option value="${map['value']}" <@isOptionSelected map['value'] dsmenu.property /> >${map['label']}</option>
              </#list>
            </optgroup>
          </select>
          <#if hasMappedBtns && !hasDependentMenus>
            <span class="mappedwarnforprop hastip" title="${mappingDisabledPropTip}">${msg.datasource_prop_mapping_restricted}</span>
            <input type="hidden" name="property" value="${dsmenu.property}" />
          </#if>
        </div>
      </li>
    </ul>

  </fieldset>

  <div id="buttonrow">
    <#assign hasMapsMsg="">
    <#if hasMappedBtns && !hasDependentMenus><#assign hasMapsMsg="${msg.dbsmPage_mappedBtnWarning}">
    <#elseif !hasMappedBtns && hasDependentMenus><#assign hasMapsMsg="${msg.dbsmPage_mappedDMSWarning}">
    <#elseif hasMappedBtns && hasDependentMenus><#assign hasMapsMsg="${msg.dbsmPage_mappedBtnAndDMSWarning}"></#if>

    <button type="button" id="dsNext">${msg.dsWizard_next}</button>
    <button type="button" id="dsBack" style="display:none">${msg.dsWizard_back}</button>

    <#if !hasMappedBtns && !hasDependentMenus>
      <button id="dsApply" type="submit" style="display:none">${msg.dbsmPage_apply_btn_label}</button>
      <button id="deletebutton" type="button" class="btn_danger">${msg.dbsmPage_delete_btn_label}</button>
    <#elseif hasDependentMenus>
      <button type="submit" id="dsApply" style="display:none" disabled="disabled">${msg.dbsmPage_apply_btn_label}</button>
      <button id="deletebutton" type="button" class="btn_danger" disabled="disabled">${msg.dbsmPage_delete_btn_label}</button>
      <span class="mappedwarnforprop hastip" title="${hasMapsMsg}">${msg.datasource_restricted_modify}</span>
    <#elseif hasMappedBtns && !hasDependentMenus>
      <button type="submit" id="dsApply" style="display:none">${msg.dbsmPage_apply_btn_label}</button>
      <button id="deletebutton" type="button" class="btn_danger" disabled="disabled">${msg.dbsmPage_delete_btn_label}</button>
      <span class="mappedwarnforprop hastip" title="${hasMapsMsg}">${msg.datasource_prop_mapping_restricted_delete}</span>    
    </#if>
    <span id="dbconnpendingstatus" style="display:none">${msg.dsConnectionProgress}</span>
    <div class="returnlink"><a href="${EIP_RealPath}/EIPAdmin/DataSourceMenus">${msg.dbsmPage_return_to_listing_page}</a></div>
  </div>
</form>
</#macro>


<#macro add_form>
<form action="${EIP_RealPath}/EIPAdmin/DBAgent" method="post" id="addSDSMenuForm">
  <input name="action" type="hidden" value="update"/>
  <input name="agentType" type="hidden" value="simpleMenu"/>
  <fieldset id="dsSetupWrapper">
    <h3>${msg.afp_dsconn_heading}</h3>
    <p>${msg.afp_dsconn_subheading}</p>
    <ul>
      <li>
        <label for="name" class="labeltip" title="${msg.dbsm_name_tip}">${msg.dbsm_name_label}</label>
        <div class="field"><input id="name" name="name" type="text" class="required" value=""></div>
      </li>
      <li>
        <label for="dataSource" class="labeltip" title="${msg.afp_datasource_tip}">${msg.afp_datasource_label}</label>
        <div class="field">
          <select id="dataSource" name="dataSource">
            <#list dataSources as src>
            <option value="${src}">${src}</option>
            </#list>
          </select>
        </div>
      </li>
      <!-- Server Database Only Fields -->
      <li class="db-only">
        <label for="host" class="labeltip" title="${msg.afp_host_tip}">${msg.afp_host_label}</label>
        <div class="field"><input id="host" name="host" type="text" class="required" value=""></div>
      </li>
      <li class="db-only">
        <label for="port" class="labeltip" title="${msg.afp_port_tip}">${msg.afp_port_label}</label>
        <div class="field"><input id="port" name="port" type="text" class="required" value="1433"></div>
      </li>
      <li class="db-only">
        <label for="username" class="labeltip" title="${msg.afp_username_tip}">${msg.afp_username_label}</label>
        <div class="field"><input id="username" name="username" type="text" class="required" value=""/></div>
      </li>
      <li class="db-only">
        <label for="password" class="labeltip" title="${msg.afp_password_tip}">${msg.afp_password_label}</label>
        <div class="field"><input id="password" name="password" type="password" class="required" value=""/></div>
      </li>
      <!-- Common Fields -->
      <li>
        <label for="dbname" class="labeltip" title="${msg.afp_dbname_tip}">${msg.afp_dbname_label}</label>
        <div class="field"><input id="dbname" name="dbname" type="text" class="large required" value=""></div>
      </li>
    </ul>
  </fieldset>

  <fieldset id="dsMappingWrapper" style="display:none">
      <h3>${msg.dbsmPage_mapping_title}</h3>
      <p>${msg.dbsmPage_mapping_subtitle}</p>
    <ul>
      <li>
        <label for="table" class="labeltip" title="${msg.afp_table_tip}">${msg.afp_table_label}</label>
        <div class="field"><select id="table" name="table"></select></div>
      </li>
      <li>
        <label for="columnName" class="labeltip" title="${msg.dbsm_columnforvalue_tip}">${msg.dbsm_columnforvalue_label}</label>
        <div class="field"><select id="columnvalue" name="columnName"></select></div>
      </li>
      <li>
        <label for="columnLabel" class="labeltip" title="${msg.dbsm_columnforlabel_tip}">${msg.dbsm_columnforlabel_label}</label>
        <div class="field"><select id="columnlabel" name="columnLabel"></select></div>
      </li>
      <li>
        <label for="documentType" class="labeltip" title="${msg.afp_doctype_tip}">${msg.afp_doctype_label}</label>
        <div class="field">
          <select id="documentType" name="documentType">
            <#list EIP_DSData.getDocumentObjectList() as map>
              <#list map?keys as entry>
                <option value="${map[entry]}">${entry}</option>
              </#list>
            </#list>
          </select>
        </div>
      </li>
      <li>
        <label for="property" class="labeltip" title="${msg.dbsm_property_tip}">${msg.dbsm_property_label}</label>
        <div class="field">
          <select id="property" name="property" class="property">
            <optgroup class="dsprops-reqfields" label="Required Fields">
              <#list EIP_DSData.getDocumentRequiredProperties("${EIP_DSData.getDocumentObjectList()[0]?values[0]}") as map>
                <#if map['menu'] = ""> <#-- Don't use DocuShare menu properties -->
                  <option value="${map['value']}">${map['label']}</option>
                </#if>
              </#list>
            </optgroup>
            <optgroup class="dsprops-optionalfields" label="Optional Fields">
              <#list EIP_DSData.getDocumentProperties("${EIP_DSData.getDocumentObjectList()[0]?values[0]}") as map>
                <#if map['menu'] = ""> <#-- Don't use DocuShare menu properties -->
                  <option value="${map['value']}">${map['label']}</option>
                </#if>
              </#list>
            </optgroup>
          </select>
        </div>
      </li>
    </ul>
  </fieldset>

  <div id="buttonrow">
    <button type="button" id="dsNext">${msg.dsWizard_next}</button>
    <button type="button" id="dsBack" style="display:none">${msg.dsWizard_back}</button>
    <button type="submit" id="dsApply" style="display:none">${msg.editDevicePage_btn_addLabel}</button>
    <span id="dbconnpendingstatus" style="display:none">${msg.dsConnectionProgress}</span>
    <div class="returnlink"><a href="${EIP_RealPath}/EIPAdmin/DataSourceMenus">${msg.dbsmPage_return_to_listing_page}</a></div>
  </div>
</form>
</#macro>

<#-- isOptionSelected
      Determines if a select option is selected or not.
-->
<#macro isOptionSelected optval selval><#if optval = selval>selected="selected"</#if></#macro>
