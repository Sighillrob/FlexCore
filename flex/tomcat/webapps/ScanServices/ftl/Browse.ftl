<#import "/locale/messages_${locale}.ftl" as msg />
<#assign maxLabelLength=20 />
<!DOCTYPE html>
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
  <script src="${EIP_RealPath}/scripts/xml2json.min.js" type="text/javascript"></script>
  <script src="${EIP_RealPath}/scripts/ObjTree.js" type="text/javascript"></script>
  <script src="${EIP_RealPath}/scripts/functions.js" type="text/javascript"></script>
  <script src="${EIP_RealPath}/scripts/Keyboard.js" type="text/javascript"></script>
  <script src="${EIP_RealPath}/scripts/select.js" type="text/javascript"></script>
  <script src="${EIP_RealPath}/scripts/scrollPane.js" type="text/javascript"></script>

  <script>
    
    /**
     * An object that retrieves dependent menu set data in xml format from the server.
     */
    var dmProfiles = [];
    /** 
     * An object that holds an array of dependent menu field data (such as all possible options) 
     * This grabs its data from the dmProfiles object and from the dependent menu field elements on the page.
     */
    var dmFieldData = [];


    window.onload = function(){
      <#if (EIP_ChildrenCounts > 0) >
      //tree scrolling panel...
      var treescrollpanel = new ScrollPane({
        windowPanelId : "treeScrollPaneWindow",
        contentId : "treeScrollPaneContent",
        buttonContainerId : "treeScrollPaneBtns",
        buttonUpId : "btn_treeScrollPane_up",
        buttonUpDisabledId : "btn_treeScrollPane_up_disabled",
        buttonDownId : "btn_treeScrollPane_down",
        buttonDownDisabledId: "btn_treeScrollPane_down_disabled",
        fadeOutTopId : "treeFadeOutTop",
        fadeOutBottomId : "treeFadeOutBottom",
        buffer : 60
      });

      <#else>
        <#if EIP_MissingScanButton??>
        <#else>

          // DEPENDENT MENU SCRIPTS...
          var dmProfiles = {<@compress single_line=true>
          <#list EIP_MetaDependentMenuProfiles as profile>
            <#assign profiledata = 'EIP_'+ profile />
            <#assign profilemarkup = .vars[profiledata].@@markup />
            '${profile}' : '${profilemarkup?js_string}'<#if profile_has_next>,</#if>
          </#list>
          </@compress>};

          /**
           * convertDependentMenuData
           * This function converts the xml inside the dmProfiles object into JSON
           */
          convertDependentMenuData(dmProfiles);
          
          /**
           * convertDependentMenuData
           * This function creates a usable data object from the dmProfiles data now transformed into JSON
           * to store all necessary info to make the dependent menus work in the object dmFieldData.  It also
           * loads the correct menu labels for all menu fields in all dependent menu sets into the form.
           */
          loadDependentMenuValues(dmProfiles);


          //property list scrolling panel...
          var scrollpanel = new ScrollPane({
            windowPanelId : "scrollPaneWindow",
            contentId : "scrollPaneContent",
            buttonContainerId : "scrollPaneBtns",
            buttonUpId : "btn_scrollPane_up",
            buttonUpDisabledId : "btn_scrollPane_up_disabled",
            buttonDownId : "btn_scrollPane_down",
            buttonDownDisabledId: "btn_scrollPane_down_disabled",
            fadeOutTopId : "fadeOutTop",
            fadeOutBottomId : "fadeOutBottom",
            buffer : 57
          });

          <#if EIP_ButtonDBAgent !="">
            /**
             * Loads the values of all autofilled fields if the primary field has a default value.
             */
            initAFPPrimaryMenus();
          </#if>

          <#if EIP_ButtonBrowseCollection = 'true' && EIP_ButtonCollectionHandle != "">
            /**
             * Loads the Collection title property into the Browse field rather than seeing its handle value.
             */
            loadCollectionLabel('${EIP_RealPath}/EIPServer/SearchDB?searchType=handle&stringSearch=${EIP_ButtonCollectionHandle}&buttonId=${EIP_ButtonId}');
          </#if>

        </#if>
      </#if>
    }

  </script>
</head>

<body id="clientBrowse">
<#include "keyboard_${EIP_lang}.ftl">

<div id="EIPHeader" class="clearfix">
  <div id="logo">&nbsp;</div>
  <a id="allServices" href="${EIP_URLAllServices}">${EIP_AllServices}</a>
</div>

<div id="subheader" class="clearfix">
  <A class="navbtn navbtn_home" HREF="Home">&nbsp;</A>
  <#if (EIP_GoBack == "true") >
    <A class="navbtn navbtn_back" HREF="javascript:history.go(-1)">&nbsp;</A>
  </#if>
  <#-- in case the button name is too long... -->
  <#assign EIP_ButtonName_concat><#if EIP_ButtonName?length &lt; 40>${EIP_ButtonName}<#else>${EIP_ButtonName?substring(0,39)}&#8230;</#if></#assign>
  <span class="location_label">${EIP_ButtonName_concat}</span>

  <#if isGuest?string = "false">
    <a href="${EIP_URLLogout}" class="navbtn navbtn_logout"/>&nbsp;</a>
  </#if>

  <span class="user">${EIP_UserName}</span>

</div>

<div id="waitingDiv"><div class="waitingIcon">&nbsp;</div></div>


