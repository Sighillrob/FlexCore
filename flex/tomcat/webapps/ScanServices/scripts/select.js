var inputField;
var hiddenInputField;
var selectLayer;
var buttonRows = [];
var selectIndexBegin = 0;
var selectIndexEnd;
var selectScrollUp;
var selectScrollDown;
var currentPage;
var totalPages;
var pageDisplay;
var globalMaxSelectFields = 5;
var browseFolderMap = [];
var browseSelectedFolderValue;
var browseSelectedFolderLabel;
var browseResponseError;


/**
 * showFolderBrowseMenu 
 * Loads the Browse Collection/Folder menu for the first time when touching the Select Folder/Collection field.
 * @param  {String} menuinputid   The id value of the select Folder/Select Collection field.
 * @param  {String} url           The url that gets the selected folder or Collection's children.
 * @param  {String} browseval     The Collection handle or network folder path of the browsing root.
 * @param  {String} responseerror The response error if the Folder or Collection could not be found, or if there was a network or server connection error.
 * @param  {String} upOneLevelLabel The label for browsing up one level.
 */
function showFolderBrowseMenu(menuinputid, url, responseerror, upOneLevelLabel){
  var xmlhttp     = new XMLHttpRequest(),
      browselabel = document.getElementById(menuinputid).value,
      browseval   = document.getElementById("browseLocValue").value,
      url         = url+browseval+"&_"+new Date().getTime();

  //assign global variables to the selected folder's value and label.
  browseSelectedFolderValue = document.getElementById("selectedFolderValue");
  browseSelectedFolderLabel = document.getElementById("selectedFolderLabel");
  browseResponseError = responseerror;

  xmlhttp.open("GET", url, true);
  xmlhttp.onreadystatechange=function(){
    if (xmlhttp.readyState == 4){
      if(xmlhttp.status == 200){
        var xmlDoc = StringToXML(xmlhttp.responseText);
        browseFolderMap.push({location:browseval, parentlocation:browseval, parentlabel:browselabel}); //add the browsing root to the folder data.
        parseFolderData(xmlDoc, browseval, browselabel, upOneLevelLabel); //parse returned data an add to menu.
        showSelectMenu(menuinputid,"selectMenu_folderPath"); //show menu...
      
      //Folder/Collection not found OR connection error...
      }else{
        alert(browseResponseError);
      }

    }
  }
  xmlhttp.send();
}


/**
 *  parseFolderData
 *  takes the data from the folder children listing resource and makes buttons in the menu.
 *  @param {XML}    response    The xml response for folders (Format: <folders><folder></folder></folders>)
 *  @param {String} browseval   The selected folder's value (either Collection handle or full unc path)
 *  @param {String} browselabel The selected folder's label (either Collection title or unc folder name)
 *  @param {String} upOneLevelLabel The label for browsing up one level.
 */
