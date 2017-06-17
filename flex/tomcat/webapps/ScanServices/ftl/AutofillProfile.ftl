<#import "StandaloneMenu.ftl" as menu />
<#import "/locale/messages_${locale}.ftl" as msg />

<#if action = "edit">
  <#assign profile = serverConfigData["//DBAgent[name='${name}']"] />
  <#assign profileProps = profile.columns.column.@dsProperty />
  <#assign title>${msg.AutoFillProfilePage_edit_title} <span class="quiet">${profile.name}</span></#assign>
  <#assign headertitle>${msg.AutoFillProfilePage_edit_title} ${profile.name}</#assign>
  <#assign description><li>${msg.AutoFillProfilePage_edit_subtitle}</li></#assign>
  <#assign assignedbtns = serverConfigData["count(//button[@dbAgent='${profile.name}'])"]/>
  <#assign hasMappedBtns = serverConfigData["//button[@dbAgent='${profile.name}']"][0]??/>
  <#assign mappedBtnDisabled = ""/>
  <#if hasMappedBtns><#assign mappedBtnDisabled="disabled='disabled'"/></#if>
<#elseif action = "add">
  <#assign title="${msg.AutoFillProfilePage_add_title}"/>
  <#assign headertitle="${msg.AutoFillProfilePage_add_title}"/>
  <#assign description>
        <li>${msg.AutoFillProfilePage_add_subtitle}</li>
  </#assign>
</#if>


<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="cache-control" content="max-age=0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="cache-control" content="must-revalidate" />
    <meta http-equiv="cache-control" content="no-store" />
    <meta charset="utf-8" />
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
        
        $("#EditAutofillProfile").submit(function(e){connectkey.validateForm(e, "${msg.validationErrorGeneralMsg}", '<p class="fielderror error_empty"><strong>${msg.fieldErrorTitle}</strong> ${msg.fielderror_empty}</p>', "${msg.afp_edit_successMsg}", "${msg.afp_edit_failureMsg}", "${EIP_RealPath}/EIPAdmin/AutofillProfiles", null,connectkey.validateAutofillMapping("${msg.noAutofillCbxError}", "${msg.twoMappedFieldMinimumError}"))});

        $("#AddAutofillProfile").submit(function(e){connectkey.validateForm(e, "${msg.validationErrorGeneralMsg}", '<p class="fielderror error_empty"><strong>${msg.fieldErrorTitle}</strong> ${msg.fielderror_empty}</p>', "${msg.afp_add_successMsg}", "${msg.afp_add_failureMsg}", "${EIP_RealPath}/EIPAdmin/AutofillProfiles", null, connectkey.validateAutofillMapping("${msg.noAutofillCbxError}", "${msg.twoMappedFieldMinimumError}"));});
        
        $("body").on("change", ".primary-ckbx", function(e){connectkey.afpTogglePrimary(e);});
        
        $("#table").change(function(e){connectkey.changeDataSourceTable(e, "${EIP_RealPath}/EIPAdmin/DBAgent?action=listColumns", "${msg.dsColumnLookupError}")});
        
        $("#documentType").change(function(e){
          connectkey.changeDataSourceDocType(e, "${EIP_RealPath}/EIPAdmin/Search?searchType=docRequiredProperties&stringSearch=","${EIP_RealPath}/EIPAdmin/Search?searchType=docProperties&stringSearch=","${EIP_RealPath}/EIPAdmin/DBAgent?action=listColumns", ".afp-mapping-table select.dsProperty","${msg.dsObjPropsRequiredLookupError}","${msg.dsObjPropsOptionalLookupError}", "${msg.dsColumnLookupError}");
        });

        $("#dsNext").click(function(e){connectkey.updateDataSourceSettings(e,"#dsSetupWrapper", "#dsMappingWrapper", "${EIP_RealPath}/EIPAdmin/DBAgent?action=listTables", 
          "${EIP_RealPath}/EIPAdmin/DBAgent?action=listColumns", 
          '<p class="fielderror error_empty"><strong>${msg.fieldErrorTitle}</strong> ${msg.fielderror_empty}</p>', 
          '<p class="fielderror error_illegalchars"><strong>${msg.fieldErrorTitle}</strong> ${msg.dbsmNoIllegalCharsError} \',\",<,>,&,\~,\!,\@,#,$,*,(,),=,:,+</p>', 
          '<p class="fielderror error_duplicatetitle"><strong>${msg.fieldErrorTitle}</strong> ${msg.afp_name_fielderror_duplicatename}</p>', 
          "${msg.dsConnectionError}", "${msg.dsColumnLookupError}")});
        
        $("#dsBack").click(function(e){connectkey.dsSetupWizNav(e,"#dsMappingWrapper", "#dsSetupWrapper")});

        $("#dataSource, #host, #dbname, #port, #username, #password, #name").change(function(){
          $("#dsSetupWrapper").data("modifiedFlag", true);
        });

        $("#afpMappingTable").on("change", "select.dsProperty", function(e){connectkey.changeDataSourceProperty(e)});
       

        <#if action = "add">
          connectkey.usedtitles = [<@compress single_line=true>
          <#if serverConfigData.EIPConfig.DBAgent[0]??>
            <#list serverConfigData.EIPConfig.DBAgent as profile>"${profile.name}"<#if profile_has_next>,</#if></#list>
          </#if>
          </@compress>]

          $("#name").blur(function(e){connectkey.duplicateMenunameCheck(e,connectkey.usedtitles, '<p class="fielderror error_duplicatetitle"><strong>${msg.fieldErrorTitle}</strong> ${msg.afp_name_fielderror_duplicatename}</p>')});

          $("#name").blur(function(e){connectkey.illegalCharInMenuNameCheck(e,'<p class="fielderror error_illegalchars"><strong>${msg.fieldErrorTitle}</strong> ${msg.dbsmNoIllegalCharsError} \',\",<,>,&,~,!,@,#,$,*,(,),=,:,+</p>')});

          //force datasource connection check with the modifed flag after page loads for the Add page.
          $("#dsSetupWrapper").data("modifiedFlag", true);
        
        <#elseif action = "edit">
          //delete button
          $("#deletebutton").click(function(e){connectkey.deleteDSAgent(e,"editpage", "${EIP_RealPath}/EIPAdmin/DBAgent?action=delete&agentType=autoFill&name[]=${profile.name}", "${msg.action_deleteSingleAFPConfirmMsg}", "${msg.action_deleteSingleAFPSuccessMsg}", "${msg.action_deleteSingleAFPFailureMsg}", "${EIP_RealPath}/EIPAdmin/AutofillProfiles");});
        </#if>


      }); //end document ready code...    
    </script>
  
  </head>

  <body id="AutofillProfile" class="adminsection">
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