<div id="main_content">
  <#if (EIP_ChildrenCounts > 0) >

    <div id="treeScrollPaneWindow">
      <div id="treeFadeOutTop"></div>
      <div id="treeScrollPaneContent">
        <ul class="treelist">
          <#list EIP_ChildrenNameList as Name>
            <#if EIP_ChildrenIsScanButtonList[Name_index] == false >
              <#assign class = "treebtn_folder">
            <#else>
              <#assign class = "treebtn_form">
            </#if>
            <#-- in case the button name is too long... -->
            <#assign btnname_concat><#if Name?length &lt; 60>${Name}<#else>${Name?substring(0,59)}&#8230;</#if></#assign>
            <li value="${EIP_ChildrenIdList[Name_index]}" class='${class} ${["odd", "even"][Name_index%2]}'><a href="${EIP_URLBrowseForward}?buttonId=${EIP_ChildrenIdList[Name_index]}"><span>${btnname_concat}</span></a></li>
          </#list>
        </ul>
      </div>
      <div id="treeFadeOutBottom"></div>
      <div id="treeScrollPaneBtns">
        <div id="btn_treeScrollPane_up"></div><div id="btn_treeScrollPane_up_disabled"></div>
        <div id="btn_treeScrollPane_down"></div><div id="btn_treeScrollPane_down_disabled"></div>
      </div>
    </div>

  <#else>
    <#if EIP_MissingScanButton??>
      <div id="scanText">${EIP_ScanMessage}</div>
    <#else>
      <#-- <textarea>${EIP_Config["//DBAgent[name='Test Autofill']/columns/column"].@@markup}</textarea> -->
    
      <form action="${EIP_URLScanForward}" method="post" name="button" onsubmit="return validateRequiredFields();" class="clearfix">
        <input type="hidden" name="buttonId" id="buttonId" value="${EIP_ButtonId}" />
        <input type="hidden" id="docType" value="${EIP_ButtonDocType}" />
        <#if EIP_ButtonDBAgent != "">
        <input type="hidden" id="afpname" value="${EIP_ButtonDBAgent}" />
        </#if>

        <div id="scrollPaneWindow">
          <div id="fadeOutTop"></div>
          <div id="scrollPaneContent">

            <div class="scanFields">
              <table class="inputFields" cellpadding="0" cellspacing="5">

              <#-- Show chooser for browsing for Collections or Network Folders if browseCollection == true -->
              <#if EIP_ButtonBrowseCollection = 'true'>

                <#assign browseMenuLabel = ""/>
                <#assign selectBtnLabel = ""/>
                <#assign browseResponseError = ""/>
                <#assign browseMenuName = ""/>
                <#assign browseValue = ""/>
                <#assign browseLabel = ""/>
                <#assign browseURL =""/>
                <#assign browseURLBase = ""/>
                <#assign loadingclass=""/>
                <#assign upOneLevel = "${msg.browseCollection_UpOneLevel}"/>

                <#if EIP_ButtonCollectionHandle != "">
                  <#assign browseMenuLabel = "${msg.browseCollection_MenuLabel}">
                  <#assign selectBtnLabel = "${msg.browseCollection_selectBtnLabel}"/>
                  <#assign browseResponseError = "${msg.browseCollection_ResponseError}"/>
                  <#assign browseMenuName = "collHandle"/>
                  <#assign browseMenuLabelInput = "dsCollection"/>
                  <#assign browseValue = EIP_ButtonCollectionHandle />
                  <#assign browseURL>${EIP_RealPath}/EIPServer/BrowseCollection?buttonId=${EIP_ButtonId}&searchType=subCollection&collHandle=</#assign>
                  <#assign browseURLBase>${EIP_RealPath}/EIPServer/BrowseCollection?buttonId=${EIP_ButtonId}&searchType=subCollection&collHandle=</#assign>
                  <#assign loadingclass="folderloading"/>

                <#elseif EIP_ButtonUNCPath !="">
                  <#assign browseMenuLabel = "${msg.browseFolder_MenuLabel}">
                  <#assign selectBtnLabel = "${msg.browseFolder_selectBtnLabel}"/>
                  <#assign browseResponseError = "${msg.browseFolder_ResponseError}"/>
                  <#assign browseMenuName = "uncPath"/>
                  <#assign browseMenuLabelInput = "uncPath"/>
                  <#assign browseValue = EIP_ButtonUNCPath />
                  <#assign browseLabel =  EIP_ButtonUNCPath?split('\\')?last />
                  <#assign browseURL>${EIP_RealPath}/EIPServer/BrowseCollection?buttonId=${EIP_ButtonId}&searchType=subFolder&uncPath=</#assign>
                  <#assign browseURLBase>${EIP_RealPath}/EIPServer/BrowseCollection?buttonId=${EIP_ButtonId}&searchType=subFolder&uncPath=</#assign>

                </#if>
                <input type="hidden" id="rootfolderLocation" value="${browseValue}" />
                <input type="hidden" id="browseurlbase" value="${browseURLBase}" />
                <tr class="inputFieldRow">
                  <td class="label"><@labelbtn_pulldown browseMenuLabel browseMenuName "true" /></td>
                  <td class="input ${loadingclass}">
                    <#-- This first input field is just for show - to show the label of the Collection or the network folder. -->
                    <input name="${EIP_suppressKeyboard}" class="xrx:keyboardtext" id="browseLocLabel" value="${browseLabel}" maxlength="255" onclick="showFolderBrowseMenu(this.id, '${browseURL}', '${browseResponseError}', '${upOneLevel}')" />
                    <input id="browseLocValue" name="${browseMenuName}" type="hidden" class="required" value="${browseValue}" />
                  </td>
                </tr>
              </#if>

              <#list EIP_MetaName as name>
                <#assign isAutoFillProfileMapped = "false">
                <#assign isAutoFillProfileFieldRequired = "false">
                <#assign autoFillMappedClass = "">
                <#assign autofillPrimaryClass="">
                <#assign afpFieldClass="">
                <#assign dmClass=""/>
                <#assign dmPrimaryClass=""/>


                <#if EIP_ButtonDBAgent != "">
                  <#list EIP_Config["//DBAgent[name='${EIP_ButtonDBAgent}']/columns/column"] as column>
                  <#if column.@dsProperty == EIP_MetaName[name_index]>
                    <#assign isAutoFillProfileMapped = "true">
                    <#assign autoFillMappedClass = "af-mapped">
                    <#assign afpFieldClass="afp-mapped-field">
                    <#if column.@primary = "true">
                      <#assign isAutoFillProfileFieldRequired = "true">
                      <#assign autofillPrimaryClass="af-primary">
                      <#assign afpFieldClass="afp-primary-field">
                    </#if>
                  </#if>
                  </#list>
                </#if>

                <#if EIP_MetaDependentMenuProfile[name_index] != "">
                  <#assign dmClass="dm-field"/>
                </#if>

                <#assign isRequired><#if EIP_MetaRequire[name_index] == "true" || EIP_MetaType[name_index] == "writerequired">true<#else>false</#if></#assign>
                <#assign reqClass><#if EIP_MetaRequire[name_index] == "true" || EIP_MetaType[name_index] == "writerequired">required</#if></#assign>

                <#-- Editable Property -->
                <#if (EIP_MetaType[name_index] == "write" || EIP_MetaType[name_index] == "writerequired") >
                  <tr class="inputFieldRow ${autofillPrimaryClass} ${autoFillMappedClass} ${dmClass}">

                    <#-- DocuShare Menu Property -->
                    <#if EIP_MetaMenu[name_index] != "">
                      <td class="label"><@labelbtn_pulldown EIP_MetaLabel[name_index] name isRequired /></td>
                      <td class="input">

                      <#assign menuLabel><#list EIP_MetaMenu[name_index]?split("||") as option><#if option?split(":")[0] == EIP_MetaValue[name_index]>${option?split(":")[1]}</#if></#list></#assign>
                      <input name="${EIP_suppressKeyboard}" class="xrx:keyboardtext" value="${menuLabel}" id="${name}" maxlength="255" onclick="showSelectMenu(this.id, 'selectMenu_${name}')" />
                      <input name="${name}" type="hidden" class="${reqClass} ${afpFieldClass}" value="${EIP_MetaValue[name_index]}" />

                    <#-- ODBC Menu Property -->
                    <#elseif EIP_MenuAgent[name_index] !="">
                      <td class="label"><@labelbtn_pulldown EIP_MetaLabel[name_index] name isRequired /></td>
                      <td class="input">
                      <#assign menuval>
                        <@compress singleline=true>
                        <#if EIP_MenuAgent[name_index] != "">
                          <#assign menuvals = EIP_MenuAgents.MenuAgent["agent[@name='${EIP_MenuAgent[name_index]}']/menu/@value"]>
                          <#list menuvals?split("||") as option>
                            <#if option?split(":")[0] = EIP_MetaValue[name_index]>${option?split(":")[1]}</#if>
                          </#list>
                        </#if>
                        </@compress>
                      </#assign>

          						<input name="${EIP_suppressKeyboard}" class="xrx:keyboardtext" value="${menuval}" id="${name}" maxlength="255" onclick="showSelectMenu(this.id, 'selectMenu_${EIP_MenuAgent[name_index]}')" />
          						<input name="${name}" class="${reqClass} ${afpFieldClass}" type="hidden" value="${EIP_MetaValue[name_index]}" />

                    <#-- ODBC Menu Part of Dependent Menu Set -->
                    <#elseif EIP_MetaDependentMenuProfile[name_index] != "">
                      <td class="label"><@labelbtn_pulldown_dms EIP_MetaLabel[name_index] name isRequired /></td>
                      <td class="input">
                      <#assign setname = 'EIP_'+ EIP_MetaDependentMenuProfile[name_index]/>
                      <#assign setdata = .vars[setname] />
                      <#assign menuLabel=""/>
                      <#assign menuOrder = "0">
                      <#assign prevMenuData = setdata.EditDependentMenuAgents["MenuAgent[property='${name}']/preceding-sibling::MenuAgent[1]"]/>
                      <#assign dmMenuAgent = setdata.EditDependentMenuAgents["MenuAgent[property='${name}']/name"]/>

                      <#--get the menu position in the set -->
                      <#list setdata.EditDependentMenuAgents.MenuAgent as menuAgent>
                        <#if menuAgent.property = name>
                          <#assign menuOrder = menuAgent_index>
                        </#if>
                      </#list>

                      <#--is a primary menu in a Dependent Menu Set... -->
                      <#if setdata.EditDependentMenuAgents.MenuAgent[0].property = EIP_MetaName[name_index]>
                        <#list setdata.EditDependentMenuAgents["MenuAgent[2]/dependency[@profile = '${EIP_MetaDependentMenuProfile[name_index]}']/depend"] as depend>
                          <#if depend.@keyValue = EIP_MetaValue[name_index]>
                            <#assign menuLabel = depend.@keyLabel />
                            <#assign menuOrder = "0" />
                          </#if>
                        </#list>
                      </#if>

                      <input value="${menuLabel}" id="${name}" maxlength="255" onclick="showSelectDependentMenu(this.id, 'selectMenu_${name}')" dm-order="${menuOrder}" dm-menuagent="${dmMenuAgent}" class="dm-label xrx:keyboardtext" name="${EIP_suppressKeyboard}"/>
                      <input name="${name}" type="hidden" class="${reqClass} dependentmenu" value="${EIP_MetaValue[name_index]}" dm-order="${menuOrder}" dm-menuagent="${dmMenuAgent}" dm-set="${EIP_MetaDependentMenuProfile[name_index]}" dm-parentid="" id="${name}_value"/>

                    <#-- Text Property -->
                    <#else>
                    <#assign metalabel><@compress singleline=true>
                      <#if EIP_MetaName[name_index] = "title" && EIP_ScanType = "Email">${msg.emailSubjectLabel}
                      <#elseif EIP_MetaName[name_index] = "title" && EIP_ScanType = "Folder">${msg.folderSubjectLabel}
                      <#else>${EIP_MetaLabel[name_index]}
                      </#if></@compress>
                    </#assign>
                      <td class="label"><@labelbtn metalabel name EIP_MetaType[name_index] isRequired /></td>
                      <td class="input">
                      <input class="${reqClass} ${afpFieldClass} xrx:keyboardtext" id="${name}" name="${name}${EIP_suppressKeyboard}" value="${EIP_MetaValue[name_index]}" maxlength="255" onclick='showKeyboard(this.id, "Letter", null, null, "${metalabel}")'/>
                    </#if>

                  </td>
                 </tr>

                <#-- Read-only Property -->
                <#else>
                  <#if (EIP_MetaType[name_index] == "read") >
                    <#assign metalabel><@compress singleline=true>
                      <#if EIP_MetaName[name_index] = "title" && EIP_ScanType = "Email">${msg.emailSubjectLabel}
                      <#elseif EIP_MetaName[name_index] = "title" && EIP_ScanType = "Folder">${msg.folderSubjectLabel}
                      <#else>${EIP_MetaLabel[name_index]}
                      </#if></@compress>
                    </#assign>
                    <tr class="inputFieldRow ${autofillPrimaryClass} ${autoFillMappedClass}">
                      <td class="label"><@labelbtn metalabel name EIP_MetaType[name_index] isRequired/></td>
                      <td class="input inputdisabled">
                        <span class="readonlyvalue">${EIP_MetaValue[name_index]}</span>
                        <input type="hidden" id="${name}" name="${name}" class="${afpFieldClass}" value="${EIP_MetaValue[name_index]}" />
                      </td>
                    </tr>
                  <#else>
                     <input type="hidden" id="${name}" name="${name}" class="${afpFieldClass}" value="${EIP_MetaValue[name_index]}" />
                  </#if>
                </#if>
               </#list>

               <#-- Scan settings toggle button displays all scan fields (advanced scan) -->
               <tr class="inputFieldRow">
                 <td class="label"><@labelbtn_pulldown_scan_adv_settings '${msg.label_MfpScanSettings}' /></td>
                 <#-- showSelectMenu javascript is relying on input[1] -->
                 <td class="input" style="display:none"> 
                   <input value="" id="blank_page" maxlength="255" />
                   <input id="blank_page" name="blank_page" type="hidden" value="" />
                 </td>
                 
               </tr>               

               <tr class="inputFieldRow advSettings">
                 <td class="label"><@labelbtn_pulldown_scan '${msg.propLabel_MfpScanPage}' /></td>
                 <td class="input">
                   <input name="${EIP_suppressKeyboard}" class="xrx:keyboardtext" value="${msg.optionLabel_OneSided}" id="scan_page" maxlength="255" onclick='showSelect("layerscan_page", this.id)' />
                   <input id="scan_page" name="scan_page" type="hidden" value="ONE_SIDED" />
                   <input id="emailAddress" name="emailAddress" type="hidden" value="${EIP_EmailAddress}" />
                 </td>
               </tr>
            
               <tr class="inputFieldRow advSettings">
                 <td class="label"><@labelbtn_pulldown_orient '${msg.propLabel_MfpAdv_Orientation}' /></td>
                 <td class="input">
                   <input name="${EIP_suppressKeyboard}"  class="xrx:keyboardtext" value="${msg.scanOrientationOption_Portrait}" id="scan_orient" maxlength="255" onclick='showSelect("layerorient_page", this.id)' />
                   <input id="scan_orient" name="scan_orient" type="hidden" value="PORTRAIT" />
                 </td>
               </tr>

               <tr class="inputFieldRow advSettings">
                 <td class="label"><@labelbtn_pulldown_size '${msg.propLabel_MfpAdv_Size}' /></td>
                 <td class="input">
                   <input name="${EIP_suppressKeyboard}"  class="xrx:keyboardtext" value="${msg.scanSizeOption_Auto}" id="scan_size" maxlength="255" onclick='showSelect("layersize_page", this.id)' />
                   <input id="scan_size" name="scan_size" type="hidden" value="AUTO" />
                 </td>
               </tr>  
          

               <#-- Display the additional scan settings when the user has selected to export the scan settings -->
               <#if (EIP_exportScanSetting = 'true') >

                 <tr class="inputFieldRow advSettings" >
                   <#assign ocrMsg><@compress singleline=true>
                    <#if EIP_scanOCR == "IMAGE_ONLY">${msg.optionLabel_IMAGE_ONLY}
                    <#elseif EIP_isServerOCR == true && EIP_scanOCR == "SEARCHABLE_IMAGE">${msg.optionLabel_DefaultOCR_searchableByDevice}
                    <#elseif EIP_isServerOCR == true && EIP_scanOCR == "SEARCHABLE_IMAGE_SERVER">${msg.optionLabel_DefaultOCR_searchableByServer}
                    <#elseif EIP_isServerOCR == false && EIP_scanOCR == "SEARCHABLE_IMAGE">${msg.optionLabel_SEARCHABLE_IMAGE}
                    <#else>${EIP_scanOCR}
                    </#if></@compress>
                   </#assign>

                   <td class="label"><@labelbtn_pulldown_ocr '${msg.propLabel_MfpAdv_OCR}' /></td>
                   <td class="input">
                     <input name="${EIP_suppressKeyboard}"  class="xrx:keyboardtext" value="${ocrMsg}" id="scan_ocr" maxlength="255" onclick='showSelect("layerocr_page", this.id)' />
                     <input id="scan_ocr" name="scan_ocr" type="hidden" value="${EIP_scanOCR}" />
                   </td>
                 </tr>
                 <tr class="inputFieldRow advSettings" >
                   <#assign formatMsg><@compress singleline=true>
                    <#if EIP_scanFormat == "PDF">${msg.optionLabel_DefaultFormat_pdf}
                    <#elseif EIP_scanFormat == "PDFA-1b">${msg.optionLabel_PDF_A}
                    <#elseif EIP_scanFormat == "MRC-PDF">${msg.optionLabel_MRC_PDF}
                    <#elseif EIP_scanFormat == "MRC-PDFA-1b">${msg.optionLabel_MRC_PDF_A}
                    <#else>${EIP_scanFormat}
                    </#if></@compress>
                   </#assign>

                   <td class="label"><@labelbtn_pulldown_format '${msg.propLabel_MfpAdv_Format}' /></td>
                   <td class="input">
                     <input name="${EIP_suppressKeyboard}" class="xrx:keyboardtext" value="${formatMsg}" id="scan_format" maxlength="255" onclick='showSelect("layerformat_page", this.id)' />
                     <input id="scan_format" name="scan_format" type="hidden" value="${EIP_scanFormat}" />
                   </td>
                 </tr>
                 <tr class="inputFieldRow advSettings" >
                   <#assign resolutionMsg><@compress singleline=true>
                    <#if EIP_scanRes == "RES_200X200">${msg.optionLabel_DefaultResolution_200x200}
                    <#elseif EIP_scanRes == "RES_300X300">${msg.optionLabel_DefaultResolution_300x300}
                    <#else>${EIP_scanRes}
                    </#if></@compress>
                   </#assign>

                   <td class="label"><@labelbtn_pulldown_resolution '${msg.propLabel_MfpAdv_Resolution}' /></td>
                   <td class="input">
                     <input name="${EIP_suppressKeyboard}"  class="xrx:keyboardtext" value="${resolutionMsg}" id="scan_res" maxlength="255" onclick='showSelect("layerresolution_page", this.id)' />
                     <input id="scan_res" name="scan_res" type="hidden" value="${EIP_scanRes}" />
                   </td>
                 </tr>
                 <tr class="inputFieldRow advSettings" >
                   <#assign colorMsg><@compress singleline=true>
                    <#if EIP_scanColor == "AUTO">${msg.scanColorOption_AUTO}
                    <#elseif EIP_scanColor == "FULL_COLOR">${msg.scanColorOption_FULL_COLOR}
                    <#elseif EIP_scanColor == "GRAYSCALE">${msg.scanColorOption_GRAYSCALE}
                    <#elseif EIP_scanColor == "BLACK_AND_WHITE">${msg.scanColorOption_BLACK_AND_WHITE}
                    <#else>${EIP_scanColor}
                    </#if></@compress>
                   </#assign>

                   <td class="label"><@labelbtn_pulldown_color '${msg.propLabel_MfpAdv_Color}' /></td>
                   <td class="input">
                     <input name="${EIP_suppressKeyboard}"  class="xrx:keyboardtext" value="${colorMsg}" id="scan_color" maxlength="255" onclick='showSelect("layercolor_page", this.id)' />
                     <input id="scan_color" name="scan_color" type="hidden" value="${EIP_scanColor}" />
                   </td>
                 </tr>

               </#if>

            </table>

          </div> <#-- End scanFields -->

        </div> <#-- End scrollPaneContent -->
        <div id="fadeOutBottom"></div>
        <div id="scrollPaneBtns">
          <div id="btn_scrollPane_up"></div><div id="btn_scrollPane_up_disabled"></div>
          <div id="btn_scrollPane_down"></div><div id="btn_scrollPane_down_disabled"></div>
        </div>
      </div> <#-- End scrollPaneWindow -->

      <div id="rightPanel">
        <div id="actionBtn">
          <table class="labelbtn" cellspacing="0"><tr>
            <td class="labelbtn_left"></td>
            <td class="labelbtn_middle"><input type="submit" name="${EIP_Scan}" value="${EIP_Scan}"/></td>
            <td class="labelbtn_right"></td>
          </tr></table>
        </div>
        <#if EIP_DisplayEmailAddress = true>
          <div id="emailInfo"><span class="user-emailaddress"><#if ('${EIP_EmailAddress}'?length > 15)>${'${EIP_EmailAddress}'?substring(0, 12)}...<#else>${EIP_EmailAddress}</#if></span></div>
        </#if>
      </div>
     </form>

      <#-- Scan Page Options Menu -->
      <div class="selectLayerInactive" id="layerscan_page">
        <div class="selectLabel">${msg.propLabel_MfpScanPage}</div>
        <div class="selectClose" onclick="closeSelect()"></div>
        <div class="selectScrollUp" onclick="scrollSelectUp()" style="display:none"></div>
        <div class="selectScrollUpDisabled" style="display:none"></div>
        <div class="selectScrollDown" onclick="scrollSelectDown()" style="display:none"></div>
        <div class="selectScrollDownDisabled" style="display:none"></div>
        <#-- assign selectPage to equal the name of the scan option parameter passed to the server prefaced by 'selectPage_', 
          except for the first parameter, 'scan_page' -->
        <div class="selectPage" id="selectPage"></div>
        <table class="buttons" cellpadding="0" cellspacing="0">       
          <tr class="buttonRow">
            <td class="buttonLeft"></td>
            <td class="buttonMiddle" onclick='selectOption(this)'>${msg.optionLabel_OneSided}<input type="hidden" value="ONE_SIDED" /></td>
            <td class="buttonRight"></td>
          </tr>
          <tr class="buttonRow">
            <td class="buttonLeft"></td>
            <td class="buttonMiddle" onclick='selectOption(this)'>${msg.optionLabel_TwoSided}<input type="hidden" value="TWO_SIDED" /></td>
            <td class="buttonRight"></td>
          </tr>
          <tr class="buttonRow">
            <td class="buttonLeft"></td>
            <td class="buttonMiddle" onclick='selectOption(this)'>${msg.optionLabel_SecondSideRotation}<input type="hidden" value="SECOND_SIDE_ROTATION" /></td>
            <td class="buttonRight"></td>
          </tr>

        </table>
      </div>

      <#-- Scan Orientation Page Options Menu -->
      <div class="selectLayerInactive" id="layerorient_page">
        <div class="selectLabel">${msg.propLabel_MfpAdv_Orientation}</div>
        <div class="selectClose" onclick="closeSelect()"></div>
        <div class="selectScrollUp" onclick="scrollSelectUp()" style="display:none"></div>
        <div class="selectScrollUpDisabled" style="display:none"></div>
        <div class="selectScrollDown" onclick="scrollSelectDown()" style="display:none"></div>
        <div class="selectScrollDownDisabled" style="display:none"></div>
        <#-- assign selectPage to equal the name of the scan option parameter passed to the server prefaced by 'selectPage_'-->
        <div class="selectPage" id="selectPage_scan_orient"></div>
        <table class="buttons" cellpadding="0" cellspacing="0">
          <tr class="buttonRow">
            <td class="buttonLeft"></td>
            <td class="buttonMiddle" onclick='selectOption(this)'>${msg.scanOrientationOption_Portrait}<input type="hidden" value="PORTRAIT" /></td>
            <td class="buttonRight"></td>
          </tr>
          <tr class="buttonRow">
            <td class="buttonLeft"></td>
            <td class="buttonMiddle" onclick='selectOption(this)'>${msg.scanOrientationOption_Landscape}<input type="hidden" value="LANDSCAPE" /></td>
            <td class="buttonRight"></td>
          </tr>
        </table>
      </div>

      <#-- Scan Size Options Menu -->
      <div class="selectLayerInactive" id="layersize_page">
        <div class="selectLabel">${msg.propLabel_MfpAdv_Size}</div>
        <div class="selectClose" onclick="closeSelect()"></div>
        <div class="selectScrollUp" onclick="scrollSelectUp()" style="display:none"></div>
        <div class="selectScrollUpDisabled" style="display:none"></div>
        <div class="selectScrollDown" onclick="scrollSelectDown()" style="display:none"></div>
        <div class="selectScrollDownDisabled" style="display:none"></div>
        <#-- assign selectPage to equal the name of the scan option parameter passed to the server prefaced by 'selectPage_'-->
        <div class="selectPage" id="selectPage_scan_size"></div>
        <table class="buttons" cellpadding="0" cellspacing="0">
          <tr class="buttonRow">
            <td class="buttonLeft"></td>
            <td class="buttonMiddle" onclick='selectOption(this)'>${msg.scanSizeOption_Auto}<input type="hidden" value="AUTO" /></td>
            <td class="buttonRight"></td>
          </tr>
          <tr class="buttonRow">
            <td class="buttonLeft"></td>
            <td class="buttonMiddle" onclick='selectOption(this)'>${msg.scanSizeOption_Mixed}<input type="hidden" value="MIXED" /></td>
            <td class="buttonRight"></td>
          </tr>
        </table>
      </div>

      <#-- Scan OCR Page Options Menu -->
      <div class="selectLayerInactive" id="layerocr_page">
        <div class="selectLabel">${msg.propLabel_MfpAdv_OCR}</div>
        <div class="selectClose" onclick="closeSelect()"></div>
        <div class="selectScrollUp" onclick="scrollSelectUp()" style="display:none"></div>
        <div class="selectScrollUpDisabled" style="display:none"></div>
        <div class="selectScrollDown" onclick="scrollSelectDown()" style="display:none"></div>
        <div class="selectScrollDownDisabled" style="display:none"></div>
        <#-- assign selectPage to equal the name of the scan option parameter passed to the server prefaced by 'selectPage_'-->
        <div class="selectPage" id="selectPage_scan_ocr"></div>
        <table class="buttons" cellpadding="0" cellspacing="0">
          <tr class="buttonRow">
            <td class="buttonLeft"></td>
            <td class="buttonMiddle" onclick='selectOption(this)'>${msg.optionLabel_IMAGE_ONLY}<input type="hidden" value="IMAGE_ONLY" /></td>
            <td class="buttonRight"></td>
          </tr>
          <#if EIP_isServerOCR == true>
            <tr class="buttonRow">
              <td class="buttonLeft"></td>
              <td class="buttonMiddle" onclick='selectOption(this)'>${msg.optionLabel_DefaultOCR_searchableByDevice}<input type="hidden" value="SEARCHABLE_IMAGE" /></td>
              <td class="buttonRight"></td>
            </tr>
            <tr class="buttonRow">
              <td class="buttonLeft"></td>
              <td class="buttonMiddle" onclick='selectOption(this)'>${msg.optionLabel_DefaultOCR_searchableByServer}<input type="hidden" value="SEARCHABLE_IMAGE_SERVER" /></td>
              <td class="buttonRight"></td>
            </tr>
          <#else>
            <tr class="buttonRow">
              <td class="buttonLeft"></td>
              <td class="buttonMiddle" onclick='selectOption(this)'>${msg.optionLabel_SEARCHABLE_IMAGE}<input type="hidden" value="SEARCHABLE_IMAGE" /></td>
              <td class="buttonRight"></td>
            </tr>
          </#if>
        </table>
      </div>

      <#-- Scan Format Page Options Menu -->
      <div class="selectLayerInactive" id="layerformat_page">
        <div class="selectLabel">${msg.propLabel_MfpAdv_Format}</div>
        <div class="selectClose" onclick="closeSelect()"></div>
        <div class="selectScrollUp" onclick="scrollSelectUp()" style="display:none"></div>
        <div class="selectScrollUpDisabled" style="display:none"></div>
        <div class="selectScrollDown" onclick="scrollSelectDown()" style="display:none"></div>
        <div class="selectScrollDownDisabled" style="display:none"></div>
        <#-- assign selectPage to equal the name of the scan option parameter passed to the server prefaced by 'selectPage_'-->
        <div class="selectPage" id="selectPage_scan_format"></div>
        <table class="buttons" cellpadding="0" cellspacing="0">
          <tr class="buttonRow">
            <td class="buttonLeft"></td>
            <td class="buttonMiddle" onclick='selectOption(this)'>${msg.optionLabel_DefaultFormat_pdf}<input type="hidden" value="PDF" /></td>
            <td class="buttonRight"></td>
          </tr>
          <tr class="buttonRow">
            <td class="buttonLeft"></td>
            <td class="buttonMiddle" onclick='selectOption(this)'>${msg.optionLabel_PDF_A}<input type="hidden" value="PDFA-1b" /></td>
            <td class="buttonRight"></td>
          </tr>
          <tr class="buttonRow">
            <td class="buttonLeft"></td>
            <td class="buttonMiddle" onclick='selectOption(this)'>${msg.optionLabel_MRC_PDF}<input type="hidden" value="MRC-PDF" /></td>
            <td class="buttonRight"></td>
          </tr>
          <tr class="buttonRow">
            <td class="buttonLeft"></td>
            <td class="buttonMiddle" onclick='selectOption(this)'>${msg.optionLabel_MRC_PDF_A}<input type="hidden" value="MRC-PDFA-1b" /></td>
            <td class="buttonRight"></td>
          </tr>
        </table>
      </div>

      <#-- Scan Resolution Page Options Menu -->
      <div class="selectLayerInactive" id="layerresolution_page">
        <div class="selectLabel">${msg.propLabel_MfpAdv_Resolution}</div>
        <div class="selectClose" onclick="closeSelect()"></div>
        <div class="selectScrollUp" onclick="scrollSelectUp()" style="display:none"></div>
        <div class="selectScrollUpDisabled" style="display:none"></div>
        <div class="selectScrollDown" onclick="scrollSelectDown()" style="display:none"></div>
        <div class="selectScrollDownDisabled" style="display:none"></div>
        <div class="selectPage" id="selectPage_scan_res"></div>
        <table class="buttons" cellpadding="0" cellspacing="0">
          <tr class="buttonRow">
            <td class="buttonLeft"></td>
            <td class="buttonMiddle" onclick='selectOption(this)'>${msg.optionLabel_DefaultResolution_200x200}<input type="hidden" value="RES_200X200" /></td>
            <td class="buttonRight"></td>
          </tr>
          <tr class="buttonRow">
            <td class="buttonLeft"></td>
            <td class="buttonMiddle" onclick='selectOption(this)'>${msg.optionLabel_DefaultResolution_300x300}<input type="hidden" value="RES_300X300" /></td>
            <td class="buttonRight"></td>
          </tr>
        </table>
      </div>

      <#-- Scan Color Page Options Menu -->
      <div class="selectLayerInactive" id="layercolor_page">
        <div class="selectLabel">${msg.propLabel_MfpAdv_Color}</div>
        <div class="selectClose" onclick="closeSelect()"></div>
        <div class="selectScrollUp" onclick="scrollSelectUp()" style="display:none"></div>
        <div class="selectScrollUpDisabled" style="display:none"></div>
        <div class="selectScrollDown" onclick="scrollSelectDown()" style="display:none"></div>
        <div class="selectScrollDownDisabled" style="display:none"></div>
        <div class="selectPage" id="selectPage_scan_color"></div>
        <table class="buttons" cellpadding="0" cellspacing="0">
          <tr class="buttonRow">
            <td class="buttonLeft"></td>
            <td class="buttonMiddle" onclick='selectOption(this)'>${msg.scanColorOption_AUTO}<input type="hidden" value="AUTO" /></td>
            <td class="buttonRight"></td>
          </tr>
          <tr class="buttonRow">
            <td class="buttonLeft"></td>
            <td class="buttonMiddle" onclick='selectOption(this)'>${msg.scanColorOption_FULL_COLOR}<input type="hidden" value="FULL_COLOR" /></td>
            <td class="buttonRight"></td>
          </tr>
          <tr class="buttonRow">
            <td class="buttonLeft"></td>
            <td class="buttonMiddle" onclick='selectOption(this)'>${msg.scanColorOption_GRAYSCALE}<input type="hidden" value="GRAYSCALE" /></td>
            <td class="buttonRight"></td>
          </tr>
          <tr class="buttonRow">
            <td class="buttonLeft"></td>
            <td class="buttonMiddle" onclick='selectOption(this)'>${msg.scanColorOption_BLACK_AND_WHITE}<input type="hidden" value="BLACK_AND_WHITE" /></td>
            <td class="buttonRight"></td>
          </tr>
        </table>
      </div>

      <#-- DocuShare Menus -->
      <#list EIP_MetaName as prop>
        <#if EIP_MetaMenu[prop_index] != "">
        <div class="selectLayerInactive" id="selectMenu_${prop}">
          <div class="selectLabel">${EIP_MetaLabel[prop_index]}</div>
          <div class="selectClose" onclick="closeSelect()"></div>
          <div class="selectScrollUp" onclick="scrollSelectUp()" style="display:none"></div>
          <div class="selectScrollUpDisabled" style="display:none"></div>
          <div class="selectScrollDown" onclick="scrollSelectDown()" style="display:none"></div>
          <div class="selectScrollDownDisabled" style="display:none"></div>
          <div class="selectPage"></div>
          <table class="buttons" cellpadding="0" cellspacing="0">
            <#list EIP_MetaMenu[prop_index]?split("||") as option>
              <tr class="buttonRow">
                <td class="buttonLeft"></td>
                <td class="buttonMiddle" onclick='selectOption(this)'>${option?split(":")[1]}<input type="hidden" value="${option?split(":")[0]}" /></td>
                <td class="buttonRight"></td>
              </tr>
            </#list>
          </table>
        </div>
        </#if>
      </#list>


      <#-- ODBC Menus -->
      <#if EIP_MenuAgents??>
      <#list EIP_MenuAgents.MenuAgent.agent as agent>
        <#assign proptitle>
        <@compress singleline=true>
          <#list EIP_MetaName as prop>
            <#if EIP_MenuAgent[prop_index] == agent.@name>${EIP_MetaLabel[prop_index]}</#if>
          </#list>
        </@compress>
        </#assign>
        <div class="selectLayerInactive" id="selectMenu_${agent.@name}">
          <div class="selectLabel">${proptitle}</div>
          <div class="selectClose" onclick="closeSelect()"></div>
          <div class="selectScrollUp" onclick="scrollSelectUp()" style="display:none"></div>
          <div class="selectScrollUpDisabled" style="display:none"></div>
          <div class="selectScrollDown" onclick="scrollSelectDown()" style="display:none"></div>
          <div class="selectScrollDownDisabled" style="display:none"></div>
          <div class="selectPage"></div>
          <table class="buttons" cellpadding="0" cellspacing="0">
            <#list agent.menu.@value?split("||") as option>
              <tr class="buttonRow">
                <td class="buttonLeft"></td>
                <td class="buttonMiddle" onclick='selectOption(this)'>${option?split(":")[1]}<input type="hidden" value="${option?split(":")[0]}" /></td>
                <td class="buttonRight"></td>
              </tr>
            </#list>
          </table>
        </div>
      </#list>
      </#if>

      <#-- Dependent Menu Set Menus -->
      <#list EIP_MetaName as prop>
        <#if EIP_MetaDependentMenuProfile[prop_index] != "">
        <div class="selectLayerInactive" id="selectMenu_${prop}">
          <div class="selectLabel">${EIP_MetaLabel[prop_index]}</div>
          <div class="selectClose" onclick="closeSelect()"></div>
          <div class="selectScrollUp" onclick="scrollSelectUp()" style="display:none"></div>
          <div class="selectScrollUpDisabled" style="display:none"></div>
          <div class="selectScrollDown" onclick="scrollSelectDown()" style="display:none"></div>
          <div class="selectScrollDownDisabled" style="display:none"></div>
          <div class="selectPage"></div>
          <table class="buttons" cellpadding="0" cellspacing="0"></table>
        </div>
        </#if>
      </#list>

      
      <#-- Collection Browsing Menu -->
      <#if EIP_ButtonBrowseCollection = 'true'>
        <div class="selectLayerInactive" id="selectMenu_folderPath">
          <div class="selectLabel">
            <div id="selectMenu_folderPath_label">${browseMenuLabel}</div>
            <div class="selectMenu_folderPath_currentPath_wrapper">
              <span id="selectMenu_folderPath_currentPath">${browseValue}</span>
            </div>
          </div>
          <div class="selectClose" onclick="closeSelect()"></div>
          <div class="selectScrollUp" onclick="scrollSelectUp()" style="display:none"></div>
          <div class="selectScrollUpDisabled" style="display:none"></div>
          <div class="selectScrollDown" onclick="scrollSelectDown()" style="display:none"></div>
          <div class="selectScrollDownDisabled" style="display:none"></div>
          <div class="selectPage"></div>
          <table class="buttons" cellpadding="0" cellspacing="0" id="folderpath_options"></table>
          <div class="selectFolderBtnRow">
            <table cellpadding="0" cellspacing="0" id="selectFolderBtn" class="">
              <tr class="buttonRow bottom">
                <td class="buttonLeft"></td>
                <td class="buttonMiddle" id="selectFolderBtnTrigger" onclick="selectFolder(this)">${selectBtnLabel}<input id="selectedFolderValue" value="${browseValue}" type="hidden"><input id="selectedFolderLabel" value="" type="hidden"></td>
                <td class="buttonRight"></td>
              </tr>
            </table>
          </div>
        </div>
      </#if>

    </#if>
  </#if>