function parseFolderData(response, browseval, browselabel, upOneLevelLabel){
  var parentInfo     = getParentFolderInfo(browseval),
      uplevellabel   = "'"+upOneLevelLabel+"'",
      optionshtml    = '',
      currentvaljs   = "'"+escape(browseval)+"'",
      currentlabeljs = "'"+escape(browselabel)+"'",
      parentvaljs    = "'"+parentInfo.parentlocation+"'",
      parentlabeljs  = "'"+parentInfo.parentlabel+"'",
      rootLocValue   = document.getElementById("rootfolderLocation").value,
      upbutton       = '<tr class="upFolderBtn"><td class="buttonLeft"></td><td class="buttonMiddle" onclick="loadFolderOptions(this,'+parentvaljs+','+parentlabeljs+','+uplevellabel+')">'+upOneLevelLabel+'<input type="hidden" value="'+parentInfo.parentlocation+'"></td><td class="buttonRight"></td></tr>',
      selectFolderBtn = document.getElementById("selectFolderBtn"),
      selectFolderBtnTrigger = document.getElementById("selectFolderBtnTrigger");
  
  //clear select Folder button read/write state in class attribute...
  removeClass(selectFolderBtn, "disabled");
  selectFolderBtnTrigger.onclick = function(){selectFolder(this)}
  //if any subfolder exist...
  if(response.childNodes[0].childNodes.length > 0){
    var x2js = new X2JS({arrayAccessFormPaths : ["folders.folder"]}),
        data = x2js.xml2json(response); //turn xml into json object
    
    data = data.folders.folder;

    var x2js2 = new X2JS({emptyNodeForm : "object", arrayAccessFormPaths : ["folders"]}),
        data2 = x2js2.xml2json(response),
        access = data2.folders._access;

    var length = data.length;
    
    //add in the folder navigate up button if this is not the root starting folder...
    if(browseval != rootLocValue){
      optionshtml = optionshtml+upbutton;
    }

    //create folder buttons...
    for(i=0; i < length; i++){
      var optlabel = unescape(data[i]["_label"]),
          optvalue = data[i]["_value"];
      optionshtml=optionshtml+'<tr class="buttonRow"><td class="buttonLeft"></td><td class="buttonMiddle" onclick="loadFolderOptions(this,'+currentvaljs+','+currentlabeljs+','+uplevellabel+')">'+optlabel+'<input type="hidden" value="'+optvalue+'"></td><td class="buttonRight"></td></tr>';
    }

    // enable or disable "Select Folder" button.
    if(access === "read"){
      addClass(selectFolderBtn, "disabled");
      selectFolderBtnTrigger.onclick = function(){};
    }



  //otherwise, just show the up button.
  }else{
    var x2js2 = new X2JS({emptyNodeForm : "object", arrayAccessFormPaths : ["folders"]}),
        data2 = x2js2.xml2json(response),
        access = data2.folders._access;

    // enable or disable "Select Folder" button.
    if(access === "read"){
      addClass(selectFolderBtn, "disabled");
      selectFolderBtnTrigger.onclick = function(){};
    }


    optionshtml = upbutton;
  }

  //put in options...
  document.getElementById("folderpath_options").innerHTML = optionshtml;
}


/**
 * loadFolderOptions
 * Loads the data for the Network folder / Collection children.
 * @param {Object} element     A reference to the button of the child folder being opened (a <td>).
 * @param {String} parentval   The escaped value of the parent folder (either a collection handle or a network folder path)
 * @param {String} parentlabel The label of the parent folder (either a Collection title or network folder name)
 * @param  {String} upOneLevelLabel The label for browsing up one level.
 */
function loadFolderOptions(element, parentval, parentlabel, upOneLevelLabel){
  var parentval   = unescape(parentval),
      parentlabel = unescape(parentlabel),
      uplevellabel = unescape(upOneLevelLabel),
      browselabel = (hasClass(element.parentNode, "upFolderBtn") === true) ? parentlabel : trimAnfangEnde(element.childNodes[0].nodeValue),
      browseval   = element.childNodes[1].value,
      urlbase     = document.getElementById("browseurlbase").value,
      url         = urlbase+browseval+"&_"+new Date().getTime(),
      folderpath  = document.getElementById("selectMenu_folderPath_currentPath"),
      xmlhttp     = new XMLHttpRequest();
  xmlhttp.open("GET", url, true);
  xmlhttp.onreadystatechange=function(){
    if (xmlhttp.readyState == 4){
      //success..
      if(xmlhttp.status == 200){
        xmlDoc = StringToXML(xmlhttp.responseText);
        browseSelectedFolderValue.value = browseval;
        browseSelectedFolderLabel.value = browselabel;
        updateBrowseFolderMap(browseval, parentval, parentlabel);
        folderpath.innerHTML = browselabel;
        parseFolderData(xmlDoc, browseval, browselabel, uplevellabel); //parse returned data and add locations to menu.
        updateSelectMenu();
      
      //Folder/Collection not found OR connection error...
      }else{
        alert(browseResponseError);
      }
    }
  }

  xmlhttp.send();
}


