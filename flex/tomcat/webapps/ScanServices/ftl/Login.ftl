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
  <script src="${EIP_RealPath}/scripts/Keyboard.js" type="text/javascript"></script>
  <script src="${EIP_RealPath}/scripts/functions.js" type="text/javascript"></script>
</head>
<body id="clientLogin">

<#include "keyboard_${EIP_lang}.ftl">

<div id="EIPHeader" class="clearfix">
  <div id="logo">&nbsp;</div>
  <a id="allServices" href="${EIP_URLAllServices}">${EIP_AllServices}</a>
</div>


<div id="subheader" class="clearfix">
  <A class="navbtn navbtn_home" HREF="Home">&nbsp;</A>
  <span class="location_label">${EIP_Login}</span>
</div>

<div id="waitingDiv"><div class="waitingIcon">&nbsp;</div></div>

<div id="main_content">
  <div id="scanText">${EIP_LoginMessage}</div>
  <form action="${EIP_URLForward}" method="post" name="Login">
    <input type="hidden" name="buttonId" value="${EIP_ButtonId}" />  

      <div class="loginFields">
  	  <table class="inputFields" cellpadding="0" cellspacing="5">
          <#if EIP_UsernameValue??>
          <#else>
            <tr class="inputFieldRow">
            <td class="label"><@labelbtn "username" EIP_Username/></td>
            <td class="input">
              <input class="text xrx:keyboardtext" id="Username" name="Username${EIP_suppressKeyboard}" maxlength="255" onclick='showKeyboard(this.id, "Letter", null, null, "${EIP_Username}")' />
            </td>
          </tr>
          </#if>
          <tr class="inputFieldRow">
            <td class="label"><@labelbtn "password" EIP_Password/></td>
            <td class="input">
              <input class="text xrx:keyboardtext" id="Password" name="Password${EIP_suppressKeyboard}" maxlength="255" type="password" onclick='showKeyboard(this.id, "Letter", null, null, "${EIP_Password}")' />
            </td>
          </tr>
  	    </table>

    </div>
    <div id="rightPanel">
      <div id="actionBtn">
        <table class="labelbtn" cellspacing="0">
          <tr><td class="labelbtn_left"></td><td class="labelbtn_middle">
          <input type="submit" name="Login" value="${EIP_LoginButton}" tabindex="4"  onclick="javascript:ShowContent('waitingDiv');"/>
          </td><td class="labelbtn_right"></td></tr>
        </table>
      </div>
    </div>
  </form>

</div>

</body>
</html>

<#macro labelbtn id, label>
  <table class="labelbtn" cellspacing="0" onclick='showKeyboard("${id}", "Letter", null, null, "${label}")'><tr><td class="labelbtn_left"></td><td class="labelbtn_middle">${label}</td><td class="labelbtn_right"></td></tr></table>
</#macro>