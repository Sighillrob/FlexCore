<#import "StandaloneMenu.ftl" as menu />
<#import "/locale/messages_${locale}.ftl" as msg />
<#if action == "edit">
  <#assign device = deviceData.DeviceConfig["device[@deviceId='${deviceId}']"]/>
  <#assign title>${msg.editDevicePage_title} <span class="quiet">${device.name}</span></#assign>
  <#assign headertitle>${msg.editDevicePage_title} ${device.name}</#assign>
  <#assign description>
        ${msg.editDevicePage_subtitle1}
        ${msg.editDevicePage_subtitle2}
  </#assign>
  <#assign isRegistered><#if device.buttons.buttonId[0]??>true<#else>false</#if></#assign>

<#elseif action == "add">
  <#assign title="${msg.addDevicePage_title}"/>
  <#assign headertitle="${msg.addDevicePage_title}"/>
  <#assign description>
        ${msg.addDevicePage_subtitle1}
        ${msg.addDevicePage_subtitle2}
  </#assign>
</#if>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
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

        $("#mfd_name").focus();

        //event listeners...

        $("#deletebutton").click(function(e){connectkey.deleteDevice(e,"editpage", "${EIP_RealPath}/EIPAdmin/DeviceRegister", "${msg.action_deleteSingleDeviceConfirmMsg}", "${msg.action_deleteSingleDeviceSuccessMsg}", "${msg.action_deleteSingleDeviceFailureMsg}", "${EIP_RealPath}/EIPAdmin/ConfigureDevices");});
        
        $("body").on("blur", ".required_error", function(e){connectkey.checkRequiredErrorField(e);});
        
        $("#editDeviceForm").submit(function(e){connectkey.validateForm(e, "${msg.validationErrorGeneralMsg}", '<p class="fielderror error_empty"><strong>${msg.fieldErrorTitle}</strong> ${msg.fielderror_empty}</p>', "${msg.editDevice_successMsg}", "${msg.editDevice_errorMsg}", document.location, null)});

        $("#addDeviceForm").submit(function(e){connectkey.validateForm(e, "${msg.validationErrorGeneralMsg}", '<p class="fielderror error_empty"><strong>${msg.fieldErrorTitle}</strong> ${msg.fielderror_empty}</p>', "${msg.addDevice_successMsg}", "${msg.addDevice_errorMsg}", "${EIP_RealPath}/EIPAdmin/ConfigureDevices", null, null);});

        $("#mfd_firewall_checkbox").click(function(){
          if($(this).is(':checked') == true){
            $("#mfd_firewall_hidden").val("true");
          }else{
            $("#mfd_firewall_hidden").val("false");
          }
        })

      }); //end document ready code...    
    </script>
  </head>

  <body id="EditDevice" class="adminsection">
    <#include "adminheader.ftl">
    <@menu.show/>
    <section id="content" class=''>
      <!-- page title -->
      <h2>${title}</h2>
      <!-- page description -->
      <p id="page_description">${description}</p>
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
<form action="${EIP_RealPath}/EIPAdmin/DeviceRegister" method="post" id="editDeviceForm">
  <input name="deviceId[]" id="deviceId" type="hidden" value="${deviceId}"/>
  <input name="action" type="hidden" value="edit"/>
  <fieldset>
    <ul>
      <li>
        <label for="mfd_name" class="label-required labeltip" title="${msg.deviceLabel_tip}">${msg.deviceLabel_label}</label>
        <div class="field"><input id="mfd_name" name="mfd_name" type="text" class="large required" value="${device.name}"></div>
      </li>
      <li>
        <label for="mfd_ip" class="label-required labeltip" title="${msg.deviceAddress_tip}">${msg.deviceAddress_label}</label>
        <div class="field">
          <#if isRegistered = "true">
            <code>${device.host}</code>
            <input id="mfd_ip" name="mfd_ip" type="hidden" class="required" value="${device.host}">
          <#else>
            <input id="mfd_ip" name="mfd_ip" type="text" class="required" value="${device.host}">
          </#if>
        </div>
      </li>
      <li>
        <label for="mfd_user" class="labeltip" title="${msg.deviceUsername_tip}">${msg.deviceUsername_label}</label>
        <div class="field"><input id="mfd_user" name="mfd_user" type="text" class="required" value="${device.username}"></div>
      </li>
      <li>
        <label for="mfd_pass" class="labeltip" title="${msg.devicePassword_tip}">${msg.devicePassword_label}</label>
        <div class="field"><input id="mfd_pass" name="mfd_pass" type="password" class="required" value="${device.password}"></div>
      </li>
      <li>
        <label for="mfd_firewall" class="labeltip" title="${msg.deviceBehindFirewall_tip}">${msg.deviceBehindFirewall_label}</label>
        <input type="checkbox" id="mfd_firewall_checkbox" <#if device.mfd_firewall="true">checked="checked"</#if>/>
        <input type="hidden" name="mfd_firewall" id="mfd_firewall_hidden" value="${device.mfd_firewall}"/>
      </li>
    </ul>
  </fieldset>

  <fieldset>
    <h3>${msg.serviceBtnSectionTitle}</h3>
    
      <#if buttonData.EIPConfig.button[0]??>
        <ul id="servicebtnlist">
        <#list buttonData.EIPConfig["button[@parentId='0']"] as btn>
          <li><input type="checkbox" name="buttonId[]" id="cbx_${btn.@buttonId}" value="${btn.@buttonId}" <@isChecked btn.@buttonId /> /><label for="cbx_${btn.@buttonId}">${btn.@name} <span class="quiet">(id:${btn.@buttonId})</span></label></li>
        </#list>
        </ul>
      <#else>
        <#assign link_configButtonsPage><a href="${EIP_RealPath}/EIPAdmin/ConfigureButtons">${msg.link_configurebuttons_label}</a></#assign>
        <p class="empty"><@msg.nobuttonsinsystemmsg link_configButtonsPage/></p>
      </#if>
    
  </fieldset>

  <div id="buttonrow">
    <button type="submit">${msg.editDevicePage_btn_applyLabel}</button>
    <button id="deletebutton" type="button" class="btn_danger">${msg.editDevicePage_btn_deleteButtonLabel}</button>
    <a href="${EIP_RealPath}/EIPAdmin/ConfigureDevices">${msg.editDevicePage_link_returnToDeviceListLabel}</a>
  </div>
