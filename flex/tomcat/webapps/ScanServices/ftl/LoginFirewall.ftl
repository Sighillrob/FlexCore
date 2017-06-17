<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="cache-control" content="no-cache" />
  <meta http-equiv="pragma" content="no-cache" />
  <meta http-equiv="expires" content="0" />
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" type="text/css" href="${EIP_RealPath}/style/800x600.css" />
</head>
<body id="clientLogin">

<div id="EIPHeader" class="clearfix">
  <div id="logo">&nbsp;</div>
</div>


<div id="subheader" class="clearfix">
  <span class="location_label">${EIP_Login}</span>
</div>

<div id="main_content">
  <div id="scanText">${EIP_LoginMessage}</div>
  <form action="${EIP_URLForward}" method="post" name="Login">
      <div class="loginFields">
  	    <table class="inputFields" cellpadding="0" cellspacing="5">
          <tr class="inputFieldRow">
            <td class="label"><@labelbtn "password" EIP_Password/></td>
            <td class="input">
              <input class="text" id="Password" name="Password" maxlength="255" type="password" />
            </td>
          </tr>
  	    </table>

    </div>

    <div id="actionBtn">
      <table class="labelbtn" cellspacing="0">
        <tr><td class="labelbtn_left"></td><td class="labelbtn_middle">
        <input type="submit" name="Login" value="${EIP_LoginButton}" tabindex="4"  onclick="javascript:ShowContent('waitingDiv');"/>
        </td><td class="labelbtn_right"></td></tr>
      </table>
    </div>      
  </form>

</div>

</body>
</html>

<#macro labelbtn id, label>
  <table class="labelbtn" cellspacing="0" onclick='showKeyboard("${id}", "Letter", null, null, "${label}")'><tr><td class="labelbtn_left"></td><td class="labelbtn_middle">${label}</td><td class="labelbtn_right"></td></tr></table>
</#macro>