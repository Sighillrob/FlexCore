<#import "StandaloneMenu.ftl" as menu />
<#import "/locale/messages_${locale}.ftl" as msg />


<#if action = "edit">
  <#assign profile = serverConfigData["//DependentMenuProfile[@name='${profileName}']"] />
  <#assign hasMappedBtns = serverConfigData["//metadata[@dependentMenuProfile='${profileName}']"][0]??/>
  <#assign title>${msg.dmPage_edit_title} <span class="quiet">${profile.@name}</span></#assign>
  <#assign headertitle>${msg.dmPage_edit_title} ${profile.@name}</#assign>
  <#assign description>
        <li>${msg.dmPage_edit_subtitle}</li>
  </#assign>
  <#assign pm = menuData.EditDependentMenuAgents.MenuAgent[0]/>
  <#assign dm1 = menuData.EditDependentMenuAgents.MenuAgent[1]/>
  <#assign dm2 = menuData.EditDependentMenuAgents.MenuAgent[2]!''/>

<#elseif action = "add">
  <#assign title="${msg.dmPage_add_title}"/>
  <#assign headertitle="${msg.dmPage_add_title}"/>
  <#assign description>
        <li>${msg.dmPage_add_subtitle}</li>
  </#assign>
</#if>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>${headertitle}</title>
    ${ds_admin_site_style}
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/admin_styles.css" />
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/scripts/lib/jquery-ui/jquery-ui.css" />   
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/jquery.smallipop.css" media="all" title="Screen"/>
    <!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/admin_ds6_ie8-7.css" /><![endif]-->
    <script src="${EIP_RealPath}/scripts/lib/jquery.js"></script>
    <script src="${EIP_RealPath}/scripts/lib/jquery-ui/jquery-ui.min.js"></script>
    <script src="${EIP_RealPath}/scripts/jquery.nimble.loader.js"></script>
    <script src="${EIP_RealPath}/scripts/jquery.smallipop.js"></script>
    <script src="${EIP_RealPath}/scripts/modernizr.js"></script>
    <script src="${EIP_RealPath}/scripts/connectkey.js"></script>
    
    <script>
      $(document).ready(function() {

        //get a list of existing menu agents and put them into a json array of object literals.
        connectkey.menuAgents = [<@compress single_line=true>
          <#list serverConfigData.EIPConfig.MenuAgent as menu>
          { 
            name : '${menu.name}',
            dataSource : '${menu.dataSource}',
            host : '${menu.host}',
            port : '${menu.port}',
            username : '${menu.username}',
            password : '${menu.password}',
            dbname : '${menu.dbname?url('ISO-8859-1')}',
            table : '${menu.table}',
            <#if menu.dependency[0]??>
              dependencies : [
              <#list menu.dependency as dependency>
                {'dependentAgent': '${dependency.@dependentAgent}',
                 'profile' : '${dependency.@profile}',
                 'dependents': [
                 <#list dependency.depend as depend>
                    {'keyValue' : '${depend.@keyValue}', 'keyLabel' : '${depend.@keyLabel}', 'value' : '${depend.@value}', 'label' : '${depend.@label}'}
                    <#if depend_has_next>,</#if>
                 </#list>
                 ]
                }
                <#if dependency_has_next>,</#if>
              </#list>
              ]
            </#if>
          }<#if menu_has_next>,</#if>
          </#list>
        </@compress>];

        //event listeners...
        $("#dependentMenuList select").change(function(e){connectkey.loadDMColumnValues(e, '${EIP_RealPath}/EIPAdmin/Search?searchType=metaMenuValue&menuAgent=', '${EIP_RealPath}/EIPAdmin/DBAgent?action=listColumns','${msg.dmPage_mapingtable_emptyoptionshelp}', '${msg.dmPage_colMenuNoSelection}',
        {
          "mapping" : "${msg.dmPage_maptblhdr_mapping}",
          "options" : "${msg.dmPage_maptblhdr_options}",
          "optscolsubheading" : "${msg.dmPage_maptblhdr_optscolsubheading}",
          "columnforlabel" : "${msg.dmPage_maptblhdr_colforlabel}",
          "columnforvalue" : "${msg.dmPage_maptblhdr_colforvalue}"
        }
        )})

        $("#dmMappingTable").on("change", ".tablecolumn-label, .tablecolumn-value", function(e){connectkey.loadDMRowValues(e, '${EIP_RealPath}/EIPAdmin/Search?searchType=columnLabelValue','${EIP_RealPath}/EIPAdmin/DBAgent?action=listColumns','${msg.dmPage_mapingtable_emptyoptionshelp}', '${msg.dmPage_colMenuNoSelection}')})

        $("body").on("blur", ".required_error", function(e){connectkey.checkRequiredErrorField(e);});

        <#if action = "add">
          connectkey.usedtitles = [<@compress single_line=true>
          <#if serverConfigData.EIPConfig.DependentMenuProfile[0]??>
            <#list serverConfigData.EIPConfig.DependentMenuProfile as profile>"${profile.@name}"<#if profile_has_next>,</#if></#list>
          </#if>
          </@compress>]

          $("#profileName").blur(function(e){connectkey.duplicateMenunameCheck(e,connectkey.usedtitles, '<p class="fielderror error_duplicatetitle"><strong>${msg.fieldErrorTitle}</strong> ${msg.dmPage_profileName_fielderror_duplicatedtitle?js_string}</p>')})

          $("#profileName").blur(function(e){connectkey.illegalCharInMenuNameCheck(e,'<p class="fielderror error_illegalchars"><strong>${msg.fieldErrorTitle}</strong> ${msg.dbsmNoIllegalCharsError} \',\",<,>,&,\~,\!,\@,#,$,*,(,),=,:,+</p>')});

          $("#addDMenuForm").submit(function(e){connectkey.validateForm(e, "${msg.validationErrorGeneralMsg}", '<p class="fielderror error_empty"><strong>${msg.fieldErrorTitle}</strong> ${msg.fielderror_empty}</p>', "${msg.dbsmPage_add_successMsg}", "${msg.dbsmPage_add_failureMsg}", null, function(e){connectkey.saveDMMappedFields("${EIP_RealPath}/EIPAdmin/DBAgent","${EIP_RealPath}/EIPAdmin/ConfigureDependentMenus", "${msg.dbsmPage_add_successMsg}", "${msg.dbsmPage_add_failureMsg}")}, null)});

        <#elseif action = "edit">
          <#if dm2??>
            connectkey.editpageAlignRows();
          </#if>
          
          $("#editDMenuForm").submit(function(e){connectkey.validateForm(e, "${msg.validationErrorGeneralMsg}", '<p class="fielderror error_empty"><strong>${msg.fieldErrorTitle}</strong> ${msg.fielderror_empty}</p>', "${msg.dbsmPage_edit_successMsg}", "${msg.dbsmPage_edit_failureMsg}", null, function(e){connectkey.saveDMMappedFields("${EIP_RealPath}/EIPAdmin/DBAgent","${EIP_RealPath}/EIPAdmin/ConfigureDependentMenus", "${msg.dbsmPage_add_successMsg}", "${msg.dbsmPage_add_failureMsg}")}, null)});

          //delete button
          $("#deletebutton").click(function(e){connectkey.deleteDSAgent(e,"editpage", "${EIP_RealPath}/EIPAdmin/DBAgent?agentType=dependentMenu&action=delete&profileName[]=${profile.@name}", "${msg.action_deleteSingleDSMenuConfirmMsg}", "${msg.action_deleteSingleDSMenuSuccessMsg}", "${msg.action_deleteSingleDSMenuFailureMsg}", "${EIP_RealPath}/EIPAdmin/ConfigureDependentMenus");});
          </#if>

      }); //end document ready code...    
    </script>
  
  </head>

  <body id="DependentDataSourceMenu" class="adminsection">
    <#include "adminheader.ftl">
    <@menu.show/>
    <section id="content" class=''>

      <!-- page title -->
      <h2>${title}</h2>
      <!-- page description -->
      <ul id="page_description">${description}</ul>
      <!-- page body -->
      <section id="page_body">
        <#if action="add">
          <@add_form/>
        <#elseif action="edit">
          <@edit_form/>
        </#if>
      </section>
    </section>
  </body>
