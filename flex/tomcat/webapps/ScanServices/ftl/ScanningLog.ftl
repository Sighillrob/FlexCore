<#import "StandaloneMenu.ftl" as menu />
<#import "/locale/messages_${locale}.ftl" as msg />
<#assign pagesize = buttonData.EIPConfig.scanLogDisplayLines/>
<#assign logsize = buttonData.EIPConfig.scanLogCapacity/>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="cache-control" content="max-age=0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="pragma" content="no-cache" />
    <title>${msg.scanningLog_title}</title>
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
        connectkey.getScanHistory("${EIP_RealPath}/EIPAdmin/EIPTransactions", "${msg.scanningLog_retrieveErrorMsg}", ${pagesize}, "${msg.status_succeeded}", "${msg.status_failed}");
        
        //events...
        $("#btn_downloadCSV").click(function(e){window.location.href="${EIP_RealPath}/EIPAdmin/EIPTransactions?action=download_csv"});
        $("#logpagesize").change(function(e){connectkey.updateScanPageSize("changeLogPageSize", "${msg.scanningLog_retrieveErrorMsg}", "${EIP_RealPath}/EIPAdmin/EIPTransactions", "${msg.status_succeeded}", "${msg.status_failed}")});
        $("#changeArchiveLogSize").submit(function(e){
          connectkey.validateForm(e, "${msg.validationErrorGeneralMsg}", '<p class="fielderror error_empty"><strong>${msg.fieldErrorTitle}</strong> ${msg.fielderror_empty}</p>', "${msg.updateLogFileSize_success}", "${msg.updateLogFileSize_error}", null, null);
        });
      });
    </script>
  </head>
  <body id="ScanningLog" class="adminsection">
    <#include "adminheader.ftl">
    <@menu.show/>
    <section id="content" class=''>
      <h2>${msg.scanningLog_title}</h2>
      <!-- page description -->
      <ul id="page_description">
        <li>${msg.scanningLog_subtitle}</li>
      </ul>
      <!-- page body -->
      <section id="page_body">
      
      <button id="btn_downloadCSV">${msg.btn_downloadLogLabel}</button>
      <div id="logpagesettings">   
        <form id="changeLogPageSize" name="changeLogPageSize" action="${EIP_RealPath}/EIPAdmin/EIPTransactions">
          <label for="logpagesize" title="${msg.logpagesize_help}" class="labeltip">${msg.logpagesize_label}</label>
          <input type="hidden" name="action" value="set_display_lines"/>
          <select id="logpagesize" name="lines">
            <option value="10" <@isSelected pagesize "10"/> >10</option>
            <option value="50" <@isSelected pagesize "50"/> >50</option>
            <option value="100" <@isSelected pagesize "100"/> >100</option>
            <option value="250" <@isSelected pagesize "250"/> >250</option>
            <option value="500" <@isSelected pagesize "500"/> >500</option>
            <option value="1000" <@isSelected pagesize "1000"/> >1000</option>
          </select>
        </form>

        <form id="changeArchiveLogSize" name="changeArchiveLogSize" action="${EIP_RealPath}/EIPAdmin/EIPTransactions">
          <label for="set_capacity" title="${msg.logfilesize_help}" class="labeltip">${msg.logfilesize_label}</label>
          <input type="hidden" name="action" value="set_capacity"/>
          <input type="text" id="log_capacity" class="required" name="log_capacity" value="${logsize}">
          <button id="updateScanLogFileCapacity">${msg.btn_updateLogfilesize_label}</button>
        </form>
      </div>
      <table id="scanlogtable" class="objectlist">
        <thead>
          <tr>
            <th class="date">${msg.logTable_colLabel_date}</th>
            <th class="coll">${msg.logTable_colLabel_destination}</th>
            <th class="device">${msg.logTable_colLabel_device}</th>
            <th class="btnname">${msg.logTable_colLabel_button}</th>
            <th class="username">${msg.logTable_colLabel_username}</th>
            <th class="status">${msg.logTable_colLabel_status}</th>
          </tr>
        </thead>
        <tbody id="scanLogList"></tbody>
      </table>

      <!-- row templates for ajax to poplate table -->
      <table style="display:none">
        <tbody id="scanLogList_template">
          <tr>
            <td class="date"></td>
            <td class="coll"></td>
            <td class="device"></td>
            <td class="btnname"></td>
            <td class="username"></td>
            <td class="status"></td>
          </tr>
        </tbody>
        <tbody id="scanLogList_searching">
          <tr><td colspan="6">${msg.logLoadingMsg}</td></tr>
        </tbody>
        <tbody id="scanLogList_empty">
          <tr><td colspan="6">${msg.logEmptyMsg}</td></tr>
        </tbody>
      </table>

      </section>
    </section>
  </body>
</html>


<#-- isOptionSelected
      Determines if a select option is selected or not.
-->
<#macro isSelected optval selval><#if optval = selval>selected="selected"</#if></#macro>