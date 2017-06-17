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
<body id="Emulatator" class="adminsection">
    <#include "adminheader.ftl">
    <@menu.show/>
    <section id="content" class=''>
      <h2>${msg.EmulatorPage_title}</h2>
      <!-- page description -->
      <ul id="page_description">
        <li>${msg.EmulatorPage_subtitle}</li>
      </ul>
      <!-- page body -->
      <section id="page_body">

        <table class="objectlist">

          <!--Heading-->
          <thead>
            <tr>
            </tr>
          </thead>
          <!--Body-->


          <#if buttonData.EIPConfig["button[@parentId='0']"][0]??>
            <#list buttonData.EIPConfig["button[@parentId='0']"] as btn>

 
              <#assign btnname><#if btn.@name?length &lt; 25>${btn.@name}<#else>${btn.@name?substring(0,24)} &#8230;</#if></#assign>
              <#assign hasbtnicon><#if btn.icon[0]??>style="background-image:url(${EIP_RealPath}/images/${btn.icon})"</#if></#assign>
              <tr>
                <td>
                  
                  <a class="hastip ckbutton button_mfd" href="${EIP_RealPath}/EIPServer/Init?&amp;debug=1&amp;buttonId=${btn.@buttonId}" target="ScanServices"><i ${hasbtnicon}></i>${btnname}</a></td>
 
              </tr>
           

            </#list>

          <#else>
           
          </#if>
        </table>

    </section>
  </section>
  </body>
</html>


