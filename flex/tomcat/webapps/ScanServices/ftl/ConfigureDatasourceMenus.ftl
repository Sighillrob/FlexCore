<#import "StandaloneMenu.ftl" as menu />
<#import "/locale/messages_${locale}.ftl" as msg />
<#assign dsMenus = buttonData.EIPConfig.MenuAgent />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="cache-control" content="max-age=0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="pragma" content="no-cache" />
    <title>${msg.DatasourceMenuPage_title}</title>
    ${ds_admin_site_style}
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/admin_styles.css" />
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/scripts/lib/jquery-ui/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/jquery.smallipop.css" media="all" title="Screen"/>
    <!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/admin_ds6_ie8-7.css" /><![endif]-->

    <script src="${EIP_RealPath}/scripts/lib/jquery.js"></script>
    <!-- jquery plugins -->
    <script src="${EIP_RealPath}/scripts/lib/jquery-ui/jquery-ui.min.js"></script>
    <script src="${EIP_RealPath}/scripts/jquery.nimble.loader.js"></script>
    <script src="${EIP_RealPath}/scripts/jquery.form.js"></script>
    <script src="${EIP_RealPath}/scripts/jquery.smallipop.js"></script>
    <script src="${EIP_RealPath}/scripts/modernizr.js"></script>
    <!-- Connectkey library -->
    <script src="${EIP_RealPath}/scripts/connectkey.js"></script>

    <script>
      $(document).ready(function() {
        //onload functions...
        connectkey.uncheckAllCbx();
        //event listeners...
        $("#chkbx_selectAll").click(function(e){connectkey.selectAllCheckboxes(e)});
        $(".objectlist tbody input[type=checkbox]").click(connectkey.toggleSelectedActionBtns)
        $("#btn_addDSMenu").click(function(e){window.location.href="${EIP_RealPath}/EIPAdmin/DBAgent?agentType=simpleMenu&action=add"});
        
        //delete multiple or single...
        $("#btn_delSel").click(function(e){connectkey.deleteSelectedODBCMenus("${EIP_RealPath}/EIPAdmin/DBAgent?agentType=simpleMenu", "${msg.action_deleteDSMenuConfirmMsg}", "${msg.action_deleteDSMenuSuccessMsg}", "${msg.action_deleteDSMenuFailureMsg}", "${msg.action_deleteDSMenuMappedFailureMsg}");});
        $(".action_delete").click(function(e){connectkey.deleteDSAgent(e,"listpage", "${EIP_RealPath}/EIPAdmin/DBAgent", "${msg.action_deleteSingleDSMenuConfirmMsg}", "${msg.action_deleteSingleDSMenuSuccessMsg}", "${msg.action_deleteSingleDSMenuFailureMsg}", "${EIP_RealPath}/EIPAdmin/AutofillProfiles");});

      }); //end document ready code...    
    </script>

  </head>
  <body id="DatasourceMenus" class="adminsection">
    <#include "adminheader.ftl">
    <@menu.show/>
    <section id="content" class=''>
      <h2>${msg.DatasourceMenuPage_title}</h2>
      <!-- page description -->
      <p id="page_description">${msg.DatasourceMenuPage_subtitle}</p>
      <!-- page body -->
      <section id="page_body">

        <span id="selectedbtns" style="display:none">
          <button id="btn_delSel" class="btn_danger hastip" title="">${msg.btnLabel_DeleteSelDataSourceMenus}</button>
        </span>
        
        <button id="btn_addDSMenu" type="button" class="hastip" title="">${msg.btnLabel_AddDatasourceMenu}</button>
        <!--<button id="btn_addCascadeMenu" type="button" class="hastip" title="">${msg.btnLabel_AddDatasourceMenu}</button>-->

        <form name="datasourcemenulistform" id="datasourcemenulistform">
          <table class="objectlist">
            
            <!--Column Grouping-->
            <colgroup>
              <col/>
              <col/>
              <col/>
              <col/>
              <col/>
              <col/>
              <col/>
            </colgroup>
            <colgroup class="muted">
              <col/>
            </colgroup>
            
            <!--Heading-->
            <thead>
              <tr>
                <th class="ckbx"><input type="checkbox" id="chkbx_selectAll" class="cbxtip" title=""/></th>
                <th class="name">${msg.dataSourceTable_col_menuname}</th>
                <th class="leftalign">${msg.dataSourceTable_col_datasource}</th>
                <th class="leftalign">${msg.dataSourceTable_col_tablesource}</th>
                <th class="leftalign">${msg.dataSourceTable_col_property}</th>
                <th class="leftalign">${msg.dataSourceTable_col_dms}</th>
                <th class="leftalign">${msg.autofillTable_col_buttonsUsing}</th>
                <th class="actions muted">${msg.devicetable_colLabel_actions}</th>
              </tr>
            </thead>
            
            <!--Body-->
            <tbody>
            <#if dsMenus[0]??>
            <#list dsMenus as dsMenu>
              <#assign hasDependentMenus = buttonData["//DependentMenuProfile[menuAgent='${dsMenu.name}']/.."][0]?? />
              <#assign hasMappedBtns =  buttonData["//metadata[@menuAgent='${dsMenu.name}']/.."][0]?? />
              <tr>
                <td class="ckbx"><input type="checkbox" name="name[]" id="${dsMenu.name}" value="${dsMenu.name}" hasDMS="${hasDependentMenus?string}" hasScanBtn="${hasMappedBtns?string}" /></td>
                <td class="name">
                  <img src="../images/admin/dbMenu.svg" width="16px" height="17px" title="${msg.dataSourceTable_type_dsMenuTip}"/>
                  <a href="${EIP_RealPath}/EIPAdmin/DBAgent?agentType=simpleMenu&amp;action=edit&amp;name=${dsMenu.name}">${dsMenu.name}</a>
                </td>
                <td class="leftalign">
                  <#assign dsiconclass><#if dsMenu.host != "">ds-server-icon<#else>ds-file-icon</#if></#assign>
                  <span class="ds-type ${dsiconclass}">${dsMenu.dataSource}</span>
                  <span class="ds-loc">
                    <#if dsMenu.host != "">${dsMenu.dbname}@${dsMenu.host}:${dsMenu.port}<#else>${dsMenu.dbname}</#if>
                  </span>
                </td>
                <td class="leftalign ds-src-vals">
                  <div><span class="ds-src-label">${msg.dataSourceTable_col_tablesource_label}</span> <span class="ds-table-col">${dsMenu.table}/${dsMenu.column.@label}</span></div>
                  <div><span class="ds-src-label">${msg.dataSourceTable_col_tablesource_value}</span> <span class="ds-table-col">${dsMenu.table}/${dsMenu.column.@value}</span></div>
                </td>
                
                <td class="leftalign">
                    <#list EIP_DSData.getDocumentObjectList() as map>
                      <#list map?keys as entry>
                        <#if map[entry] = dsMenu.documentType >${entry}</#if>
                      </#list>
                    </#list>
                    /
                    <span style="color:#666">
                      <#list EIP_DSData.getDocumentRequiredProperties("${dsMenu.documentType}") as map>
                          <#if map['value'] = dsMenu.property >${map['label']}</#if>
                      </#list>
                      <#list EIP_DSData.getDocumentProperties("${dsMenu.documentType}") as map>
                          <#if map['value'] = dsMenu.property >${map['label']}</#if>
                      </#list>
                    </span>
                </td>
                <td class="leftalign">
                  <#if hasDependentMenus>
                    <ul class="dmslist">
                    <#list buttonData["//DependentMenuProfile[menuAgent='${dsMenu.name}']"] as dms>
                      <li><a href="${EIP_RealPath}/EIPAdmin/DBAgent?agentType=dependentMenu&action=edit&profileName=${dms.@name}">${dms.@name}</a></li>
                    </#list>
                    </ul>
                  <#else>
                    <span class="emptymsg">${msg.autofillTable_noAssignedButtons}</span>
                  </#if>
                </td>
                <td class="leftalign">
                  
                  <#if hasMappedBtns>
                    <ul class="buttonlist">
                    <#list buttonData["//metadata[@menuAgent='${dsMenu.name}']/.."] as button>
                      <li><a href="${EIP_RealPath}/EIPAdmin/Button?action=editsettings&buttonId=${button.@buttonId}&parentId=${button.@parentId}">${button.@name}</a></li>
                    </#list>
                    </ul>
                  <#else>
                    <span class="emptymsg">${msg.autofillTable_noAssignedButtons}</span>
                  </#if>
                </td>
                <td class="actions"><@actionmenu dsMenu.name hasMappedBtns hasDependentMenus/></td>
              </tr>
            </#list>
            <#else>
              <tr><td class="emptylistmsg" colspan="20">${msg.dataSourceTable_empty}</td></tr>
            </#if>
            </tbody>
          </table>
        </form>

      </section>
    </section>
  </body>
