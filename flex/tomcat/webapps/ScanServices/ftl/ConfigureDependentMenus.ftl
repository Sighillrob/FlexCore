<#import "StandaloneMenu.ftl" as menu />
<#import "/locale/messages_${locale}.ftl" as msg />
<#assign dmProfiles = buttonData.EIPConfig.DependentMenuProfile />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="cache-control" content="max-age=0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="pragma" content="no-cache" />
    <title>${msg.dmsPage_title}</title>
    ${ds_admin_site_style}
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/admin_styles.css" />
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/scripts/lib/jquery-ui/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/jquery.smallipop.css" media="all" title="Screen"/>
    <!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/admin_ds6_ie8-7.css" /><![endif]-->

    <script src="${EIP_RealPath}/scripts/lib/jquery.js"></script>
    <!-- jquery plugins -->
    <script src="${EIP_RealPath}/scripts/lib/jquery-ui/jquery-ui.min.js"></script>
    <script src="${EIP_RealPath}/scripts/jquery.nimble.loader.js"></script>
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
        $("#btn_addDMSet").click(function(e){window.location.href="${EIP_RealPath}/EIPAdmin/DBAgent?agentType=dependentMenu&action=add"});
        
        //delete multiple or single...
        $("#btn_delSelDMSets").click(function(e){connectkey.deleteSelectedDSMs("${EIP_RealPath}/EIPAdmin/DBAgent?agentType=dependentMenu", "${msg.dmsPage_action_deleteConfirmMsg_multi}", "${msg.dmsPage_action_deleteSuccessMsg_multi}", "${msg.dmsPage_action_deleteFailureMsg_multi}", "${msg.dmsPage_action_deleteFailureMappingMsg_multi}");});
        
        $(".action_delete").click(function(e){connectkey.deleteDMS(e,"listpage", "${EIP_RealPath}/EIPAdmin/DBAgent", "${msg.dmsPage_action_deleteConfirmMsg_single}", "${msg.dmsPage_action_deleteSuccessMsg_single}", "${msg.dmsPage_action_deleteFailureMsg_single}", "${EIP_RealPath}/EIPAdmin/ConfigureDependentMenus");});

      }); //end document ready code...    
    </script>

  </head>
  <body id="DependentDatasourceMenus" class="adminsection">
    <#include "adminheader.ftl">
    <@menu.show/>
    <section id="content" class=''>
      <h2>${msg.dmsPage_title}</h2>
      <!-- page description -->
      <p id="page_description">${msg.dmsPage_subtitle}</p>
      <!-- page body -->
      <section id="page_body">

        <span id="selectedbtns" style="display:none">
          <button id="btn_delSelDMSets" class="btn_danger">${msg.dmsPage_deleteSelectedBtn}</button>
        </span>
        
        <button id="btn_addDMSet" type="button">${msg.dmsPage_addBtn}</button>

        <form name="datasourcemenulistform" id="datasourcemenulistform">
          <table class="objectlist">
            
            <!--Column Grouping-->
            <colgroup>
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
                <th class="ckbx"><input type="checkbox" id="chkbx_selectAll" class="cbxtip"/></th>
                <th class="name">${msg.dmsPage_table_col_name}</th>
                <th class="leftalign">${msg.dmsPage_table_col_menus}</th>
                <th class="leftalign">${msg.dmsPage_table_col_btnsassigned}</th>
                <th class="actions muted">${msg.dmsPage_table_col_actions}</th>
              </tr>
            </thead>
            
            <!--Body-->
            <tbody>
            <#if dmProfiles[0]??>
            <#list dmProfiles as profile>
              <#assign hasMappedBtns = buttonData["//metadata[@dependentMenuProfile='${profile.@name}']"][0]?? />

              <tr>
                <td class="ckbx"><input type="checkbox" name="profileName[]" id="${profile.@name}" value="${profile.@name}" hasScanBtn="${hasMappedBtns?string}"/></td>
                <td class="name">
                  <img src="../images/admin/dbDependentMenu.svg" width="16px" height="17px" title="${msg.dmsPage_table_iconTip}"/>
                  <a href="${EIP_RealPath}/EIPAdmin/DBAgent?agentType=dependentMenu&amp;action=edit&amp;profileName=${profile.@name}">${profile.@name}</a>
                </td>
                <td class="leftalign">
                  <#if profile.menuAgent[0]??>
                  <ol class="menulist">
                  <#list profile.menuAgent as menu>
                    <li><a href="${EIP_RealPath}/EIPAdmin/DBAgent?agentType=simpleMenu&action=edit&name=${menu}">${menu}</a></li>
                  </#list>
                  </ol>
                  </#if>
                </td>
                <td class="leftalign">
                  
                  <#if hasMappedBtns>
                    <ul class="buttonlist">
                    <#list buttonData["//metadata[@dependentMenuProfile='${profile.@name}']/.."] as button>
                      <li><a href="${EIP_RealPath}/EIPAdmin/Button?action=editsettings&buttonId=${button.@buttonId}&parentId=${button.@parentId}">${button.@name}</a></li>
                    </#list>
                    </ul>
                  <#else>
                    <span class="emptymsg">${msg.autofillTable_noAssignedButtons}</span>
                  </#if>

                </td>
                <td class="actions"><@actionmenu profile.@name hasMappedBtns /></td>
              </tr>
            </#list>
            <#else>
              <tr><td class="emptylistmsg" colspan="20">${msg.dmsPage_table_empty}</td></tr>
            </#if>
            </tbody>
          </table>
        </form>

      </section>
    </section>
  </body>
</html>


<#macro actionmenu menuname hasMappedBtns>
  <ul class="actionmenu clearfix">
    <li class="action_edit"><a class="actiontip" href="${EIP_RealPath}/EIPAdmin/DBAgent?agentType=dependentMenu&amp;action=edit&amp;profileName=${menuname}" title="${msg.dataSourceTable_action_Edit_label}">${msg.dataSourceTable_action_Edit_label}</a></li>
    <#if hasMappedBtns>
      <li class="action_delete_disabled"><a class="actiontip" href="javascript:void(0);" title="${msg.dmsPage_table_col_action_DeleteDisabled}">${msg.dataSourceTable_action_Delete_label}</a></li>
    <#else>
      <li class="action_delete"><a class="actiontip" href="${EIP_RealPath}/EIPAdmin/DBAgent?agentType=dependentMenu&amp;action=delete&amp;profileName[]=${menuname}" title="${msg.dataSourceTable_action_Delete_label}">${msg.dataSourceTable_action_Delete_label}</a></li>    
    </#if>
  </ul>
</#macro>