</html>

<#-- Edit Form -->
<#macro edit_form>
  <#if hasMappedBtns>
    <div id="mapped-btn-warn">
      <p>${msg.dmPage_mappedBtnWarning}</p>
    </div>
    <div class="mappedListing">
      <div id="assignedScanBtns">
        <span class="mappedListingTypeLabel">${msg.dsAssignedButtons}</span>
        <#list serverConfigData["//metadata[@dependentMenuProfile='${profileName}']/.."] as button>
          <a href="${EIP_RealPath}/EIPAdmin/Button?action=editsettings&buttonId=${button.@buttonId}&parentId=${button.@parentId}">${button.@name}</a>
          <#if button_has_next>, </#if>
        </#list>
      </div>
    </div>
  </#if>
  <form action="${EIP_RealPath}/EIPAdmin/DBAgent" method="post" id="editDMenuForm">
    <input name="profileName" id="profileName" type="hidden" value="${profile.@name}"/>
    <input name="action" type="hidden" value="updateProfile"/>
    <input name="agentType" type="hidden" value="dependentMenu"/>
    
    <#assign btnMappedDisabled = ""/>
    <#if hasMappedBtns>
      <#assign btnMappedDisabled = "disabled='disabled'"/>
    </#if>


    <fieldset>
      <h3>${msg.dmPage_section_SelectODBCMenus}</h3>
      <p>${msg.dmPage_section_SelectODBCMenus_subtitle}</p>
      <ul id="dependentMenuList">
        <li>
          <label for="primaryMenu" class="labeltip" title="${msg.dmPage_primaryMenuTip}">${msg.dmPage_primaryMenuLabel}</label><br/>
          <select name="menuAgents[]" id="primaryMenu" ${btnMappedDisabled} class="required"><@getODBCMenuAgentsOptions profile.menuAgent[0]/></select>
          <#if hasMappedBtns><input type="hidden" name="menuAgents[]" value="${profile.menuAgent[0]}" /></#if>
        </li>
        <li>
          <label for="dependentMenu1" class="labeltip" title="${msg.dmPage_dependentMenuTip1}">${msg.dmPage_dependentMenuLabel1}</label><br/>
          <select name="menuAgents[]" id="dependentMenu1" ${btnMappedDisabled} class="required"><@getODBCMenuAgentsOptions profile.menuAgent[1]/></select>
          <#if hasMappedBtns><input type="hidden" name="menuAgents[]" value="${profile.menuAgent[1]}" /></#if>
        </li>
        <li>
          <label for="dependentMenu2" class="labeltip" title="${msg.dmPage_dependentMenuTip2}">${msg.dmPage_dependentMenuLabel2}</label><br/>
          <select name="menuAgents[]" id="dependentMenu2" ${btnMappedDisabled}><@getODBCMenuAgentsOptions profile.menuAgent[2]!""/></select>
          <#if hasMappedBtns><input type="hidden" name="menuAgents[]" value="${profile.menuAgent[2]!''}" /></#if>
        </li>
      </ul>
    </fieldset>

    <fieldset>
      <h3>${msg.dmPage_section_MapMenuValues}</h3>
      <p>${msg.dmPage_section_MapMenuValues_subtitle}</p>
      <table id="dmMappingTable" class="objectlist">
        <thead id="dmMappingTable_thead">
          <tr>
            <th rowspan="2" class="pm">${profile.menuAgent[0]} <span>${msg.dmPage_maptblhdr_optscolsubheading}</span></th>
            <th colspan="2" class="dm-1">${profile.menuAgent[1]} ${msg.dmPage_maptblhdr_mapping}</th>
            <th rowspan="2" class="dm-1">${profile.menuAgent[1]} ${msg.dmPage_maptblhdr_options}<span> ${msg.dmPage_maptblhdr_optscolsubheading}</span></th>
            <#if profile.menuAgent[2]??>
            <th colspan="2" class="dm-2">${profile.menuAgent[2]} ${msg.dmPage_maptblhdr_mapping}</th>
            <th rowspan="2" class="dm-2">${profile.menuAgent[2]} ${msg.dmPage_maptblhdr_options}<span> ${msg.dmPage_maptblhdr_optscolsubheading}</span></th>
            </#if>
          </tr>
          <tr>
            <th class="dm-1">${msg.dmPage_maptblhdr_colforlabel}</th>
            <th class="dm-1">${msg.dmPage_maptblhdr_colforvalue}</th>
            <#if profile.menuAgent[2]??>
            <th class="dm-2">${msg.dmPage_maptblhdr_colforlabel}</th>
            <th class="dm-2">${msg.dmPage_maptblhdr_colforvalue}</th>
            </#if>
          </tr>
        </thead>
        <tbody id="dmMappingTable_tbody">

          <#assign dm1dataattrs>data-dbname = "${dm1.dbname}" data-host = "${dm1.host}" data-port = "${dm1.port}" data-username = "${dm1.username}" data-password = "${dm1.password}" data-dataSource = "${dm1.dataSource}" data-table = "${dm1.table}" data-order="1"</#assign>
          <#list dm1["dependency[@profile='${profileName}']/depend"] as depend>
            <tr>
              <!-- Primary Menu Options -->
              <td class="options">
                ${depend.@keyLabel} : ${depend.@keyValue}
                <input type="hidden" name="keyLabel[]" value="${depend.@keyLabel}" class="dm-1-keyLabel"/>
                <input type="hidden" name="keyValue[]" value="${depend.@keyValue}" class="dm-1-keyValue"/>
              </td>
              <!-- Dependent Menu 1 Label Column -->
              <td class="labelcell dm-1" ${dm1dataattrs}>
                <select class="tablecolumn-label required" name="columnLabel[]">
                  <@getColumnSelectOptions dm1.columns.column depend.@label />
                </select>
              </td>
              <!-- Dependent Menu 1 Value Column -->
              <td class="valuecell dm-1" ${dm1dataattrs}>
                <select class="tablecolumn-value required" name="columnName[]">
                  <@getColumnSelectOptions dm1.columns.column depend.@value />
                </select>
              </td>

              <#assign dm2optioncount = depend.options.option?size/>
              <!-- Dependent Menu 1 Options -->
              <td class="options nopadding dm-1">
                <#if depend.@label != "" && depend.@value !="">
                <table>
                  <tbody>
                  <#list depend.options.option as option>
                    <tr>
                      <td>
                         ${option.@label} : ${option.@value}
                        <input type="hidden" name="keyLabel[]" value="${option.@label}" class="dm-2-keyLabel"/>
                        <input type="hidden" name="keyValue[]" value="${option.@value}" class="dm-2-keyValue"/>
                      </td>
                    </tr>
                  </#list>
                  </tbody>
                </table>
                <#else>
                <p>${msg.dmPage_mapingtable_emptyoptionshelp}</p>
                </#if>
              </td>
              
              <!-- Dependent Menu 2 Label Column (Only show if we have a 2nd dependent menu!) -->

              <#if menuData.EditDependentMenuAgents.MenuAgent[2]??>

                <#assign dm2dataattrs>data-dbname = "${dm2.dbname}" data-host = "${dm2.host}" data-port = "${dm2.port}" data-username = "${dm2.username}" data-password = "${dm2.password}" data-dataSource = "${dm2.dataSource}" data-table = "${dm2.table}" data-order="2"</#assign>

                <td class="labelcell nopadding dm-2" ${dm2dataattrs}>
                  <table>
                    <#if depend.options.option[0].@value != "">
                      <tbody>
                      <#list depend.options.option as option>
                        <#assign collabel = dm2["dependency[@profile='${profileName}']/depend[@keyValue='${option.@value}'][1]/@label"] />
                        <tr>
                          <td>
                            <select class="tablecolumn-label required" name="columnLabel[]">
                              <@getColumnSelectOptions dm2.columns.column collabel />
                            </select>
                          </td>
                        </tr>
                      </#list>
                      </tbody>
                    </#if>
                  </table>
                </td>

                <!-- Dependent Menu 2 Value Column -->
                <td class="valuecell nopadding dm-2" ${dm2dataattrs}>
                  <table>
                    <#if depend.options.option[0].@value != "">
                    <tbody>
                    <#list depend.options.option as option>
                      <#assign colval = dm2["dependency[@profile='${profileName}']/depend[@keyValue='${option.@value}'][1]/@value"] />
                      <tr>
                        <td>
                          <select class="tablecolumn-value required" name="columnName[]">
                            <@getColumnSelectOptions dm2.columns.column colval />
                          </select>
                        </td>
                      </tr>
                    </#list>
                    </tbody>
                    </#if>
                  </table>
                </td>

                <!-- Dependent Menu 3 Options -->
                <td class="options nopadding dm-2">
                  <table>
                    <tbody>
                      <#list depend.options.option as option>
                        <#assign collabel = dm2["dependency[@profile='${profileName}']/depend[@keyValue='${option.@value}'][1]/@label"] />
                        <#assign colval = dm2["dependency[@profile='${profileName}']/depend[@keyValue='${option.@value}'][1]/@value"] />
                        <tr><td class="nopadding">
                          <table>
                            <tbody>
                              <#if dm2["dependency[@profile='${profileName}']/depend[@keyValue='${option.@value}'][1]/options/option"][0]?? && dm2["dependency[@profile='${profileName}']/depend[@keyValue='${option.@value}'][1]/options/option"][0].@label != "">
                                <#list dm2["dependency[@profile='${profileName}']/depend[@keyValue='${option.@value}'][1]/options/option"] as dm2option>
                                  <tr>
                                    <td>
                                    ${dm2option.@label} : ${dm2option.@value}
                                    </td>
                                  </tr>
                                </#list>
                              <#else>
                                <tr><td class="options nopadding"><p>${msg.dmPage_mapingtable_emptyoptionshelp}</p></td></tr>
                              </#if>
                            </tbody>
                          </table>
                        </td></tr>
                      </#list>
                    </tbody>
                  </table>
                </td>
                
              </#if>
            </tr>
          </#list>
        </tbody>
      </table>
    </fieldset>

    <div id="buttonrow">
      <button type="submit" id="dsApply">${msg.btn_apply}</button>
      <#if !hasMappedBtns>
        <button id="deletebutton" type="button" class="btn_danger">${msg.dmPage_deleteBtnLabel}</button>
      <#else>
        <button id="deletebutton" type="button" class="btn_danger" disabled="disabled">${msg.dmPage_deleteBtnLabel}</button>
        <span class="mappedwarnforprop hastip" title="${msg.dmsPage_table_col_action_DeleteDisabled}">${msg.datasource_prop_mapping_restricted_delete}</span>
      </#if>
      <div class="returnlink"><a href="${EIP_RealPath}/EIPAdmin/ConfigureDependentMenus">${msg.dmPage_returntolisting}</a></div>
    </div>
  </form>