/**
 * updateBrowseFolderMap
 * Adds an item to the browse folder object array.  The array browseFolderMap stores a folder path or collection handle along with it's parent 
 * collection handle or folder path.  Example: [{location:'Collection-123', parentlocation:'Collection-124', parentlabel:'My Collection'}]
 * @param  {String} currval     The selected folder's value (either a Collection handle or a Network Folder path)
 * @param  {String} parentval   The selected folder's parent value (either a Collection handle or a Network Folder path)
 * @param  {String} parentlabel The selected folder's parent label (either a Collection title or a Network Folder name)
 */
function updateBrowseFolderMap(currval, parentval, parentlabel){
  var length = browseFolderMap.length,
      isMatch = false;

  for (i=0; i<length; i++){
    if(browseFolderMap[i].location == currval){
      isMatch = true;
      break;
    }
  }

  if(isMatch == false){
    browseFolderMap.push({location:currval, parentlocation:parentval, parentlabel:parentlabel});
  }

}


/**
 * getParentFolderInfo
 * gets information about the current folder or Collection: its handle/path, 
 * its parent handle/path, and its parent Collection title/folder name
 * @param  {String} currval The currently selected folder's Collection handle or Network Folder path.
 */
function getParentFolderInfo(currval){
  var length = browseFolderMap.length;
  for (i=0; i<length; i++){
    if(browseFolderMap[i].location == currval){
      return browseFolderMap[i];
    }
  }
}


/**
 * selectFolder
 * Selects the currently network folder or Collection
 */
function selectFolder(){
  inputField.value = document.getElementById("selectedFolderLabel").value;
  hiddenInputField.value = document.getElementById("selectedFolderValue").value;
  selectLayer.className = "selectLayerInactive";
  var inputField_tr = inputField.parentNode.parentNode;
}



function showODBCMenu(menuinputid, menulabel, url){
  var menuoptionsurl = url+"&_"+new Date().getTime(),
      xmlhttp=new XMLHttpRequest();

  xmlhttp.open("GET", url, true);

  xmlhttp.onreadystatechange=function(){

    if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
      var valwithoutquotes = xmlhttp.responseText.replace(/"/g, ""),
          menuoptions      = valwithoutquotes.split("||"),
          menuoptions2     = xmlhttp.responseText.split("||"),
          optionhtml       = "";

      for(i=0; i < menuoptions.length; i++){
        var option = menuoptions[i].split(":"),
            value = option[0],
            label = option[1];

        optionhtml=optionhtml+'<tr class="buttonRow"><td class="buttonLeft"></td><td class="buttonMiddle" onclick="selectOption(this)">'+label+'<input value="'+value+'" type="hidden"></td><td class="buttonRight"></td></tr>';
      }

      document.getElementById("selectMenuODBC_label").innerHTML = menulabel;
      document.getElementById("odbcmenuoptions").innerHTML = optionhtml;

      showSelectMenu(menuinputid,"selectODBCMenu");

    }
  }

  xmlhttp.send();

}

function toggle_advSettingsVisibility(thisClass){
  var trs = getElementsByClassname(thisClass, "TR");
  for (var i=0; i < trs.length; i++) {
    if (trs[i].style.visibility == 'visible')
      trs[i].style.visibility = 'hidden';
    else
      trs[i].style.visibility = 'visible';   
  }
}


