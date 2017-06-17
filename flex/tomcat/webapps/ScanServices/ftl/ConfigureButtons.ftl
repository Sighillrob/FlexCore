<#import "StandaloneMenu.ftl" as menu />
<#import "/locale/messages_${locale}.ftl" as msg />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="cache-control" content="max-age=0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="cache-control" content="must-revalidate" />
    <meta http-equiv="cache-control" content="no-store" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="pragma" content="no-cache" />
    <title>${msg.configBtnPage_title}</title> 
    ${ds_admin_site_style}
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/admin_styles.css" />
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
        $(".deleteButton").click(function(e){connectkey.deleteButton(e, "${msg.deleteAction_confirm}", "${msg.deleteAction_error}", "${msg.deleteAction_success}", null, null);});
        $(".buttongroup_toggle").click(function(e){connectkey.toggleButtonChildrenList(e, "${msg.btnTreeBtn_expand_label}", "${msg.btnTreeBtn_expand_tooltip}", "${msg.btnTreeBtn_collapse_label}", "${msg.btnTreeBtn_collapse_tooltip}")});

        $("#btn_collapseall").click(function(){
          $(".btn_collapse").each(function(){
            $(this).click();
          });
        });

        $("#btn_expandall").click(function(){
          $(".btn_expand").each(function(){
            $(this).click();
          });
        });        

      });
    </script>
  </head>
<body id="ConfigureButtons" class="adminsection">

    <#include "adminheader.ftl">
    <@menu.show/>

    <section id="content" class=''>
    
      <h2>${msg.configBtnPage_title}</h2>
      <!-- page description -->
      <p id="page_description">${msg.configBtnPage_subtitle}</p>
      <!-- page body -->
      <section id="page_body">

        <a href="${EIP_RealPath}/EIPAdmin/Button?action=add&amp;type=mfd&amp;parentId=0" id="new_mfdbutton">${msg.link_addScanButtonLabel}</a>
        <div id="toggletreebtns">
          <span id="btn_expandall" class="hastip" title="${msg.btn_expandtree_help}"><i>[+]</i> ${msg.btn_expandtree_label}</span>
          <span id="btn_collapseall" class="hastip" title="${msg.btn_collapsetree_help}"><i>[-]</i> ${msg.btn_collapsetree_label}</span>
        </div>
        <table class="objectlist">
          <!--Column Grouping-->
          <colgroup>
            <col/>
          </colgroup>
          <colgroup class="muted">
            <col/>
            <col/>
            <col/>
            <col/>
            <col/>
          </colgroup>
          <!--Heading-->
          <thead>
            <tr>
              <th class="name">${msg.listheading_button}</th>
              <th class="idval muted">ID</th>
              <th class="type muted">${msg.listheading_type}</th>
              <th class="access muted"><span title="${msg.colhead_tip_accessLevel}" class="actiontip">-</span></th>
              <th class="scantype muted"><span title="${msg.colhead_tip_scanType}" class="actiontip">-</span></th>             
              <th class="actions muted">${msg.listheading_actions}</th>
            </tr>
          </thead>
          <!--Body-->


          <#if buttonData.EIPConfig["button[@parentId='0']"][0]??>
            <#list buttonData.EIPConfig["button[@parentId='0']"] as btn>

              <#assign haschildren><#if btn.button[0]??>hasChildren</#if></#assign>
              <#assign btnname><#if btn.@name?length &lt; 25>${btn.@name}<#else>${btn.@name?substring(0,24)} &#8230;</#if></#assign>
              <#assign hasbtnicon><#if btn.icon[0]??>style="background-image:url(${EIP_RealPath}/images/${btn.icon})"</#if></#assign>
              <tr>
                <td>
                  <#if btn.button[0]??><a id="togglebtn_${btn.@buttonId}" class="buttongroup_toggle btn_expand" title="${msg.btnTreeBtn_expand_tooltip}">${msg.btnTreeBtn_expand_label}</a></#if>
                  <a class="hastip ckbutton button_mfd ${haschildren}" href="${EIP_RealPath}/EIPAdmin/Button?action=editsettings&amp;buttonId=${btn.@buttonId}&amp;parentId=${btn.@parentId}" title="${btn.@name} &rarr; ${msg.buttonTip}"><i ${hasbtnicon}></i>${btnname}</a></td>
                <td class="idval">${btn.@buttonId}</td>
                <td class="type">${msg.btnType_service}</td>                
                <td class="access"><#if btn.@guest == "false"><span class="grouprestricted hastip" title="<@msg.groupAccessOnlyTip btn.@dsGroup/>" ></span><#else><span style="display:block;height:20px;"/></#if></td>
                <td class="scantype"><span style="display:block;height:20px;"/></td>
                <td class="actions"><@actionmenu 'mfd' btn.@buttonId btn.@parentId/></td>
              </tr>
              <#if btn.button[0]??><tr id="btngroup_0"><td colspan="6" class="subtable_container"><div class="childrenwrapper" style="display:none"><@getChildBtns btn 10 /></div></td></tr></#if>

            </#list>

          <#else>
            <tr><td class="emptylistmsg" colspan="6">${msg.emptyBtnListMsg} <a href="${EIP_RealPath}/EIPAdmin/Button?action=add&amp;type=mfd&amp;parentId=0">${msg.link_emptyBtnListNewLink}</a></td></tr>
          </#if>
        </table>

    </section>
  </section>

  </body>

