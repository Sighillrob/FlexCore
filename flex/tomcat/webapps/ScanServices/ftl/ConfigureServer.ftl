<#import "StandaloneMenu.ftl" as menu />
<#import "/locale/messages_${locale}.ftl" as msg />
<!DOCTYPE html>
<html>
  <head>
    <title>${msg.ServerSetupPage_title}</title>
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

    <script type="text/javascript">  
      $(document).ready(function() {
        //submit form with the connectkey validateForm method.
        $("#ServerSetupForm").submit(function(e){connectkey.validateForm(e, "${msg.validationErrorGeneralMsg}", '<p class="fielderror error_empty"><strong>${msg.fieldErrorTitle}</strong> ${msg.fielderror_empty}</p>', "${msg.ServerSetup_formsubmit_success}", "${msg.ServerSetup_formsubmit_error}", document.location, null);});
      
        $("#forceEditWhileRegistered")
          .mousedown(function(){ $("#serverName, #protocol, #port").removeAttr("disabled"); $(this).hide()})

      });
    </script>
  </head>

  <body id="ServerSetup" class="adminsection">
    <#include "adminheader.ftl">
    <@menu.show/>
    <section id="content" class=''>

    
      <h2>${msg.ServerSetupPage_title}</h2>
      <!-- page description -->
      <p id="page_description">
        ${msg.ServerSetupPage_subtitle}
        ${msg.ServerSetupPage_subtitle2}
        ${msg.ServerSetupPage_subtitle3}
      </p>
      
      <#assign serverSettingsState><#if EIP_RegDevices?number &gt; 0>disabled="disabled"</#if></#assign>

      <section id="page_content">
        
        <form id="ServerSetupForm" action="${EIP_RealPath}/EIPAdmin/ConfigureServer" method="post">
          <input type="hidden" name="action" value="update"/>
          <fieldset>
            <h3>${msg.ServerSetup_ServerSettingsSectionLabel}</h3>
            <#if EIP_RegDevices?number &gt; 0>
              <div class="settingschangewhileregistered-note"><p><@msg.devicesRegisteredEditWarning EIP_RegDevices?number /></p> <button type="button" id="forceEditWhileRegistered">${msg.editServerSettingsWhileRegisteredBtnLabel}</button></div>
            </#if>
            <ul>
              <li>
                <label for="serverName" class="labeltip" title="${msg.ServerSetup_nameTip}">${msg.ServerSetup_nameLabel}</label>
                <div class="field"><input id="serverName" name="serverName" class="required large" type="text" value="${EIP_serverName}" ${serverSettingsState} /></div>
              </li>
              <li>
                <label for="protocol" class="labeltip" title="${msg.ServerSetup_prototolTip}">${msg.ServerSetup_protocolLabel}</label>
                <div class="field">
                  <select id="protocol" name="protocol" class="required" ${serverSettingsState} >
                    <option value="http" <@isOptionSelected "http" EIP_protocol /> >http</option>
                    <option value="https" <@isOptionSelected "https" EIP_protocol /> >https</option>
                  </select>
                </div>
              </li>
              <li>
                <label for="port" class="labeltip" title="${msg.ServerSetup_portTip}">${msg.ServerSetup_portLabel}</label>
                <div class="field"><input id="port" name="port" type="text" class="required" size="5" value="${EIP_port}" ${serverSettingsState} /></div>
              </li>
              </ul>
          </fieldset>
          <fieldset>
            <h3>${msg.ServerSetup_FirewallPasscodeSectionLabel}</h3>
            <p>${msg.ServerSetup_firewallPasscodeSubtitle}</p>
              <ul class="downloadURL">
              <li>
                <label for="firewallPassword" class="labeltip" title="${msg.ServerSetup_passwordTip}">${msg.ServerSetup_passwordLabel}</label>
                <div class="field"><input id="firewallPassword" name="firewallPassword" type="text" value="${EIP_password}"/></div>
              </li>
              <li>
                <label for="firewallDeviceRegURL" class="labeltip" title="${msg.ServerSetup_registerDeviceBehindFirewallURLTip}">${msg.ServerSetup_registerDeviceBehindFirewallURLLabel}</label>
                <pre class="passcodeLink">${EIP_DownloadURL}</pre>
                <p class="fieldnote_below">${msg.ServerSetup_registerDeviceBehindFirewallURLEndNote}</p>
              </li>
            </ul>

          </fieldset>
          <fieldset>
            <h3>${msg.ServerSetup_buttonSettings}</h3>
              <ul class="downloadURL">
              <li>
                <label for="dateFormat" class="labeltip" title="${msg.ServerSetup_dateFormatHelp}">${msg.ServerSetup_dateFormatLabel}</label>
                <div class="field">
                  <select id="dateFormat" name="dateFormat" >
                    <option value="yyyy-MM-dd" <@isOptionSelected "yyyy-MM-dd" EIP_dateFormat /> >${msg.ServerSetup_dateFormatYearFirst}</option>
                    <option value="yyyyMMdd" <@isOptionSelected "yyyyMMdd" EIP_dateFormat /> >${msg.ServerSetup_dateFormatYearFirst2}</option>
                    <option value="MM/dd/yyyy" <@isOptionSelected "MM/dd/yyyy" EIP_dateFormat /> >${msg.ServerSetup_dateFormatMonthFirst}</option>
                    <option value="dd/MM/yyyy" <@isOptionSelected "dd/MM/yyyy" EIP_dateFormat /> >${msg.ServerSetup_dateFormatDayFirst}</option>
                  </select>
                </div>
              </li>
            </ul>
          </fieldset>

            <div id="btnrow">
              <button type="submit">${msg.btn_apply}</button>
            </div>
          </fieldset>
        </form>

      </section>
    </section>
  </body>
</html>  


<#-- isOptionSelected
      Determines if a select option is selected or not.
-->
<#macro isOptionSelected optval selval><#if optval = selval>selected="selected"</#if></#macro>