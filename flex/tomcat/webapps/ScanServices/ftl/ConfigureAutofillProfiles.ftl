<#import "StandaloneMenu.ftl" as menu />
<#import "/locale/messages_${locale}.ftl" as msg />
<#assign autofillProfiles = buttonData.EIPConfig.DBAgent />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="cache-control" content="max-age=0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="pragma" content="no-cache" />
    <title>${msg.AutoFillProfilePage_title}</title>
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
        $("#btn_addBtn").click(function(e){window.location.href="${EIP_RealPath}/EIPAdmin/DBAgent?agentType=autoFill&action=add"});

        $("#btn_delSelProfiles").click(function(e){connectkey.deleteSelectedAFPs("${EIP_RealPath}/EIPAdmin/DBAgent?agentType=autoFill", "${msg.action_deleteAFPConfirmMsg}", "${msg.action_deleteAFPSuccessMsg}", "${msg.action_deleteAFPFailureMsg}", "${msg.action_deleteAFPMappedFailureMsg}");});
        
        $(".action_delete").click(function(e){connectkey.deleteDSAgent(e,"listpage", "${EIP_RealPath}/EIPAdmin/DBAgent", "${msg.action_deleteSingleAFPConfirmMsg}", "${msg.action_deleteSingleAFPSuccessMsg}", "${msg.action_deleteSingleAFPFailureMsg}", "${EIP_RealPath}/EIPAdmin/AutofillProfiles");});

      }); //end document ready code...    
    </script>

  </head>
  <body id="AutofillProfiles" class="adminsection">
    <#include "adminheader.ftl">
    <@menu.show/>
    <section id="content" class=''>
      <h2>${msg.AutoFillProfilePage_title}</h2>
      <!-- page description -->
      <p id="page_description">${msg.AutoFillProfilePage_subtitle}</p>
      <!-- page body -->
      <section id="page_body">

        <span id="selectedbtns" style="display:none">
          <button id="btn_delSelProfiles" class="btn_danger hastip" title="">${msg.btnLabel_DeleteSelAutofillProfiles}</button>
        </span>
        
        <button id="btn_addBtn" type="button" class="hastip" title="">${msg.btnLabel_AddAutofillProfile}</button>

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
                <th class="name">${msg.autofillTable_col_name}</th>
                <th class="leftalign">${msg.autofillTable_col_datasource}</th>
                <th class="leftalign">${msg.autofillTable_col_mapping}</th>
                <th class="leftalign">${msg.autofillTable_col_tablename}</th>
                <th class="leftalign">${msg.autofillTable_col_doctype}</th>
                <th class="leftalign">${msg.autofillTable_col_buttonsUsing}</th>
                <th class="actions muted">${msg.autofillTable_col_actions}</th>
              </tr>
            </thead>
            
            <!--Body-->
            <tbody>
              <#if autofillProfiles[0]??>
              <#list autofillProfiles as profile>
                <#assign hasBtnMap = buttonData["//button[@dbAgent='${profile.name}']"][0]??/> <#-- boolean true or false -->
              <tr>
                <td class="ckbx"><input type="checkbox" name="name[]" id="${profile.name}" value="${profile.name}" hasScanBtn="${hasBtnMap?string}"/></td>
                <td class="name">
                  <img src="../images/admin/dbAutoPopulateProfile.svg" width="16px" height="17px"/>
                  <a href="${EIP_RealPath}/EIPAdmin/DBAgent?agentType=autoFill&amp;action=edit&amp;name=${profile.name}">${profile.name}</a></td>
                <td class="leftalign">
                  <#assign dsiconclass><#if profile.host != "">ds-server-icon<#else>ds-file-icon</#if></#assign>
                  <span class="ds-type ${dsiconclass}">${profile.dataSource}</span>
                  <span class="ds-loc">
                    <#if profile.host != "">${profile.dbname}@${profile.host}:${profile.port}<#else>${profile.dbname}</#if>
                  </span>
                </td>
                <td class="mapping">
                  <#if profile.columns?has_content>
                    <#list profile.columns.column as column>
                      <#assign primarykeystatusclass><#if column.@primary == "true">primary</#if></#assign>

                      <span class="actiontip columnmapping ${primarykeystatusclass}" title="${msg.useforAutofillTip}">${column.@name?capitalize}</span> <span style="color:#888">&rarr;</span> 
                      <#list EIP_DSData.getDocumentRequiredProperties("${profile.documentType}") as map>
                          <#if map['value'] = column.@dsProperty >${map['label']}</#if>
                      </#list>
                      <#list EIP_DSData.getDocumentProperties("${profile.documentType}") as map>
                          <#if map['value'] = column.@dsProperty>${map['label']}</#if>
                      </#list>
                      <br/>
                    </#list>
                  </#if>
                </td>
                <td class="leftalign">${profile.table?capitalize}</td>
                <td class="leftalign">
                    <#list EIP_DSData.getDocumentObjectList() as map>
                      <#list map?keys as entry>
                        <#if map[entry] = profile.documentType >${entry}</#if>
                      </#list>
                    </#list>
                </td>
                <td class="leftalign">                  
                  <#if hasBtnMap>
                    <ul class="buttonlist">
                    <#list buttonData["//button[@dbAgent='${profile.name}']"] as button>
                      <li><a href="${EIP_RealPath}/EIPAdmin/Button?action=editsettings&buttonId=${button.@buttonId}&parentId=${button.@parentId}">${button.@name}</a></li>
                    </#list>
                    </ul>
                  <#else>
                    <span class="emptymsg">${msg.autofillTable_noAssignedButtons}</span>
                  </#if>
                </td>
                <td class="actions"><@actionmenu profile.name hasBtnMap/></td>
              </tr>
              </#list>
              <#else>
                  <tr><td class="emptylistmsg" colspan="20">${msg.autofillTable_noProfiles}</td></tr>
              </#if>
            </tbody>
          </table>
        </form>

      </section>
    </section>
  </body>
</html>

<#macro actionmenu profilename hasBtnMap>

  <ul class="actionmenu clearfix">
    <li class="action_edit"><a class="actiontip" href="${EIP_RealPath}/EIPAdmin/DBAgent?agentType=autoFill&amp;action=edit&amp;name=${profilename}" title="${msg.dataSourceTable_action_Edit_label}">${msg.dataSourceTable_action_Edit_label}</a></li>
    <#if hasBtnMap>
      <li class="action_delete_disabled"><a class="actiontip" href="javascript:;" title="${msg.autofillTable_action_DeleteDisabled}">${msg.dataSourceTable_action_Delete_label}</a></li>
    <#else>
      <li class="action_delete"><a class="actiontip" href="${EIP_RealPath}/EIPAdmin/DBAgent?agentType=autoFill&amp;action=delete&amp;name[]=${profilename}" title="${msg.dataSourceTable_action_Delete_label}">${msg.dataSourceTable_action_Delete_label}</a></li>
    </#if>
  </ul>
</#macro>