function showSelect(pSelectLayerId, pInputFieldId){
  //clear settings...
  if(selectIndexBegin>0){
  	selectIndexBegin = 0;
  }

	if(buttonRows.length > 0){
    buttonRows = [];
  }

  //set settings...
	selectIndexEnd = selectIndexBegin + globalMaxSelectFields;
	selectLayer = document.getElementById(pSelectLayerId);
	inputField = document.getElementById(pInputFieldId);
	hiddenInputField = inputField.parentNode.childNodes[3];
	getButtonRowsRecursive(selectLayer);

  	//pageDisplay= document.getElementById("selectPage");
    //The next line gives unique id's to avoid the phantom scroll bar
  	pageDisplay = document.getElementById("selectPage_"+pInputFieldId)? document.getElementById("selectPage_"+pInputFieldId): document.getElementById("selectPage");
	if(selectIndexEnd > buttonRows.length)
	{
		selectIndexEnd = buttonRows.length;
	}

	markSelectedButtonRow();
	initVisibility(buttonRows);

	selectLayer.className = "selectLayer";
}



function showSelectMenu(menuInputFieldId, selectLayerId){
  //clear settings...
  if(selectIndexBegin>0){
    selectIndexBegin = 0;
  }

  if(buttonRows.length > 0){
    buttonRows = [];
  }

  //set settings...
  selectIndexEnd = selectIndexBegin + globalMaxSelectFields;
  inputField = document.getElementById(menuInputFieldId);
  hiddenInputField = inputField.parentNode.getElementsByTagName("input")[1];
  selectLayer = document.getElementById(selectLayerId);
  getButtonRowsRecursive(selectLayer);
  pageDisplay= findByClassName("selectPage");

  if(selectIndexEnd > buttonRows.length){
    selectIndexEnd = buttonRows.length;
  }

  markSelectedButtonRow();
  initVisibility(buttonRows);

  selectLayer.className = "selectLayer";
}



function showSelectDependentMenu(menuInputFieldId, selectLayerId){
  inputField = document.getElementById(menuInputFieldId);

  //open the menu if there is no data mapping error 
  if(hasClass(inputField.parentNode, "dms-mapping-error") === false){

    //load buttons from dmFieldData array object
    loadSelectDMOptionButtons(menuInputFieldId, selectLayerId);

    //clear settings...
    if(selectIndexBegin>0){
      selectIndexBegin = 0;
    }

    if(buttonRows.length > 0){
      buttonRows = [];
    }

    //set settings...
    selectIndexEnd = selectIndexBegin + globalMaxSelectFields;
    
    hiddenInputField = inputField.parentNode.getElementsByTagName("input")[1];
    selectLayer = document.getElementById(selectLayerId);
    getButtonRowsRecursive(selectLayer);
    pageDisplay= findByClassName("selectPage");

    if(selectIndexEnd > buttonRows.length){
      selectIndexEnd = buttonRows.length;
    }

    markSelectedButtonRow();
    initVisibility(buttonRows);

    selectLayer.className = "selectLayer";
  }
}



function updateSelectMenu(){

  //clear settings...
  if(selectIndexBegin>0){
    selectIndexBegin = 0;
  }

  if(buttonRows.length > 0){
    buttonRows = [];
  }

  //set settings...
  selectIndexEnd = selectIndexBegin + globalMaxSelectFields;
  getButtonRowsRecursive(selectLayer);

  if(selectIndexEnd > buttonRows.length){
    selectIndexEnd = buttonRows.length;
  }

  initVisibility(buttonRows);


}



