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
    #waitingDiv{height: ${waitingDiv_height}}
    #keyboard{height: ${keyboard_height}}
  </style>
</head>
<body>

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


<div id="main_content">
  <div id="scanText">${EIP_Error}</div>
  <div id="scanText">${EIP_ErrorMessage}</div>
</div>   

</body>
</html>  