</#macro>


<#-- Add Form -->
<#macro add_form>
  <form action="${EIP_RealPath}/EIPAdmin/DBAgent" method="post" id="addDMenuForm">
    
    <input name="action" type="hidden" value="updateProfile"/>
    <input name="agentType" type="hidden" value="dependentMenu"/>

    <fieldset>
      <ul>
      <li>
        <label for="profileName" class="labeltip" title="${msg.dmPage_profileName_tip}">${msg.dmPage_profileName_label}</label>
        <div class="field"><input id="profileName" name="profileName" type="text" class="required large" value=""></div>
      </li>
    </fieldset>

    <fieldset>
      <h3>${msg.dmPage_section_SelectODBCMenus}</h3>
      <p>${msg.dmPage_section_SelectODBCMenus_subtitle}</p>
      <#if serverConfigData.EIPConfig.MenuAgent[0]??>
        <ul id="dependentMenuList">
          <li>
            <label for="primaryMenu" class="labeltip" title="${msg.dmPage_primaryMenuTip}">${msg.dmPage_primaryMenuLabel}</label><br/>
            <select name="menuAgents[]" id="primaryMenu" class="required"><@getODBCMenuAgentsOptions ""/></select>
          </li>
          <li>
            <label for="dependentMenu1" class="labeltip" title="${msg.dmPage_dependentMenuTip1}">${msg.dmPage_dependentMenuLabel1}</label><br/>
            <select name="menuAgents[]" id="dependentMenu1" class="required" disabled="disabled"><@getODBCMenuAgentsOptions ""/></select>
          </li>
          <li>
            <label for="dependentMenu2" class="labeltip" title="${msg.dmPage_dependentMenuTip2}">${msg.dmPage_dependentMenuLabel2}</label><br/>
            <select name="menuAgents[]" id="dependentMenu2" disabled="disabled"><@getODBCMenuAgentsOptions ""/></select>
          </li>
        </ul>
      <#else>
        <p>${msg.dmPage_noODBCMenus}</p>
      </#if>
    </fieldset>

    <fieldset>
      <h3>${msg.dmPage_section_MapMenuValues}</h3>
      <p>${msg.dmPage_section_MapMenuValues_subtitle}</p>
      <table id="dmMappingTable" class="objectlist">
        <thead id="dmMappingTable_thead" />
        <tbody id="dmMappingTable_tbody" />
      </table>
    </fieldset>

    <div id="buttonrow">
      <button type="submit" id="dsApply">${msg.dmPage_addBtnLabel}</button>
      <div class="returnlink"><a href="${EIP_RealPath}/EIPAdmin/ConfigureDependentMenus">${msg.dmPage_returntolisting}</a></div>
    </div>
  </form>
</#macro>



<#-- isOptionSelected
      Determines if a select option is selected or not.
-->
<#macro isOptionSelected optval selval><#if optval = selval>selected="selected"</#if></#macro>

<#macro getODBCMenuAgentsOptions selval>
<option value="" doctype="">${msg.dmPage_menuoption_none}</option>
  <#list serverConfigData.EIPConfig.MenuAgent as menu>
    <option value="${menu.name}" doctype="${menu.documentType}" <@isOptionSelected menu.name selval/> >${menu.name}</option>
  </#list>
</#macro>

<#macro getColumnSelectOptions options seloption>
  <option value="" doctype="">${msg.dmPage_colMenuNoSelection}</option>
  <#if seloption[0]??>
    <#list options as option>
    <option value="${option.@name}" <@isOptionSelected option.@name seloption/> >${option.@name}</option>
    </#list>
  <#else>
    <#list options as option>
    <option value="${option.@name}">${option.@name}</option>
    </#list>  
  </#if>
</#macro>
