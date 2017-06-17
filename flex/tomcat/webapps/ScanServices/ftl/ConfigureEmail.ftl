<#import "StandaloneMenu.ftl" as menu />
<#import "/locale/messages_${locale}.ftl" as msg />
<#assign emailConfigData = serverConfigData.EIPConfig.EmailConfig />
<!DOCTYPE html>
<html>
  <head>
    <title>${msg.EmailServicePage_title}</title>
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    ${ds_admin_site_style}
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/admin_styles.css" />
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/scripts/lib/jquery-ui/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/jquery.smallipop.css" media="all" title="Screen"/>
    <!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/admin_ds6_ie8-7.css" /><![endif]-->

    <script src="${EIP_RealPath}/scripts/lib/jquery.js"></script>
    <script src="${EIP_RealPath}/scripts/lib/jquery-ui/jquery-ui.min.js"></script>
    <script src="${EIP_RealPath}/scripts/jquery.form.js"></script>
    <script src="${EIP_RealPath}/scripts/jquery.nimble.loader.js"></script>
    <script src="${EIP_RealPath}/scripts/jquery.smallipop.js"></script>
    <script src="${EIP_RealPath}/scripts/modernizr.js"></script>
    <script src="${EIP_RealPath}/scripts/connectkey.js"></script>

    <script type="text/javascript">  
      $(document).ready(function() {
        
        connectkey.initSendTestEmailPopup("${msg.EmailSetup_testConnectionWait}", "${msg.EmailSetup_testConnectionSuccess}", "${msg.EmailSetup_testConnectionFailure}", "${msg.btn_closeTip}","${msg.btn_closeTip}", "${msg.EmailServicePage_SendTestEmail_btnLabel}");

        //submit form with the connectkey validateForm() method.
        $("#EmailSetupForm").submit(function(e){connectkey.validateForm(e, "${msg.validationErrorGeneralMsg}", '<p class="fielderror error_empty"><strong>${msg.fieldErrorTitle}</strong> ${msg.fielderror_empty}</p>', "${msg.EmailServicePage_formsubmit_success}", "${msg.EmailServicePage_formsubmit_error}", null, null);});
        
        $("#btn_testServerConn").click(function(e){connectkey.testEmailServerConnection(e, "${EIP_RealPath}/EIPAdmin/ConfigureEmail")});
        $("#btn_sendTestEmail").click(function(e){$("#dialog-form-emailsendtest").dialog("open");})

        //change the email server port when the user change the email server protocol select menu...
        $("#emailProtocol").change(function(){
          var protocol = $(this).val(), port = $("#emailPort");
          if(protocol == "SMTP"){
            port.val("25");
          }else if(protocol == "SMTP-TLS"){
            port.val("250");
          }else if(protocol == "SMTP-SSL"){
            port.val("2500");
          }
        });

      });
    </script>
  </head>

  <body id="EmailSetup" class="adminsection">
    <#include "adminheader.ftl">
    <@menu.show/>
    <section id="content" class=''>
    
      <h2>${msg.EmailServicePage_title}</h2>
      <!-- page description -->
      <ul id="page_description">
        <li>${msg.EmailServicePage_subtitle}</li>
      </ul>
      
      <section id="page_content">
        
        <form id="EmailSetupForm" action="${EIP_RealPath}/EIPAdmin/ConfigureEmail" method="post">
          <input type="hidden" id="emailmainformaction" name="action" value="update"/>
          <fieldset> 
            <h3>${msg.EmailSetup_serverSectionLabel}</h3>
            <ul>
              <li>
                <label for="emailHost" class="labeltip label-required" title="${msg.EmailSetup_servernameTip}">${msg.EmailSetup_servernameLabel}</label>
                <div class="field"><input type="text" id="emailHost" name="emailHost" class="required large" value="${emailConfigData.emailHost}"/></div>
              </li>
              <li>
                <label for="emailProtocol" class="labeltip label-required" title="${msg.EmailSetup_protocolTip}">${msg.EmailSetup_protocolLabel}</label>
                <div class="field">
                  <select id="emailProtocol" name="emailProtocol" class="required">
                    <option value="SMTP" <@isOptionSelected "SMTP" emailConfigData.emailProtocol /> >SMTP</option>
                    <option value="SMTP-TLS" <@isOptionSelected "SMTP-TLS" emailConfigData.emailProtocol /> >SMTP-TLS</option>
                    <option value="SMTP-SSL" <@isOptionSelected "SMTP-SSL" emailConfigData.emailProtocol /> >SMTP-SSL</option>
                  </select>
                </div>
              </li>
              <li>
                <label for="emailPort" class="labeltip label-required" title="${msg.EmailSetup_portTip}">${msg.EmailSetup_portLabel}</label>
                <div class="field"><input type="text" id="emailPort" size="5" name="emailPort" class="required" value="${emailConfigData.emailPort}"/></div>
              </li>
              <li>
                <label for="emailUsername" class="labeltip label-required" title="${msg.EmailSetup_emailUsernameTip}">${msg.EmailSetup_emailUsernameLabel}</label>
                <div class="field"><input type="text" id="emailUsername" name="emailUsername" class="required" value="${emailConfigData.emailUsername}"/></div>
              </li>
              <li>
                <label for="emailPassword" class="labeltip label-required" title="${msg.EmailSetup_passwordTip}">${msg.EmailSetup_passwordLabel}</label>
                <div class="field">
                  <input type="password" id="emailPassword label-required" name="emailPassword" class="required" value="${emailConfigData.emailPassword}"/>
                </div>
              </li>
            </ul>
          </fieldset>
            
          <fieldset>
            <h3>${msg.EmailSetup_messageSectionLabel}</h3>
            <ul>
              <li>
                <label for="emailAddressFrom" class="labeltip label-required" title="${msg.EmailSetup_defaultFromAddressTip}">${msg.EmailSetup_defaultFromAddressLabel}</label>
                <div class="field">
                  <input type="text" id="emailAddressFrom" name="emailAddressFrom" class="large required" value="${emailConfigData.emailAddressFrom}"/>
                  <p class="fieldnote_below">${msg.EmailSetup_defaultFromAddressExample}</p>
                </div>
              </li>
              <li>
                <label for="emailSubject" class="labeltip label-required" title="${msg.EmailSetup_subjectTip}">${msg.EmailSetup_subjectLabel}</label>
                <div class="field">
                  <input type="text" id="emailSubject" name="emailSubject" class="required large" value="${emailConfigData.emailSubject}"/>
                  <p class="fieldnote_below">${msg.EmailSetup_subjectExample}</p>
                </div>
              </li>
              <li>
                <label for="emailBody" class="labeltip label-required" title="${msg.EmailSetup_bodyTip}">${msg.EmailSetup_bodyLabel}</label>
                <div class="field">
                  <textarea id="emailBody" rows="5" name="emailBody" class="large">${emailConfigData.emailBody}</textarea>
                  <p class="fieldnote_below">${msg.EmailSetup_bodyExample}</p>
                </div>
              </li>
              <li>
                <#assign isHTMLCheckedState><#if emailConfigData.isHTML = "true">checked="checked"</#if></#assign>
                <label for="isHTML" class="labeltip" title="${msg.EmailSetup_isHTML_tip}">${msg.EmailSetup_isHTML_label}</label>
                <div class="field">
                  <input type="checkbox" name="isHTML" id="isHTML" value="true" ${isHTMLCheckedState} />
                </div>
              </li>

            </ul>
          </fieldset>

          <fieldset>
            <h3>${msg.EmailSetup_advancedSectionLabel}</h3>
            <ul>
              <li>
                <label for="emailTimeout" class="labeltip label-required" title="${msg.EmailSetup_timeoutTip}">${msg.EmailSetup_timeoutLabel}</label>
                <div class="field"><input type="text" id="emailTimeout" name="emailTimeout" class="required" size="6" value="${emailConfigData.emailTimeout}"/></div>
              </li>
              <li>
                <label for="emailSSLCertKeystore" class="labeltip" title="${msg.EmailSetup_sslcertkeystoreTip}">${msg.EmailSetup_sslcertkeystoreLabel}</label>
                <div class="field"><input type="text" id="emailSSLCertKeystore" name="emailSSLCertKeystore" class="large" value="${emailConfigData.emailSSLCertKeystore}"/></div>
              </li>
              <li>
                <label for="emailKeystorePassword" class="labeltip" title="${msg.EmailSetup_sslcertkeystorePassTip}">${msg.EmailSetup_sslcertkeystorePassLabel}</label>
                <div class="field"><input type="password" id="emailKeystorePassword" name="emailKeystorePassword" class="large" value="${emailConfigData.emailKeystorePassword}"/></div>
              </li>
            </ul>
          </fieldset>

            <div id="btnrow">
              <button type="submit">${msg.btn_apply}</button>
              <button type="button" id="btn_sendTestEmail">${msg.EmailServicePage_SendTestEmail_btnLabel}</button>
            </div>
        </form>
    
        <!-- Email Send Test Form -->
        <div id="dialog-form-emailsendtest" title="${msg.EmailSetup_testConnection_dialog_title}">
          <form id="emailsendtestform" method="post" action="${EIP_RealPath}/EIPAdmin/ConfigureEmail">
            <fieldset>
              <p>${msg.EmailSetup_testConnection_dialog_subtitle}</p>
              <input type="hidden" name="action" value="test" />
              <label for="emailAddress" class="labeltip" title="${msg.EmailSetup_testConnection_emailtip}">${msg.EmailSetup_testConnection_emaillabel}</label>
              <input type="text" name="emailAddress" id="emailAddress" />
              
              <div class="emailteststatus">
              <span class="connstatus wait">${msg.EmailSetup_testConnectionWait}</span>
              <span class="connstatus success">${msg.EmailSetup_testConnectionSuccess}</span>
              <span class="connstatus failure">${msg.EmailSetup_testConnectionFailure}</span>
              </div>

            </fieldset>
          </form>
        </div>

      </section>
    </section>
  </body>
</html>  

<#-- isOptionSelected
      Determines if a select option is selected or not.
      optval - the option value of the select menu
      selval - the value from the config file
-->
<#macro isOptionSelected optval selval><#if optval = selval>selected="selected"</#if></#macro>