<#if hasMappedBtns>
<div id="mapped-btn-warn"><p>${msg.AutoFillProfilePage_mappedBtnWarning}</p></div>
<#-- Mapping List -->
<div class="mappedListing">
  <div id="assignedScanBtns">
    <span id="mappedListingTypeLabel">${assignedbtns} ${msg.dsAssignedButtons}</span> 
    <#list serverConfigData["//button[@dbAgent='${profile.name}']"] as button>
      <a href="${EIP_RealPath}/EIPAdmin/Button?action=editsettings&buttonId=${button.@buttonId}&parentId=${button.@parentId}">${button.@name}</a>
      <#if button_has_next>, </#if>
    </#list>
  </div>
</div>
</#if>

<form action="${EIP_RealPath}/EIPAdmin/DBAgent" method="post" class="AutofillProfileForm" id="EditAutofillProfile">
  <input name="name" id="afpname" type="hidden" value="${profile.name}"/>
  <input name="action" type="hidden" value="update"/>
  <input name="agentType" type="hidden" value="autoFill"/>
  <input name="query" type="hidden" value=""/>
  <fieldset id="dsSetupWrapper">
    <h3>${msg.afp_dsconn_heading}</h3>
    <p>${msg.afp_dsconn_subheading}</p>

    <ul>
      <li>
        <label for="dataSource" class="labeltip" title="${msg.afp_datasource_tip}">${msg.afp_datasource_label}</label>
        <div class="field">
          <select id="dataSource" name="dataSource" ${mappedBtnDisabled}>
            <#list dataSources as src>
            <option value="${src}" <@isOptionSelected src profile.dataSource/> >${src}</option>
            </#list>
          </select>
        </div>
      </li>

      <#assign dbFieldsVisibility><#if profile.dataSource = "Microsoft Access" || profile.dataSource = "Microsoft Excel">style="display:none"</#if></#assign>

      <!-- Server Database Only Fields -->
      <li class="db-only" ${dbFieldsVisibility} >
        <label for="host" class="labeltip" title="${msg.afp_host_tip}">${msg.afp_host_label}</label>
        <div class="field"><input id="host" name="host" type="text" ${mappedBtnDisabled} value="${profile.host}"></div>
      </li>
      <li class="db-only" ${dbFieldsVisibility}>
        <label for="port" class="labeltip" title="${msg.afp_port_tip}">${msg.afp_port_label}</label>
        <div class="field"><input id="port" name="port" type="text" ${mappedBtnDisabled} value="${profile.port}"></div>
      </li>
      <li class="db-only" ${dbFieldsVisibility}>
        <label for="username" class="labeltip" title="${msg.afp_username_tip}">${msg.afp_username_label}</label>
        <div class="field"><input id="username" name="username" type="text" ${mappedBtnDisabled} value="${profile.username}"/></div>
      </li>
      <li class="db-only" ${dbFieldsVisibility}>
        <label for="password" class="labeltip" title="${msg.afp_password_tip}">${msg.afp_password_label}</label>
        <div class="field"><input id="password" name="password" type="password" ${mappedBtnDisabled} value="${profile.password}"/></div>
      </li>
      
      <!-- Common Fields -->
      <li>
        <label for="dbname" class="labeltip" title="${msg.afp_dbname_tip}">${msg.afp_dbname_label}</label>
        <div class="field"><input id="dbname" name="dbname" type="text" class="large required" ${mappedBtnDisabled} value="${profile.dbname}"></div>
      </li>
    </ul>

  </fieldset>

  <fieldset id="dsMappingWrapper" style="display:none">
    <h3>${msg.afp_mapping_heading}</h3>
    <p>${msg.afp_mapping_subheading}</p>
    <div class="objectlist-header">
      <label for="table" class="labeltip" title="${msg.afp_table_tip}">${msg.afp_table_label}</label>
      <select id="table" name="table" curval="${profile.table}" ${mappedBtnDisabled}>
        <#list DB_ListTables as table>
          <option value="${table}" <@isOptionSelected table profile.table /> >${table}</option>
        </#list>
      </select>

      <label for="documentType" class="labeltip" title="${msg.afp_doctype_tip}">${msg.afp_doctype_label}</label>
      <select id="documentType" name="documentType" curval="${profile.documentType}" ${mappedBtnDisabled}>
        <#list EIP_DSData.getDocumentObjectList() as map>
          <#list map?keys as entry>
            <option value="${map[entry]}" <@isOptionSelected map[entry] profile.documentType /> >${entry}</option>
          </#list>
        </#list>
      </select>
    </div>
    <div id="afpMappingTable-wrapper">
    <table class="objectlist afp-mapping-table" id="afpMappingTable">
      <thead>
        <tr>
          <th class="name">${msg.afp_mapping_table_colhead_name}</th>
          <th class="name">&#8594;</th>
          <th class="name">${msg.afp_mapping_table_colhead_dsprop}</th>
          <th class="primarycol">
            <label for="append_info" class="labeltip">${msg.afp_mapping_table_colhead_primary}
              <span class="smallipopHint">${msg.afp_mapping_table_colhead_primary_tip}</span>
            </label>
          </th>
        </tr>
      </thead>
      <tbody id="afp-mapping-tbody">
        <#if DB_ListColumns?has_content>
          <#list DB_ListColumns as column>
            <#assign dsProp = profile.columns["column[@name='${column}']/@dsProperty"][0]!"" />
            <#assign isPrimary = profile.columns["column[@name='${column}']/@primary"][0]!"false" />
            <#assign mappedTRClass><#if dsProp?has_content>mapped</#if></#assign>
            <#assign primaryCbxEnabledState><#if dsProp?has_content><#else>disabled="disabled"</#if></#assign>
            <tr class="${mappedTRClass}">
              <td class="name">
                <span class="column-name">${column}</span>
                <input type="hidden" id="columnNames-${column}" class="columnNames" name="columnNames[]" value="${column}" ${primaryCbxEnabledState}/>
              </td>
              <td class="name">&#8594;</td>
              <td class="name">
                <select id="dsProperty-${column}" class="dsProperty" name="dsProperty[]" ${mappedBtnDisabled} preval="${dsProp}">
                  <option class="unassigned" value="">${msg.dsProperty_noMapping}</option>
                  <optgroup class="dsprops-reqfields" label="${msg.afp_mapping_property_requiredFields}">
                    <#list EIP_DSData.getDocumentRequiredProperties("${profile.documentType}") as map>
                      <#assign isusedreq>
                        <#list profileProps as prop>
                          <#if prop != dsProp && prop == map["value"]>disabled='disabled'</#if>
                        </#list>
                      </#assign>
                      <#if map['menu'] = ""> <#-- Don't use DocuShare menu properties -->
                        <option value="${map['value']}" ${isusedreq} <@isOptionSelected map["value"] dsProp /> >${map['label']}</option>
                      </#if>
                    </#list>
                  </optgroup>
                  <optgroup class="dsprops-optionalfields" label="${msg.afp_mapping_property_optionalFields}">
                    <#list EIP_DSData.getDocumentProperties("${profile.documentType}") as map>
                      <#assign isusedopt>
                        <#list profileProps as prop>
                          <#if prop != dsProp && prop == map["value"]>disabled='disabled'</#if>
                        </#list>
                      </#assign>
                      <#if map['menu'] = ""> <#-- Don't use DocuShare menu properties -->
                        <option value="${map['value']}" ${isusedopt} <@isOptionSelected map["value"] dsProp /> >${map['label']}</option>
                      </#if>
                    </#list>
                  </optgroup>
                </select>
              </td>
              <td class="primarycol">
                <input type="checkbox" id="primaryckbx-${column}" class="primary-ckbx" ${mappedBtnDisabled} <#if isPrimary='true'>checked="checked"</#if> ${primaryCbxEnabledState} />
                <input type="hidden" id="primary-${column}" class="primary-hidden" name="primary[]" value="${isPrimary}" ${primaryCbxEnabledState}/>
              </td>
            </tr>
          </#list>
        <#else>
          <tr><td colspan="10">No Mapping specified.</td></tr>
        </#if>
      </tbody>
      <!--Template tbody used for ajax calls that retrieve table columns -->
      <@afpColumnlistTemplate profile.documentType />
    </table>
    </div>
  </fieldset>

  <div id="buttonrow">
    <button type="button" id="dsNext">${msg.dsWizard_next}</button>
    <button type="button" id="dsBack" style="display:none">${msg.dsWizard_back}</button>
    <#if !hasMappedBtns>
    <button type="submit" id="dsApply" style="display:none">${msg.editDevicePage_btn_applyLabel}</button>
    <button id="deletebutton" type="button" class="btn_danger">${msg.afp_delete_profile_btn_label}</button>
    <#else>
    <button type="submit" id="dsApply" style="display:none" disabled="disabled">${msg.editDevicePage_btn_applyLabel}</button>
    <button id="deletebutton" type="button" class="btn_danger" disabled="disabled">${msg.afp_delete_profile_btn_label}</button>
    <span class="mappedwarnforprop hastip" title="${msg.afp_EditDisabled}">${msg.datasource_restricted_modify}</span>
    </#if>
    <span id="dbconnpendingstatus" style="display:none">${msg.dsConnectionProgress}</span>
    <div class="returnlink"><a href="${EIP_RealPath}/EIPAdmin/AutofillProfiles">${msg.afp_return_to_listing_page}</a></div>
  </div>