</div>

</body>
</html>

<#-- Button for scan pulldown -->
<#macro labelbtn_pulldown_scan label>
  <table class="labelbtn" cellspacing="0" onclick='showSelect("layerscan_page", "scan_page")'><tr><td class="labelbtn_left"></td><td class="labelbtn_middle"><#if ('${label}'?length > maxLabelLength)>${'${label}'?substring(0, maxLabelLength)}...<#else>${label}</#if></td><td class="labelbtn_right"></td></tr></table>
</#macro>

<#-- Button for scan orientation pulldown -->
<#macro labelbtn_pulldown_orient label>
  <table class="labelbtn" cellspacing="0" onclick='showSelect("layerorient_page", "scan_orient")'><tr><td class="labelbtn_left"></td><td class="labelbtn_middle"><#if ('${label}'?length > maxLabelLength)>${'${label}'?substring(0, maxLabelLength)}...<#else>${label}</#if></td><td class="labelbtn_right"></td></tr></table>
</#macro>

<#-- Button for scan orientation pulldown -->
<#macro labelbtn_pulldown_size label>
  <table class="labelbtn" cellspacing="0" onclick='showSelect("layersize_page", "scan_size")'><tr><td class="labelbtn_left"></td><td class="labelbtn_middle"><#if ('${label}'?length > maxLabelLength)>${'${label}'?substring(0, maxLabelLength)}...<#else>${label}</#if></td><td class="labelbtn_right"></td></tr></table>
