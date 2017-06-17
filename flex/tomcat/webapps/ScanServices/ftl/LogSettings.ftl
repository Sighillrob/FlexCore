<#import "StandaloneMenu.ftl" as menu />
<#import "/locale/messages_${locale}.ftl" as msg />
<!DOCTYPE html>
<html>
  <head>
    <title>${msg.serverLogPage_title}</title>
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
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
         var msg = '${EIP_Message}';
          if(msg !=''){
            connectkey.showMessage(msg, "success");
          }

          $("#btn_downloadLogFile").click(function(e){window.location.href="${EIP_RealPath}/EIPAdmin/DownloadLogFile"});

        });

      function checkform(pAction) { 
        document.getElementById("action").value = pAction;
        document.loggingForm.submit();
      }


    </script>
  </head>

  <body id="LogSettings" class="adminsection">
    <#include "adminheader.ftl">
    <@menu.show/>
    <section id="content" class=''>
    
      <h2>${msg.serverLogPage_title}</h2>
      <!-- page description -->
      <ul id="page_description">
        <li>${msg.serverLogPage_subtitle}</li>
      </ul>
      
      <section id="page_content">
        
        <form action="${EIP_RealPath}/EIPAdmin/LogSettings" method="post" name="loggingForm" onsubmit="return ">
          <fieldset>
            <input type="hidden" id="action" name="action" value="false" />    
            <ul>
              <li>
                <label for="logLevel" class="hastip" title="${msg.logLevel_tip}">${msg.loglevel_label}</label>
                <div class="field">
                  <select class="unstyled" id="logLevel" name="logLevel" />
                  <#list EIP_LogLevelList as key>
                    <#if (key.code == EIP_LogLevelSelected) >
                       <option selected="selected" value="${key.code}">${key.value}</option>
                    <#else>
                       <option value="${key.code}">${key.value}</option>
                    </#if>
                  </#list>
                  </select>                  
                </div>
              </li>
            </ul>

            <div id="btnrow">
              <button type="button" onclick="javascript:checkform('Apply')" tabindex="4">${msg.btn_apply}</button>
              <button type="button" id="btn_downloadLogFile">${msg.btn_logDownloadLabel}</button>
            </div>
          </fieldset>
        </form>

      </section>
    </section>
  </body>
</html>  