</form>
</#macro>


<#macro add_form>
<form action="${EIP_RealPath}/EIPAdmin/DBAgent" method="post" class="AutofillProfileForm" id="AddAutofillProfile">
  <input name="action" type="hidden" value="update"/>
  <input name="agentType" type="hidden" value="autoFill"/>
  <input name="query" type="hidden" value=""/>
  <fieldset id="dsSetupWrapper">
    <h3>${msg.afp_dsconn_heading}</h3>
    <p>${msg.afp_dsconn_subheading}</p>
    <ul>
      <li>
        <label for="name" class="labeltip" title="${msg.afp_name_tip}">${msg.afp_name_label}</label>
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
    <h3>${msg.afp_mapping_heading}</h3>
    <p>${msg.afp_mapping_subheading}</p>
    <div class="objectlist-header">
      <label for="table" class="labeltip" title="${msg.afp_table_tip}">${msg.afp_table_label}</label>
      <select id="table" name="table" curval=""></select>
      <label for="documentType" class="labeltip" title="${msg.afp_doctype_tip}">${msg.afp_doctype_label}</label>
      <select id="documentType" name="documentType" curval="${EIP_DSData.getDocumentObjectList()[0]?values[0]}">
        <#list EIP_DSData.getDocumentObjectList() as map>
          <#list map?keys as entry>
            <option value="${map[entry]}">${entry}</option>
          </#list>
        </#list>
      </select>
    </div>
    <div id="afpMappingTable-wrapper">
    <table class="objectlist afp-mapping-table" id="afpMappingTable">
      <thead>
        <tr>
          <th class="name">${msg.afp_mapping_table_colhead_name}</th>
          <th class="name">&#8594;</th>
          <th class="name">${msg.afp_mapping_table_colhead_dsprop}</th>
          <th class="primarycol">${msg.afp_mapping_table_colhead_primary}</th>
        </tr>
      </thead>
      <tbody id="afp-mapping-tbody">
        <tr><td colspan="10" class="notsetup">${msg.afp_mapping_table_notsetup}</td></tr>
      </tbody>
      <#--Template tbody used for ajax calls that retrieve table columns -->
      <@afpColumnlistTemplate EIP_DSData.getDocumentObjectList()[0]?values[0] />
    </table>
    </div>
  </fieldset>

  <div id="buttonrow">
    <button type="button" id="dsNext">${msg.dsWizard_next}</button>
    <button type="button" id="dsBack" style="display:none">${msg.dsWizard_back}</button>
    <button type="submit" id="dsApply" style="display:none">${msg.editDevicePage_btn_addLabel}</button>
    <span id="dbconnpendingstatus" style="display:none">${msg.dsConnectionProgress}</span>
    <div class="returnlink"><a href="${EIP_RealPath}/EIPAdmin/AutofillProfiles"> ${msg.afp_return_to_listing_page}</a></div>
  </div>
