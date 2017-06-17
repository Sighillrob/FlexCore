<#import "/locale/messages_${locale}.ftl" as msg />
<#macro show>
<nav>
  <h3>${msg.standalone_menu_title}</h3>
  <ul>
    <li id="nav_ConfigureButtons"><a href="${EIP_RealPath}/EIPAdmin/ConfigureButtons" class="menutip" title="${msg.link_configBtnsTip}">${msg.link_configBtnsLabel}</a></li>
    <li id="nav_ConfigureDevices"><a href="${EIP_RealPath}/EIPAdmin/ConfigureDevices" class="menutip" title="${msg.link_configDevicesTip}">${msg.link_configDevicesLabel}</a></li>
    <li><h4>${msg.link_heading_odbc}</h4></li>
    <li id="nav_AutofillProfiles"><a href="${EIP_RealPath}/EIPAdmin/AutofillProfiles" class="menutip" title="${msg.link_autoFillProfileTip}">${msg.link_autoFillProfileLabel}</a></li>
    <li id="nav_DatasourceMenus"><a href="${EIP_RealPath}/EIPAdmin/DataSourceMenus" class="menutip" title="${msg.link_dataSourceMenusTip}">${msg.link_dataSourceMenusLabel}</a></li>
    <li id="nav_ConfigureDependentMenus"><a href="${EIP_RealPath}/EIPAdmin/ConfigureDependentMenus" class="menutip" title="${msg.link_dataSourceDependentMenusTip}">${msg.link_dataSourceDependentMenusLabel}</a></li>
    <li><h4>${msg.link_heading_serverconfig}</h4></li>
    <li id="nav_ConfigureServer"><a href="${EIP_RealPath}/EIPAdmin/ConfigureServer" class="menutip" title="${msg.link_configureServerTip}">${msg.link_configureServerLabel}</a></li>
    <li id="nav_ConfigureEmail"><a href="${EIP_RealPath}/EIPAdmin/ConfigureEmail" class="menutip" title="${msg.link_emailServiceTip}">${msg.link_emailServiceLabel}</a></li>
    <li><h4>${msg.link_heading_logs}</h4></li>
    <li id="nav_ScanningLog"><a href="${EIP_RealPath}/EIPAdmin/ScanningLog" class="menutip" title="${msg.link_scanLogTip}">${msg.link_scanLogLabel}</a></li>
    <li id="nav_LogSettings"><a href="${EIP_RealPath}/EIPAdmin/LogSettings" class="menutip" title="${msg.link_logSettingsTip}">${msg.link_logSettingsLabel}</a></li>
    <li><h4>${msg.link_heading_Emulator}</h4></li>
    <li id="nav_Emulator"><a href="${EIP_RealPath}/EIPAdmin/Emulator" class="menutip" title="${msg.link_EmulatorTip}">${msg.link_EmulatorLabel}</a></li>
  </ul>
</nav>

</#macro>