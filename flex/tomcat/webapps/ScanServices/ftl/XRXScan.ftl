<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />

  <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/800x600.css" />
  <style>
    <#assign mainPane_height = (EIP_DisplayHeight?number - 70 - 67 - 40) + "px"/> <#-- 480px - header:70px - subheader: 67px - 40px of padding. -->
    <#assign waitingDiv_height = (EIP_DisplayHeight?number - 70 - 67) + "px"/> <#-- 480px - header:70px - subheader: 67px. -->
    <#assign keyboard_height = EIP_DisplayHeight + "px" />
    #scrollPaneWindow, #scrollPaneBtns, #treeScrollPaneWindow, #treeScrollPaneBtns{height:${mainPane_height}}
    #main_content{height:${mainPane_height}}
    #waitingDiv{height: ${waitingDiv_height}}
    #keyboard{height: ${keyboard_height}}
  </style>
<script src="${EIP_RealPath}/XRXWebservices/XRXWebservices.js" type="text/javascript"></script>
<script src="${EIP_RealPath}/XRXWebservices/XRXDeviceConfig.js" type="text/javascript"></script>
<script src="${EIP_RealPath}/XRXWebservices/XRXSession.js" type="text/javascript"></script>
<script src="${EIP_RealPath}/XRXWebservices/XRXXmlHandler.js" type="text/javascript"></script>
<script src="${EIP_RealPath}/XRXWebservices/XRXScan.js" type="text/javascript"></script>
<script src="${EIP_RealPath}/XRXWebservices/XRXTemplate.js" type="text/javascript"></script>


<script type="text/javascript">

var myprotocol = "https://127.0.0.1";

function myFunction() {
    <#if simulate?string = "true">
        simulate = "true";
        jobId = "jobId";
        document.scanForm.simulate.value = simulate;
        document.scanForm.jobId.value = jobId;
        document.scanForm.submit();

   <#else>
       simulate = "false";
       /* First try https and it fails the try http protocol */
       xrxTemplatePutTemplate(myprotocol, '${EIP_FileId}.xst', '${EIP_ScanTemplate}', finishPutTemplate, callback_failure1 );
   </#if>
}

/* call_failure1  */
function callback_failure1(p1, p2, p3) {
    myprotocol = "http://127.0.0.1";
    xrxTemplatePutTemplate(myprotocol, '${EIP_FileId}.xst', '${EIP_ScanTemplate}', finishPutTemplate, callback_failure);
}

/* call_failure2  */
function callback_failure2(p1, p2, p3) {
}

/* call_failure */
function callback_failure(p1, p2, p3) {
    document.getElementById('message').innerHTML = '<img src="${EIP_RealPath}/images/admin/icon_notice_error.png"/> ${EIP_ScanFailed}';
    document.getElementById('message').className = "errormsg";
    document.getElementById('actionBtn').style.display = "block";
    document.getElementById('waitingIcon').style.display = "none";
    deleteSampleTemplate();
}

/* finishPutTemplate : Handles the response from the web service request, and stores returned checksum */
function finishPutTemplate(callid, response) {       
    // convert response to dom using web service library
    var xmlDoc = xrxStringToDom(response);
    // store checksum for deleting of template
    tchecksum = xrxGetElementValue(xmlDoc, 'TemplateChecksum'); 
    // call to web service library to initaite the scan job
    xrxScanInitiateScan( myprotocol, '${EIP_FileId}.xst', false, finishScan, callback_failure );
}

/* finishScan */
function finishScan(callid, response) {
    jobId = xrxScanParseInitiateScan ( response );
    deleteSampleTemplate();
}
  

/*  deleteSampleTemplate 
 *  NOTE: The corresponding checksum must be provided to delete a teamplet off the device.
 *  For this sample the checksum was stored from the response for the PutTemplateRequest
 */
function deleteSampleTemplate() {
           
    xrxTemplateDeleteTemplate( myprotocol, '${EIP_FileId}.xst', tchecksum, finishDeleteTemplate, callback_failure2 )
}

/* finishDeleteTemplate : Handles the response from DeleteTemplate web service request */
function finishDeleteTemplate() {
    document.scanForm.jobId.value = jobId;
    document.scanForm.submit();
}


</script>

</head>

<body id="ScanResult" onload="myFunction()">

<div id="EIPHeader" class="clearfix">
  <div id="logo">&nbsp;</div>    
  <a id="allServices" href="${EIP_URLAllServices}">${EIP_AllServices}</a>
</div>
<div id="subheader" class="clearfix">
    <A class="navbtn navbtn_home" HREF="Home">&nbsp;</A>
    <span class="location_label">${EIP_ButtonName}</span>
    <#if isGuest?string = "false">
      <a href="${EIP_URLLogout}" class="navbtn navbtn_logout"/>&nbsp;</a>
    </#if>
    <span class="user">${EIP_UserName}</span>
</div> 

 <div id="waitingDiv" style="display:block;">  
   <div id="waitingDivInner">
     <img id="waitingIcon" src="${EIP_RealPath}/images/DS/wait.gif"  />
     <p id="message">${EIP_ScanMessage}</p>
     <div id="actionBtn" style="display:none">
      <table class="labelbtn" cellspacing="0">
        <tr>
          <td class="labelbtn_left"></td>
          <td class="labelbtn_middle"><A HREF="javascript:history.go(-1)">${EIP_Cancel}<a></td>
          <td class="labelbtn_right"></td>
        </tr>
    </table>
    </div>
  </div>
 </div>

<div is="main_content">
  <form name="scanForm" id="scanForm" action="${EIP_CreateDoc}" method="post">
      <input type="hidden" value="${EIP_FileId}" name="fileId" id="fileId" />
      <input type="hidden" name="buttonId" value="${EIP_ButtonId}" />
      <input type="hidden" name="emailAddress" value="${EIP_EmailAddress}" />
      <input type="hidden" name="collHandle" value="${EIP_CollHandle}" />
      <input type="hidden" name="uncPath" value="${EIP_uncPath}" />
      <input type="hidden" name="jobId" />
      <input type="hidden" name="simulate" />
  </form>
</div>

</body>
</html>
  