</form>
</#macro>

<#-- isOptionSelected
      Determines if a select option is selected or not.
-->
<#macro isOptionSelected optval selval><#if optval = selval>selected="selected"</#if></#macro>


<#macro afpColumnlistTemplate doctype>
<tbody id="afp-mapping-tbody-template">
  <tr>
    <td class="name">
      <span class="column-name"></span>
      <input type="hidden" class="columnNames" name="columnNames[]" disabled="disabled" value="" />
    </td>
    <td class="name">&#8594;</td>
    <td class="name">
      <select name="dsProperty[]" class="dsProperty" disabled="disabled" preval="">
        <option class="unassigned" value="">${msg.dsProperty_noMapping}</option>
        <optgroup class="dsprops-reqfields" label="${msg.afp_mapping_property_requiredFields}">
          <#list EIP_DSData.getDocumentRequiredProperties("${doctype}") as map>
            <#if map['menu'] = ""> <#-- Don't use DocuShare menu properties -->
              <option value="${map['value']}">${map['label']} ${map['menu']}</option>
            </#if>
          </#list>
        </optgroup>
        <optgroup class="dsprops-optionalfields" label="${msg.afp_mapping_property_optionalFields}">
          <#list EIP_DSData.getDocumentProperties("${doctype}") as map>
            <#if map['menu'] = ""> <#-- Don't use DocuShare menu properties -->
              <option value="${map['value']}">${map['label']}</option>
            </#if>
          </#list>
        </optgroup>
      </select>
    </td>
    <td class="primarycol">
      <input type="checkbox" class="primary-ckbx" disabled="disabled" />
      <input type="hidden" class="primary-hidden" name="primary[]" disabled="disabled" value="false" />
    </td>
  </tr>
</tbody>
</#macro>