</#macro>

<#-- Button for advanced scan settings toggle -->
<#macro labelbtn_pulldown_scan_adv_settings label>
  <table class="labelbtn" cellspacing="0" onclick="toggle_advSettingsVisibility('advSettings')"><tr><td class="labelbtn_left"></td><td class="labelbtn_middle"><#if ('${label}'?length > maxLabelLength)>${'${label}'?substring(0, maxLabelLength)}...<#else>${label}</#if></td><td class="labelbtn_right"></td></tr></table>
</#macro>

<#-- Button for advanced scan settings ocr -->
<#macro labelbtn_pulldown_ocr label>
  <table class="labelbtn" cellspacing="0" onclick='showSelect("layerocr_page", "scan_ocr")'><tr><td class="labelbtn_left"></td><td class="labelbtn_middle"><#if ('${label}'?length > maxLabelLength)>${'${label}'?substring(0, maxLabelLength)}...<#else>${label}</#if></td><td class="labelbtn_right"></td></tr></table>
</#macro>

<#-- Button for advanced scan settings format -->
<#macro labelbtn_pulldown_format label>
  <table class="labelbtn" cellspacing="0" onclick='showSelect("layerformat_page", "scan_format")'><tr><td class="labelbtn_left"></td><td class="labelbtn_middle"><#if ('${label}'?length > maxLabelLength)>${'${label}'?substring(0, maxLabelLength)}...<#else>${label}</#if></td><td class="labelbtn_right"></td></tr></table>
