<#import "StandaloneMenu.ftl" as menu />
<#import "/locale/messages_${locale}.ftl" as msg />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="cache-control" content="max-age=0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="pragma" content="no-cache" />
    <title>${msg.configDevices_title}</title>
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
        connectkey.loadAssignButtonsForm("${msg.action_reassignButtonsFailureMsg}", "${msg.action_reassignButtonsSuccessMsg}", "${msg.btn_updateAssignmentsLabel}", "${msg.btn_cancelLabel}","${msg.btn_closeTip}");
        connectkey.loadCSVImportForm("${msg.btn_importCSVLabel}", "${msg.btn_cancelLabel}","${msg.btn_closeTip}");
        connectkey.initAjaxFileUploader("${msg.importCSV_error}");
        connectkey.initFailedButtonReassignDialog("${msg.btn_closeTip}","${msg.btn_closeTip}");

        //event listeners...
        $(".objectlist tbody input[type=checkbox]").click(connectkey.toggleSelectedActionBtns)
        $("#btn_addBtn").click(function(e){window.location.href="${EIP_RealPath}/EIPAdmin/Device?action=add"});
        $(".action_delete").click(function(e){connectkey.deleteDevice(e,"listpage", null, "${msg.action_deleteSingleDeviceConfirmMsg}", "${msg.action_deleteSingleDeviceSuccessMsg}", "${msg.action_deleteSingleDeviceFailureMsg}", null);});
        $("#btn_delSelDevices").click(function(e){connectkey.deleteSelectedDevices("${EIP_RealPath}/EIPAdmin/DeviceRegister", "${msg.action_deleteMultiDeviceConfirmMsg}", "${msg.action_deleteMultiDeviceSuccessMsg}", "${msg.action_deleteMultiDeviceFailureMsg}")});
        $("#chkbx_selectAllDevices").click(function(e){connectkey.selectAllCheckboxes(e)});
        $("#btn_editSelDeviceBtns").click(function(e){$("#dialog-form-editbuttons").dialog("open");});
        $("#btn_importDevices").click(function(e){$("#dialog-form-csvupload").dialog("open");})

      }); //end document ready code...    
    </script>
  </head>
  <body id="ConfigureDevices" class="adminsection">
    <#include "adminheader.ftl">
    <@menu.show/>
    <section id="content" class=''>
      <h2>${msg.configDevices_title}</h2>
      <!-- page description -->
      <p id="page_description">${msg.configDevices_subtitle}</p>

      <!-- page body -->
      <section id="page_body">

        <span id="selectedbtns" style="display:none">
          <button id="btn_editSelDeviceBtns" type="button" class="hastip" title="${msg.btn_reassignBtnsTip}">${msg.btn_reassignBtnsLabel}</button>
          <button id="btn_delSelDevices" class="btn_danger hastip" title="">${msg.btn_deleteSelDevices}</button>
        </span>
        
        <button id="btn_addBtn" type="button" class="hastip" title="">${msg.btn_registerDevice}</button>
        <button id="btn_importDevices" type="button" class="hastip" title="">${msg.btn_importDevices}</button>

        <form name="devicelistform" id="devicelistform">
          <table class="objectlist">
            <!--Column Grouping-->
            <colgroup>
              <col/>
              <col/>
              <col/> 
            </colgroup>
            <colgroup class="muted">
              <col/>
              <col/>
              <col/>
            </colgroup>
            <!--Heading-->
            <thead>
              <tr>
                <th class="ckbx"><input type="checkbox" id="chkbx_selectAllDevices" class="cbxtip" title="${msg.devicetable_cbx_selectAll_tip}"/></th>
                <th class="name">${msg.devicetable_colLabel_name}</th>
                <th class="address">${msg.devicetable_colLabel_address}</th>         
                <th class="buttons muted">${msg.devicetable_colLabel_buttons}</th>
                <th class="firewall muted"><img src="../images/admin/icon_firewall_heading.svg" class="actiontip" width="16px" height="17px" alt="${msg.devicetable_deviceBehindFirewallColHeadingTip}" title="${msg.devicetable_deviceBehindFirewallColHeadingTip}"/></th>
                <th class="actions muted">${msg.devicetable_colLabel_actions}</th>
              </tr>
            </thead>
            <!--Body-->
            
            <tbody>
              <#if deviceData.DeviceConfig.device[0]??>
                <#list deviceData.DeviceConfig.device as device>
                <tr>
                  <td class="ckbx">
                    <input type="checkbox" name="deviceId[]" id="device_${device.@deviceId}" value="${device.@deviceId}"/>
                    <script>
                      $("#device_${device.@deviceId}").data({buttonArray : [<#list device.buttons.buttonId as btn>${btn}<#if btn_has_next>,</#if></#list>]});
                    </script>
                  </td>
                  <td class="name"><img src="../images/admin/mfd_device.svg" width="20px" height="20px" /> <a class="devicelink hastip" href="${EIP_RealPath}/EIPAdmin/Device?action=edit&amp;deviceId=${device.@deviceId}" title="${msg.devicetable_deviceLabel_tip}"><i></i>${device.name}</a></td>
                  <td class="address">${device.host}</td>
                  <td class="buttons">
                  <#if device.buttons.buttonId[0]??>
                  <ul class="buttonlist">
                    <#list device.buttons.buttonId as btn>
                      <#assign parentId = buttonData.EIPConfig["button[@buttonId='${btn}']/@parentId"]/>
                      <#assign name = buttonData.EIPConfig["button[@buttonId='${btn}']/@name"]/>
                      <#assign id = buttonData.EIPConfig["button[@buttonId='${btn}']/@buttonId"]/>
                      <#assign btn_concatname><#if name?length &lt; 25>${name}<#else>${name?substring(0,24)}&#8230;</#if></#assign>
                      <li>${btn_concatname} <span class="quiet">(id:${id})</span></li>
                    </#list>
                  </ul>
                  <#else>
                    <span class="emptymsg">${msg.devicetable_nobuttonsassigned}</span>
                  </#if>
                  </td>
                  <td class="firewall"><#if device.mfd_firewall == "true"><img src="../images/admin/icon_firewall.svg" width="16px" height="17px" class="actiontip" alt="${msg.devicetable_deviceBehindFirewallTip}" title="${msg.devicetable_deviceBehindFirewallTip}" /></#if></td>
                  <td class="actions"><@actionmenu device.@deviceId /></td>
                </tr>
                </#list>
              <#else>
                <tr><td class="emptylistmsg" colspan="5">${msg.devicetable_emptytablemsg} <a href="${EIP_RealPath}/EIPAdmin/Device?action=add">${msg.devicetable_emptytablemsg_registerlinklabel}</a></td></tr>
              </#if>
            </tbody>
          </table>
        </form>

      </section>
    </section>

    <!-- Reassign buttons for Multiple Devices Form -->
    <div id="dialog-form-editbuttons" title="${msg.editSelectedBtns_dialogtitle}">
      <form id="buttonlistform" action="${EIP_RealPath}/EIPAdmin/DeviceRegister">
        <fieldset>
          <input name="action" type="hidden" value="edit"/>
          <p>${msg.editSelectedBtns_dialogsubtitle}</p>
            <#if buttonData.EIPConfig.button[0]??>
              <ul id="servicebtnlist">
              <#list buttonData.EIPConfig["button[@parentId='0']"] as btn>
                <li><input type="checkbox" name="buttonId[]" id="cbx_${btn.@buttonId}" value="${btn.@buttonId}" /><label for="cbx_${btn.@buttonId}">${btn.@name} <span class="quiet">(id=${btn.@buttonId})</label>
                </li>
              </#list>
              </ul>
            <#else>
              <#assign link_configbtnpage><a href="${EIP_RealPath}/EIPAdmin/ConfigureButtons">${msg.link_configurebuttons_label}</a></#assign>
              <p class="empty"><@msg.nobuttonsinsystemmsg link_configbtnpage /></p>
            </#if>
        </fieldset>
      </form>
    </div>

    <!-- CSV Upload Form -->
    <div id="dialog-form-csvupload" title="${msg.importDialog_title}">
      <form id="csvuploadform" enctype="multipart/form-data" method="post" action="${EIP_RealPath}/EIPAdmin/DeviceRegister">
        <fieldset>
          <input name="action" type="hidden" value="csv"/>
          <p>${msg.importDialog_subtitle}</p>
          <input type="file" name="csv_file" id="fileupload" />
        </fieldset>
      </form>
    </div>

    <!-- Failed Button Assignment Popup -->
    <div id="dialog-failedbtnreassign" title="${msg.failedBtnReassignDialogTitle}">
      <p>${msg.failedBtnReassignDialogSubtitle}
      <table class="objectlist">
        <thead>
          <tr>
            <th class="name">${msg.devicetable_colLabel_name}</th>
            <th class="address">${msg.devicetable_colLabel_address}</th>
          </tr>
        </thead>
        <tbody id="failedbtnreassignlist_tbody"></tbody>
      </table>

      <table style="display:none">
        <tbody id="failedbtnreassignlist_rowtemplate">
          <tr>
            <td class="name" id="failed_name_"><img src="../images/admin/mfd_device.png"/> <a href="${EIP_RealPath}/EIPAdmin/Device?action=edit&deviceId=" target="_blank"></a></td>
            <td class="address" id="failed_address_"><code></code></td>
          </tr>
        </tbody>
      </table>
    </div>
  </body>
</html>

<#macro actionmenu deviceid>
  <ul class="actionmenu clearfix">
    <li class="action_edit"><a class="actiontip" href="${EIP_RealPath}/EIPAdmin/Device?action=edit&amp;deviceId=${deviceid}" title="${msg.action_viewDeviceTip}">${msg.action_viewDeviceLabel}</a></li>
    <li class="action_delete"><a class="actiontip" href="${EIP_RealPath}/EIPAdmin/DeviceRegister?action=delete&amp;deviceId[]=${deviceid}" title="${msg.action_deleteSingleDeviceTip}">${msg.action_deleteSingleDeviceLabel}</a></li>
  </ul>
</#macro>