</form>
</#macro>


<#macro add_form>
<form action="${EIP_RealPath}/EIPAdmin/DeviceRegister" method="post" id="addDeviceForm">
  <input name="action" type="hidden" value="add"/>
  <fieldset>
    <ul>
      <li>
        <label for="mfd_name" class="label-required labeltip" title="${msg.deviceLabel_tip}">${msg.deviceLabel_label}</label>
        <div class="field"><input id="mfd_name" name="mfd_name" type="text" class="large required" value=""></div>
      </li>
      <li>
        <label for="mfd_ip" class="label-required labeltip" title="${msg.deviceAddress_tip}">${msg.deviceAddress_label}</label>
        <div class="field"><input id="mfd_ip" name="mfd_ip" type="text" class="required" value=""></div>
      </li>
      <li>
        <label for="mfd_user" class="labeltip" title="${msg.deviceUsername_tip}">${msg.deviceUsername_label}</label>
        <div class="field"><input id="mfd_user" name="mfd_user" type="text" class="required" value=""></div>
      </li>
      <li>
        <label for="mfd_pass" class="labeltip" title="${msg.devicePassword_tip}">${msg.devicePassword_label}</label>
        <div class="field"><input id="mfd_pass" name="mfd_pass" type="password" class="required" value=""></div>
      </li>
      <li>
        <label for="mfd_firewall" class="labeltip" title="${msg.deviceBehindFirewall_tip}">${msg.deviceBehindFirewall_label}</label>
        <input type="checkbox" name="mfd_firewall" id="mfd_firewall" value="true"/>
      </li>
  </fieldset>

  <fieldset>
    <h3>${msg.serviceBtnSectionTitle}</h3>
    
      <#if buttonData.EIPConfig.button[0]??>
        <ul id="servicebtnlist">
        <#list buttonData.EIPConfig["button[@parentId='0']"] as btn>
          <li><input type="checkbox" name="buttonId[]" id="cbx_${btn.@buttonId}" value="${btn.@buttonId}" /><label for="cbx_${btn.@buttonId}">${btn.@name} <span class="quiet">(id:${btn.@buttonId})</span></label></li>
        </#list>
        </ul>
      <#else>
        <#assign link_configButtonsPage><a href="${EIP_RealPath}/EIPAdmin/ConfigureButtons">${msg.link_configurebuttons_label}</a></#assign>
        <p class="empty"><@msg.nobuttonsinsystemmsg link_configButtonsPage/></p>
      </#if>
  </fieldset>

  <div id="buttonrow">
    <button type="submit">${msg.editDevicePage_btn_addLabel}</button>
    <a href="${EIP_RealPath}/EIPAdmin/ConfigureDevices"> ${msg.editDevicePage_link_returnToDeviceListLabel}</a>
  </div>
</form>
</#macro>


<#macro isChecked buttonId>
  <#if device.buttons["buttonId[text() ='${buttonId}']"][0]??>checked="checked"</#if>
</#macro>