function initVisibility(pButtonRows)
{
	findScrollSelectUpRecursive(selectLayer);
	findScrollSelectDownRecursive(selectLayer);
	var selectScrollDownDisabled = findByClassName("selectScrollDownDisabled"),
      selectScrollUpDisabled = findByClassName("selectScrollUpDisabled");

  if(pButtonRows.length < globalMaxSelectFields){
    pageDisplay.style.display="none";
    totalPages = 1;
  }else if(pButtonRows.length >= globalMaxSelectFields){
    pageDisplay.style.display="";
    totalPages = Math.ceil(pButtonRows.length / globalMaxSelectFields);
  }

  currentPage= (selectIndexBegin/globalMaxSelectFields) + 1;

  pageDisplay.innerHTML =  currentPage + "/" + totalPages;

  //show arrows if there is more than one page...
  if(totalPages > 1){

  	if(selectIndexBegin == 0){
  		selectScrollUp.style.display = "none";
  		selectScrollUpDisabled.style.display = "block";
  	}
  	else{
  		selectScrollUp.style.display = "block";
  		selectScrollUpDisabled.style.display = "none";
  	}

  	if(selectIndexEnd >= pButtonRows.length){
  		selectScrollDown.style.display = "none";
  		selectScrollDownDisabled.style.display = "block";
  	}
  	else{
  		selectScrollDown.style.display = "block";
  		selectScrollDownDisabled.style.display = "none";
  	}

  //is a single page, hide arrows...
  }else{
    selectScrollUp.style.display = "none";
    selectScrollUpDisabled.style.display = "none";
    selectScrollDown.style.display = "none";
    selectScrollDownDisabled.style.display = "none";
  }

	for(var i = 0; i < pButtonRows.length; i++)
	{
		if((i >= selectIndexBegin) && (i < selectIndexEnd))
		{
			pButtonRows[i].style.display = ""; //used to be "tablerow" (doesn't work in Firefox)
		}
		else
		{
			pButtonRows[i].style.display = "none";
		}
	}

}


function closeSelect(selectmenu){
  selectLayer.className = "selectLayerInactive";
  //hide buttons
  findByClassName("selectScrollUp").style.display="none";
  findByClassName("selectScrollUpDisabled").style.display="none";
  findByClassName("selectScrollDown").style.display="none";
  findByClassName("selectScrollDownDisabled").style.display="none";
}


function scrollSelectDown()
{
	selectIndexBegin += globalMaxSelectFields;
	selectIndexEnd += globalMaxSelectFields;
	initVisibility(buttonRows);
}


function scrollSelectUp()
{
	selectIndexBegin -= globalMaxSelectFields;
	selectIndexEnd -= globalMaxSelectFields;
	initVisibility(buttonRows);
}


function selectOption(element)
{
	inputField.value = trimAnfangEnde(element.childNodes[0].nodeValue);
	hiddenInputField.value = element.childNodes[1].value;
	selectLayer.className = "selectLayerInactive";
  var inputField_tr = inputField.parentNode.parentNode;

	//if this field is a primary key for an autofill profile...
  if(hasClass(inputField_tr, "af-primary")){
    loadAFPMappedFields(hiddenInputField);
  }else if(hasClass(inputField_tr, "dm-field")){
    resetDependentMenus(hiddenInputField);
  }

}


function markSelectedButtonRow()
{

	for(var i = 0; i < buttonRows.length; i++)
	{
		var cellInputField = trimAnfangEnde(buttonRows[i].getElementsByTagName('td')[1].childNodes[0].nodeValue);
		//var cellInputField = trimAnfangEnde(buttonRows[i].childNodes[0].childNodes[0].nodeValue);
		if(inputField.value == cellInputField)
		{
			buttonRows[i].className = "buttonRowActive";
		}
		else
		{
			buttonRows[i].className = "buttonRow";
		}
	}
}


function getButtonRowsRecursive(knoten)
{

	//if(knoten.className == "buttonRow" || knoten.className == "buttonRowActive")
	if((hasClass(knoten, "buttonRow") === true || hasClass(knoten, "buttonRowActive") === true) && hasClass(knoten.parentNode.parentNode, "buttons") === true){
      buttonRows.push(knoten);
      return;
	}

	if(knoten.hasChildNodes()){
        for (var i = 0; i < knoten.childNodes.length; i++)
        {
            knotenneu = knoten.childNodes[i];
            getButtonRowsRecursive(knotenneu); // Rekursion
        }
    }
}


function findScrollSelectUpRecursive(knoten)
{
	if(knoten.className == "selectScrollUp")
	{
		selectScrollUp = knoten;
		return;
	}

	if(knoten.hasChildNodes())
	{
        for (var i = 0; i < knoten.childNodes.length; i++)
        {
            knotenneu = knoten.childNodes[i];
            findScrollSelectUpRecursive(knotenneu); // Rekursion
        }
    }
}