</html>


<#macro actionmenu menuname hasMappedBtns hasDependentMenus>
  <ul class="actionmenu clearfix">
    <li class="action_edit"><a class="actiontip" href="${EIP_RealPath}/EIPAdmin/DBAgent?agentType=simpleMenu&amp;action=edit&amp;name=${menuname}" title="${msg.dataSourceTable_action_Edit_label}">${msg.dataSourceTable_action_Edit_label}</a></li>
    
    <#if !hasMappedBtns && !hasDependentMenus>
      <li class="action_delete"><a class="actiontip" href="${EIP_RealPath}/EIPAdmin/DBAgent?agentType=simpleMenu&amp;action=delete&amp;name[]=${menuname}" title="${msg.dataSourceTable_action_Delete_label}">${msg.dataSourceTable_action_Delete_label}</a></li>
    <#else>
      <#assign hasMapsMsg="">
      <#if hasMappedBtns && !hasDependentMenus>
        <#assign hasMapsMsg="${msg.dsm_deleteaction_mappedbtn_msg}">
      <#elseif !hasMappedBtns && hasDependentMenus>
        <#assign hasMapsMsg="${msg.dsm_deleteaction_dm_msg}">
      <#elseif hasMappedBtns && hasDependentMenus>
        <#assign hasMapsMsg="${msg.dsm_deleteaction_mappedbtnanddm_msg}">
      </#if>
      <li class="action_delete_disabled"><a class="actiontip" href="javascript:;" title="${hasMapsMsg}">${msg.dataSourceTable_action_Delete_label}</a></li>  
    </#if>
  </ul>
</#macro>