</#macro>

<#-- Button for advanced scan settings resolution -->
<#macro labelbtn_pulldown_resolution label>
  <table class="labelbtn" cellspacing="0" onclick='showSelect("layerresolution_page", "scan_res")'><tr><td class="labelbtn_left"></td><td class="labelbtn_middle"><#if ('${label}'?length > maxLabelLength)>${'${label}'?substring(0, maxLabelLength)}...<#else>${label}</#if></td><td class="labelbtn_right"></td></tr></table>
</#macro>
<#-- Button for advanced scan settings color -->
<#macro labelbtn_pulldown_color label>
  <table class="labelbtn" cellspacing="0" onclick='showSelect("layercolor_page", "scan_color")'><tr><td class="labelbtn_left"></td><td class="labelbtn_middle"><#if ('${label}'?length > maxLabelLength)>${'${label}'?substring(0, maxLabelLength)}...<#else>${label}</#if></td><td class="labelbtn_right"></td></tr></table>
</#macro>

<#-- Button with ODBC menu -->
<#macro labelbtn_pulldown label name isRequired>
  <table class="labelbtn" cellspacing="0" onclick='showSelectMenu("${name}", "selectMenu_${name}")'><tr><td class="labelbtn_left"></td><td class="labelbtn_middle"><span class="icon"></span><#if ('${label}'?length > maxLabelLength)>${'${label}'?substring(0, maxLabelLength)}...<#else>${label}</#if><#if isRequired="true"><span class="required">*</span></#if></td><td class="labelbtn_right"></td></tr></table>
</#macro>

<#-- Button with ODBC menu part of a dependent menu set -->
<#macro labelbtn_pulldown_dms label name isRequired>
  <table class="labelbtn" cellspacing="0" onclick='showSelectDependentMenu("${name}", "selectMenu_${name}")'><tr><td class="labelbtn_left"></td><td class="labelbtn_middle"><span class="icon"></span><#if ('${label}'?length > maxLabelLength)>${'${label}'?substring(0, maxLabelLength)}...<#else>${label}</#if><#if isRequired="true"><span class="required">*</span></#if></td><td class="labelbtn_right"></td></tr></table>
</#macro>

<#-- Button for keyboard input -->
<#macro labelbtn label name mode isRequired>
  <#assign onclick><#if mode="write" || mode="writerequired">onclick='showKeyboard("${name}", "Letter", null, null, "${label}")'</#if></#assign>
  <table class="labelbtn" cellspacing="0" ${onclick} ><tr><td class="labelbtn_left"></td><td class="labelbtn_middle"><span class="icon"></span>${label}<#if isRequired="true"><span class="required">*</span></#if></td><td class="labelbtn_right"></td></tr></table>
</#macro>