function findScrollSelectDownRecursive(knoten)
{
	if(knoten.className == "selectScrollDown")
	{
		selectScrollDown = knoten;
		return;
	}

	if(knoten.hasChildNodes())
	{
        for (var i = 0; i < knoten.childNodes.length; i++)
        {
            knotenneu = knoten.childNodes[i];
            findScrollSelectDownRecursive(knotenneu); // Rekursion
        }
    }
}


function trimAnfangEnde(str)
{
	return str.replace(/^\s+/g, '').replace(/\s+$/g, '');
}


/*
 * Finds a single classname match on a list of child elements under the selectLayer element node.
 * Note:does not work when an element has multiple classnames. (i.e. class="one two three")
 */
function findByClassName(classname){
  var selectChildren = selectLayer.getElementsByTagName("*");

  for (var i=0; i<selectChildren.length; i++){
    if(selectChildren[i].className == classname){
      return selectChildren[i];
    }
  }

}

  // dmFieldData info for each menu:
  //   "fieldname"     : fieldname, // the menu's property name in DocuShare.
  //   "menufield"     : dmfields[i], //the menu html field element (hidden in form)
  //   "menulabelfield": previousElementSibling(dmfields[i]), //the menu html label field element (for inserting the label once selected)
  //   "parentmenu"    : null, // the menu's parent menu element in the form.
  //   "setname"       : setname, // the name of the dependent menu set.
  //   "menuorder"     : menuorder, // the menu's order in the dependent set (primary=0, 1st dependent=1, 2nd dependent=2)
  //   "menuagent"     : menuagent, // the menu agent associated with this property
  //   "dependency"    : dependency // where the menu options are for each parent menu value.

/**
 * loadSelectDMOptionButtons
 * loads the correct options into the select menu depending on the parent menu's selected value.
 * @param  {String} menuname - name of the menu DocuShare property.
 * @param  {String} selectMenuId - id value of the select menu.
 */
function loadSelectDMOptionButtons(menuname, selectMenuId){

  var selectmenu = document.getElementById(selectMenuId),
      menudata = {};

  //1. lookup dmFieldData for this field...
  for(var i=0; i<dmFieldData.length; i++){
    if(dmFieldData[i].fieldname == menuname){
      menudata = dmFieldData[i];
      break;
    }
  }

  //2. lookup & load options based on the value of the parent menu.
  
  var depends = menudata.dependency.depend,
      depend = {},
      options = {},
      optionshtml = "";

  //if we have a dependent menu...
  if(menudata.menuorder > 0){
    //find the associated depend element based on the parent menu's value.
    for (var i=0; i< depends.length; i++){
      if(depends[i]._keyValue == menudata.parentmenu.value){
        depend = depends[i];
        break;
      }
    }

    //get the options
    options = depend.options.option
    for (var i=0; i< options.length; i++){
      optionshtml += '<tr class="buttonRow"><td class="buttonLeft"></td><td class="buttonMiddle" onclick="selectOption(this)">'+options[i]._label+'<input value="'+options[i]._value+'" type="hidden"></td><td class="buttonRight"></td></tr>';
    }


  //if we have a primary dependent menu...
  }else{
    //the options for a primary menu are taken from it's direct dependent menu's <depend> elements keyLabel and keyValue attributes.
    for (var i=0; i< depends.length; i++){
      optionshtml += '<tr class="buttonRow"><td class="buttonLeft"></td><td class="buttonMiddle" onclick="selectOption(this)">'+depends[i]._keyLabel+'<input value="'+depends[i]._keyValue+'" type="hidden"></td><td class="buttonRight"></td></tr>';
    }
  }

  //3. find the button listing element (table @class = buttons)
  var optionslist = selectmenu.getElementsByTagName("TABLE")[0];
  optionslist.innerHTML = optionshtml;

}