</html>


<#macro getChildBtns btn indent>
  <#assign childindent = indent+10/>
  <table>
    <!--Column Grouping-->
    <colgroup>
      <col/>
    </colgroup>
    <colgroup class="muted">
      <col/>
      <col/>
      <col/>
      <col/>
      <col/>
    </colgroup>
  <#list btn.button as childbtn>

    <#assign pos><#if !childbtn_has_next && !childbtn.button[0]??>last</#if></#assign>
    <#assign btntype><#if childbtn.metadata[0]??>scan<#else>folder</#if></#assign>
    <#assign haschildren><#if childbtn.button[0]??>hasChildren</#if></#assign>
    <#assign childbtnname><#if childbtn.@name?length &lt; 25>${childbtn.@name}<#else>${childbtn.@name?substring(0,24)} &#8230;</#if></#assign>

    
    <#if btntype = "scan">
      <#assign childscanTypeTip><#if childbtn.@scanType = "DocuShare">${msg.scantype_tip_DocuShare}<#elseif childbtn.@scanType = "Folder">${msg.scantype_tip_NetworkFolder}<#else>${msg.scantype_tip_Email}</#if></#assign>
      <#assign childscanTypeCSSClass><#if childbtn.@scanType = "DocuShare">scantype-coll<#elseif childbtn.@scanType = "Folder">scantype-networkfolder<#else>scantype-email</#if></#assign>
    </#if>


    <tr class="${pos}">
      <td class="name" style="padding-left:${childindent}px;">
        <#if childbtn.button[0]??><a id="togglebtn_${btn.@buttonId}" class="buttongroup_toggle btn_expand" title="${msg.btnTreeBtn_expand_tooltip}">${msg.btnTreeBtn_expand_label}</a></#if>
        <a class="hastip ckbutton button_${btntype} ${haschildren}" href="${EIP_RealPath}/EIPAdmin/Button?action=editsettings&amp;buttonId=${childbtn.@buttonId}&amp;parentId=${childbtn.@parentId}" title="${childbtn.@name} &rarr; ${msg.buttonTip}"><i></i>${childbtnname}</a>
      </td>
      <td class="idval">${childbtn.@buttonId}</td>
      <td class="type"><#if childbtn.metadata[0]??>${msg.btnType_scan}<#else>${msg.btnType_folder}</#if></td>
      <td class="access"><#if childbtn.@guest == "false"><span class="grouprestricted actiontip" title="<@msg.groupAccessOnlyTip childbtn.@dsGroup/>"></span><#else><span style="display:block;height:20px;width:20px"></span></#if></td>
      <td class="scantype"><#if btntype = "scan"><span class="${childscanTypeCSSClass} actiontip" title="${childscanTypeTip}"></span><#else><span style="display:block;height:20px;"/></#if></td>
      <td class="actions"><@actionmenu btntype childbtn.@buttonId childbtn.@parentId/></td>
    </tr>
    <#if childbtn.button[0]??><tr id="btngroup_${btn.@buttonId}"><td colspan="6" class="subtable_container"><div class="childrenwrapper" style="display:none"><@getChildBtns childbtn childindent/></div></td></tr></#if>

    <#assign childindent = indent+10/> <#--reset indent -->
  </#list>
  </table>
</#macro>


<#macro actionmenu buttontype buttonid parentid>
  <ul class="actionmenu">
    <li class="action_edit"><a class="actiontip" href="${EIP_RealPath}/EIPAdmin/Button?action=editsettings&amp;buttonId=${buttonid}&amp;parentId=${parentid}" title="${msg.action_editPropsBtnTip}">${msg.action_editPropsBtnLabel}</a></li>
    <li class="action_permissions"><a class="actiontip" href="${EIP_RealPath}/EIPAdmin/Button?action=editpermissions&amp;buttonId=${buttonid}&amp;parentId=${parentid}" title="${msg.action_editPermissionsBtnTip}">${msg.action_editPermissionsBtnLabel}</a></li>
    <li class="action_delete"><a class="deleteButton actiontip" href="${EIP_RealPath}/EIPAdmin/Button?action=delete&amp;buttonId=${buttonid}" title="${msg.action_deleteBtnTip}">${msg.action_deleteBtnLabel}</a></li>
    <#if buttontype == 'mfd' || buttontype == 'folder'>
    <li class="action_addfolder"><a class="actiontip" href="${EIP_RealPath}/EIPAdmin/Button?action=add&amp;parentId=${buttonid}&amp;type=folder" title="${msg.action_addFolderBtnTip}">${msg.action_addFolderBtnLabel}</a></li>
    <li class="action_addscanbutton"><a class="actiontip" href="${EIP_RealPath}/EIPAdmin/Button?action=add&amp;parentId=${buttonid}&amp;type=scan" title="${msg.action_addScanBtnTip}">${msg.action_addScanBtnLabel}</a></li>
    </#if>
  </ul>
</#macro>