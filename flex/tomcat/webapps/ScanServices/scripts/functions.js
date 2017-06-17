function HideContent(d)
{
	if(d.length < 1) { return; }
	document.getElementById(d).style.display = "none";
}



function ShowContent(d)
{
	if(d.length < 1) { return; }
	document.getElementById(d).style.display = "block";
}



function ReverseContentDisplay(d)
{
	if(d.length < 1) { return; }
	if(document.getElementById(d).style.display == "none") { document.getElementById(d).style.display = "block"; }
	else { document.getElementById(d).style.display = "none"; }
}



function checkFields(message)
{
	var inputFields = getElementsByClassname("checkEmpty", "input");

	for(var i = 0; i < inputFields.length; i++)
	{
		if(inputFields[i].value == "" || inputFields[i].value == null)
		{
			myAlert(message);
			return false;
		}
	}

	var textareas = getElementsByClassname("checkEmpty", "textarea");

	for(var i = 0; i < textareas.length; i++)
	{
		if(textareas[i].value == "" || inputFields[i].value == null)
		{
			myAlert(message);
			return false;
		}
	}

	ShowContent('waitingDiv');
	return true;
}


function myAlert(message)
{
	box = document.getElementById("alertBox");
	innerBox = document.getElementById("alertMessage");
	innerBox.innerHTML = glCoder.decode(message);
	box.className = "alertBoxVisible";
}


function closeAlert()
{
	box = document.getElementById("alertBox");
	box.className = "alertBox";
}


function getElementsByClassname(className, tag){
	var tagElements = document.getElementsByTagName(tag);
	var retElements = new Array();

	for(var i = 0; i < tagElements.length; i++){

		var hasClass = new RegExp(' ' + className + ' ').test(' ' + tagElements[i].className + ' ');

		if(hasClass === true){
		  retElements.push(tagElements[i]);
		}

	}

	return retElements;
}


function openTag(tagname, properties)
{
	var tag = "";
	tag += "<";
	tag += tagname;

	for(var attrName in properties)
	{
		tag += " ";
		tag += attrName;
		tag += "=\"";
		tag += properties[attrName];
		tag += "\"";
	}

	tag += ">";

	alert("tag: " + tag);

	return tag;
}


function closeTag(tagname)
{
	return "</" + tagname + ">";
}


function validateRequiredFields(){

  var inputs = getElementsByClassname("required","input"),
      noError = true;

  for (var i=0; i<inputs.length; i++){
    //remove any errors if those fields are now filled in.
    if(hasClass(inputs[i].parentNode, "error") && inputs[i].value != ""){
      toggleClass(inputs[i].parentNode, "error");
    }
    //check for new empty required fields...
    if(hasClass(inputs[i], "required") === true && inputs[i].value == ""){
      addClass(inputs[i].parentNode, "error");
      noError = false;
    }
  }

  return noError;
}


/**
 * toggleClass
 * source: http://www.sitepoint.com/5-useful-functions-missing-in-javascript/
 * @param {Object} element
 * @param {Object} className
 */
function toggleClass(element, className) {
  var classes = element.className.split(" ");
  var length = classes.length;

  for(var i = 0; i < length; i++) {
    if (classes[i] == className) {
      classes.splice(i, 1);
      break;
    }
  }

  // The className is not found
  if (length == classes.length){
    classes.push(className);
  }

  element.className = classes.join(" ");
}


/**
 * hasClass
 * source http://toddmotto.com/creating-jquery-style-functions-in-javascript-hasclass-addclass-removeclass-toggleclass/
 * @param {Object} elem
 * @param {Object} className
 */
function hasClass(elem, className){
  return new RegExp(' ' + className + ' ').test(' ' + elem.className + ' ');
  //return (' ' + elem.className + ' ').indexOf(' ' + className + ' ') > -1;
}


/**
 * addClass
 * @param {Object} element - the element to have a classname removed.
 * @param {Object} className - the classname to be removed.
 */
function addClass(element, className){
  var classes = element.className.split(" ");
  classes.push(className);
  element.className = classes.join(" ");
}


/**
 * removeClass
 * Removes a given classname
 * @param {Object} element - the element to have a classname removed.
 * @param {Object} className - the classname to be removed.
 */
function removeClass(element, className){
  var classes = element.className.split(" ");
  var length = classes.length;

  for(var i = 0; i < length; i++) {
    if (classes[i] == className) {
      classes.splice(i, 1);
      break;
    }
  }

  element.className = classes.join(" ");
}

/**
 * previousElementSibling
 * gets the previous element node (skips text nodes)
 * @param {Object} elem - the element of reference which a previous sibling element is sought.
 */
function previousElementSibling( elem ) {
  do{
    elem = elem.previousSibling;
  }while( elem && elem.nodeType !== 1 );
  return elem;
}




/**
 * initAFPPrimaryMenus
 * loads all the Autofill profile mapped field values when existing primary keys are menus
 */
function initAFPPrimaryMenus(){
  var afp_primaryfields = getElementsByClassname("afp-primary-field", "input"),
      afp_mappedfields = getElementsByClassname("afp-mapped-field", "input"),
      afpname = document.getElementById("afpname").value,
      doctype = document.getElementById("docType").value,
      buttonId = document.getElementById("buttonId").value,
      afpurl = "/ScanServices/EIPServer/ValidateMetadata?documentType="+doctype+"&dbAgent="+afpname+"&buttonId="+buttonId,
      length = afp_primaryfields.length,
      emptyprimaryfields = false;

  if(length > 0){
    for(i=0; i<length; i++){
      var value = afp_primaryfields[i].value,
          name = afp_primaryfields[i].name;
      if(value != ""){
        afpurl = afpurl+"&metaName[]="+name+"&metaValue[]="+value;
      }else{
        emptyprimaryfields = true;
      }
    }
  }

  // if all primary fields have been filled in, request the data for mapped fields.  Otherwise,
  // the end user will have to fill them in.
  if(emptyprimaryfields === false){
    requestAFPValues(afpurl, afp_primaryfields, afp_mappedfields);
  }

}


/**
 * loadAFPMappedFields
 * prepares the data url to retrieve mapped fields after a primary key value has been entered via the keyboard.
 * @param {Object} primarykeyfield - a reference to the primary key input field filled in by the keyboard.
 */
function loadAFPMappedFields(primarykeyfield){
  var inputName = primarykeyfield.name,
      inputVal = primarykeyfield.value,
      afpname = document.getElementById("afpname").value,
      doctype = document.getElementById("docType").value,
      buttonId = document.getElementById("buttonId").value,
      afpurl = "/ScanServices/EIPServer/ValidateMetadata?documentType="+doctype+"&dbAgent="+afpname+"&buttonId="+buttonId;

  if(inputVal != ""){
    afpurl = afpurl+"&metaName[]="+inputName+"&metaValue[]="+inputVal;
    loadAFPValues(primarykeyfield, afpurl);
  }
}


/**
 * loadAFPValues
 * looks at the value of the selected primary key, looks for the values of other primary keys,
 * and if they are all filled in, submits an ajax call to retrieve the values of mapped fields.
 * Handles connection and type errors as well as empty primary key fields.
 * @param {Object} primarykeyfield - a reference to the primary key input field.
 * @param {String} afpurl - the ajax response in XML.
 */
function loadAFPValues(primarykeyfield, afpurl){
  //discover any other primary key fields.
  var inputName = primarykeyfield.name,
      afp_primaryfields = getElementsByClassname("afp-primary-field", "input"),
      afp_mappedfields = getElementsByClassname("afp-mapped-field", "input"),
      length = afp_primaryfields.length,
      emptyprimaryfields = false;

  //if other primary fields exist...
  if(length > 1){
    for(i=0; i<length; i++){
      var value = afp_primaryfields[i].value,
          name = afp_primaryfields[i].name;

      if(name != inputName){
        if(value != ""){
          afpurl = afpurl+"&metaName[]="+name+"&metaValue[]="+value;
        }else{
          emptyprimaryfields = true;
        }
      }
    }
  }

  //if all primary fields have been filled in, request the data for mapped fields.
  if(emptyprimaryfields === false){
    requestAFPValues(afpurl, afp_primaryfields, afp_mappedfields);
  }
}

function StringToXML(oString) {
  //code for IE
//  if (window.ActiveXObject) {
//     var oXML = new ActiveXObject("Microsoft.XMLDOM"); oXML.loadXML(oString);
//     return oXML;
//   }
   // code for Chrome, Safari, Firefox, Opera, etc.
//   else {
    var parser = new DOMParser();    
    var newval = parser.parseFromString(oString, "text/xml");
    return newval;

//   }
}

/**
 *  requestAFPValues
 *  retrieves the values of Autofill profile mapped fields from the ODBC data source.
 */
function requestAFPValues(afpurl, afp_primaryfields, afp_mappedfields){

  setAFPFieldState(afp_mappedfields, "pending");
  setAFPFieldState(afp_primaryfields, "pending");

  var xmlhttp=new XMLHttpRequest();
  xmlhttp.open("GET", afpurl, true);

  xmlhttp.onreadystatechange=function(){
    if (xmlhttp.readyState == 4){
      //if good response...
      if(xmlhttp.status == 200){
         //if values were found...
        xmlDoc = StringToXML(xmlhttp.responseText);
        if(xmlDoc.childNodes[0].childNodes.length > 0){
          populateAFPValues(xmlDoc);
          setTimeout(function(){
             setAFPFieldState(afp_mappedfields, "normal");
             setAFPFieldState(afp_primaryfields, "afp-primary-mapping-success");
          },500);

        //if no values were found...
        }else{
          removeAFPValues();
          setAFPFieldState(afp_mappedfields, "normal");
          setAFPFieldState(afp_primaryfields, "afp-primary-mapping-error");
        }

      //if failure...
      }else{
        setAFPFieldState(afp_mappedfields, "normal");
        setAFPFieldState(afp_primaryfields, "afp-primary-general-error");
      }
    }
  }
  xmlhttp.send();
}



/**
 * populateAFPValues
 * takes a valid response and uses the data to populate the mapped autofill fields.
 * @param {Object} response - the ajax response in XML.
 *
 * response XML looks like this:
 * <autofills>
 *   <autofill key='propertyname1' value='property1value'>
 *   <autofill key='propertyname2' value='property2value'>
 * </autofills>
 *
 */
function populateAFPValues(response){
  var x2js = new X2JS({arrayAccessFormPaths : ["autofills.autofill"]});
  var data = x2js.xml2json(response); //turn xml into json object
  data = data.autofills.autofill;
  var length = data.length;

  for(i=0; i<length; i++){
    var field = document.getElementsByName(data[i]["_key"])[0],
        value = data[i]["_value"],
        field_td = field.parentNode;
    field.value = value;
    if(hasClass(field_td,"inputdisabled")){
      var disabledlabel = previousElementSibling(field);
      disabledlabel.innerHTML = value;
    }
  }
}


/**
 * removeAFPValues
 * if a map fails, then remove the values (if any) from the mapped autofill fields.
 */
function removeAFPValues(){
  var afp_mappedfields = getElementsByClassname("afp-mapped-field", "input"),
    fieldlength = afp_mappedfields.length;

  for(i=0; i<fieldlength; i++){
     afp_mappedfields[i].value = "";
     var mappedfield_td = afp_mappedfields[i].parentNode;

    if(hasClass(mappedfield_td,"inputdisabled")){
      var disabledlabel = previousElementSibling(afp_mappedfields[i]);
      disabledlabel.innerHTML = "";
    }
  }
}


/**
 * setAFPMappedFieldState
 * @param {Object} fields - an array of fields to have their className changed.
 * @param {Object} state - "pending", "afp-primary-mapping-error", "afp-primary-mapping-success", "afp-primary-general-error"
 */
function setAFPFieldState(fields, state){
  for(i=0;i<fields.length; i++){
    removeClass(fields[i].parentNode, "pending");
    removeClass(fields[i].parentNode, "afp-primary-mapping-error");
    removeClass(fields[i].parentNode, "afp-primary-mapping-success");
    removeClass(fields[i].parentNode, "afp-primary-general-error");
    if(state != "normal"){
      addClass(fields[i].parentNode, state);
    }
  }
}


/**
 * loadCollectionLabel
 * loads the Collection title from the data source into the 'Select a Collection' field.
 * @param  {String} url - The url resource that returns the title of a Collection given its handle.
 */
function loadCollectionLabel(url){

  var xmlhttp=new XMLHttpRequest(),
      labelfield = document.getElementById("browseLocLabel"),
      selectedFolderLabel = document.getElementById("selectedFolderLabel"),
      selectmenu_browseloc_label= document.getElementById("selectMenu_folderPath_currentPath");

  xmlhttp.open("GET", url, true);

  xmlhttp.onreadystatechange=function(){
    if (xmlhttp.readyState == 4){
      //if good response...
      if(xmlhttp.status == 200){
         //if values were found...
        xmlDoc = StringToXML(xmlhttp.responseText);
        if(xmlDoc.childNodes[0]){
          var x2js = new X2JS({arrayAccessFormPaths : ["collection"]}),
              data = x2js.xml2json(xmlDoc); //turn xml into json object

          labelfield.value = data.collection._label;
          selectmenu_browseloc_label.innerHTML = data.collection._label;
          selectedFolderLabel.value = data.collection._label;

          setTimeout(function(){
           removeClass(labelfield.parentNode, "folderloading");
          },500);

        //if no values were found (DocuShare Search Error)...
        }else{
          removeClass(labelfield.parentNode, "folderloading");
          addClass(labelfield.parentNode, "folderloadingerror");
        }

      //if failure (Connection error)...
      }else{

      }
    }
  }
  xmlhttp.send();
}


/**
 * convertDependentMenuData
 * converts the string of xml for the dependent menu data to json for javascript consumption.
 * @param  {Object} dmProfiles - the xml data for each dependent menu set (a.k.a profile) in an object literal format.
 *                               i.e. {'profile1' : '<xmldata>, 'profile2' : '<xmldata>'}
 */
function convertDependentMenuData(dmProfiles){
  for (var key in dmProfiles){
    var xmlDoc = StringToXML(dmProfiles[key]); //turn data into xml document...
    //var x2js = new X2JS({arrayAccessForm : "property"});
    //var data = x2js.xml2json(xmlDoc);
    var xotree = new XML.ObjTree();
    xotree.attr_prefix = '_';
    xotree.force_array = [ "MenuAgent", "option", "dependency", "depend" ]
    var tree = xotree.parseDOM(xmlDoc);
    dmProfiles[key] = tree;
  }

}


/**
 * loadDependentMenuValues
 * Loads the correct labels for the dependent menus given their value, set name, order, and associated menugent values.
 * @param  {JSON} dmProfiles - the list of dependent menu sets and their menu values in a JSON format.
 */
function loadDependentMenuValues(dmProfiles){
  var dmfields = getElementsByClassname("dependentmenu", "input"),
      fieldlength = dmfields.length;

  //collect data for each dependent menu field in the dependent menu set (and put it into an array - dmFieldData)...
  for(i=0; i<fieldlength; i++){

    var fieldval = dmfields[i].value,
        fieldname = dmfields[i].getAttribute("name"),
        menuorder = parseInt(dmfields[i].getAttribute("dm-order"), 10),
        menuagent = dmfields[i].getAttribute("dm-menuagent"),
        setname = dmfields[i].getAttribute("dm-set"),
        menuagents = dmProfiles[setname]['#document'].EditDependentMenuAgents.MenuAgent,
        setsize = dmProfiles[setname]['#document'].EditDependentMenuAgents.MenuAgent.length,
        menuagent = dmProfiles[setname]['#document'].EditDependentMenuAgents.MenuAgent[menuorder],
        dependencies = menuagent.dependency,
        dependencysize = (dependencies) ? menuagent.dependency.length : null,
        dependency = null;

    //get the dependency for the specific dependent menu set...
    if(dependencysize){ //does the menu property have a dependency (if not, its a primary menu)
      for(var d=0; d <= dependencysize; d++){
        if(menuagent.dependency[d] && menuagent.dependency[d]._profile == setname){
          dependency = menuagent.dependency[d];
        }
      }

    //we are a primary menu! We get our options from our 1st dependent menu's <MenuAgent> <dependency> <depend> elements...
    }else{
      var primarydependencies = dmProfiles[setname]['#document'].EditDependentMenuAgents.MenuAgent[1].dependency;
      for(var d=0; d <= primarydependencies.length; d++){
        if(primarydependencies[d] && primarydependencies[d]._profile == setname){
          dependency = primarydependencies[d];
        }
      }

    }

    //create an entry in the dmFieldData array object for this field and all its useful data.
    dmFieldData.push({
      "fieldname"     : fieldname, // the menu's property name in DocuShare.
      "menufield"     : dmfields[i], //the menu html field element (hidden in form)
      "menulabelfield": previousElementSibling(dmfields[i]), //the menu html label field element (for inserting the label once selected)
      "parentmenu"    : null, // the menu's parent menu element in the form.
      "setname"       : setname, // the name of the dependent menu set.
      "menuorder"     : menuorder, // the menu's order in the dependent set (primary=0, 1st dependent=1, 2nd dependent=2)
      "menuagent"     : menuagent, // the menu agent associated with this property
      "dependency"    : dependency // where the menu options are for each parent menu value.
    });

  }

  //Now that we have the data (stored in dmFieldData), lets find the label for each dependent menu property...
  for(i=0; i<fieldlength; i++){

    var menuname   = dmfields[i].getAttribute("name"),
        mydata     = {},
        myvalue    = "",
        mylabel    = "",
        infolength = dmFieldData.length;

    //1. lookup dmFieldData for this field...
    for(var f=0; f<infolength; f++){
      if(dmFieldData[f].fieldname == menuname){
        mydata = dmFieldData[f];
        myvalue = mydata.menufield.value;
        break;
      }
    }

    // find the label if the property is a dependent menu, not a primary one in the set (primary is menuorder of 0).
    // we don't need to find labels for primary menus - we have them already on page load.
    if(mydata.menuorder > 0){

      //2. get parent menu val...
      for(var m=0; m<infolength; m++){
        if((dmFieldData[m].menuorder == mydata.menuorder-1) && (dmFieldData[m].setname == mydata.setname)){
          var parentmenudata = dmFieldData[m];
          mydata.parentmenu = parentmenudata.menufield;
          break;
        }
      }

      //3. get list of options for that val...
      var depends       = mydata.dependency.depend,
          dependslength = depends.length,
          options       = [],
          optionslength = 0;

      for(var d=0; d<dependslength; d++){
        if(depends[d]._keyValue == mydata.parentmenu.value){
          options = depends[d].options.option;
          optionslength = options.length;
          break;
        }
      }

      //4. get the label of the current option value...
      for(var o=0; o < optionslength; o++){
        if(options[o]._value == myvalue){
          mylabel = options[o]._label;
        }
      }

      //5. set the menu value to the menu value input field (just for show)
      if(mylabel != ""){
        mydata.menulabelfield.value = mylabel;
      }else{
        addClass(mydata.menulabelfield.parentNode, "dms-mapping-error");
      }
      //6. set the parent menu id attribute (to reference the parent menu later).
      mydata.menufield.setAttribute("dm-parentid", mydata.parentmenu.id);

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
 * resetDependentMenus
 * Based on a menu selection, all downstream dependent menus are reset with default values.
 * Fires after a menu option from a dependent menu has been selected.
 * @param  {Object} menufield - the hidden input field for the selected dependent menu that holds its value (not its label!).
 */
function resetDependentMenus(menufield){
  var menudata = {};
  var menuset = menufield.getAttribute("dm-set");
  var menuorder = menufield.getAttribute("dm-order");
  var setmenus = [];

  //1. lookup dmFieldData for this field...
  for(var i=0; i < dmFieldData.length; i++){
    if(dmFieldData[i].fieldname == menufield.name){
      menudata = dmFieldData[i];
      break;
    }
  }


  //2. Find all decendent menus in the dependent menu set...
  for(var i=0; i < dmFieldData.length; i++){
    //get only descendent menus in set...
    if((dmFieldData[i].setname == menuset) && (dmFieldData[i].menuorder > menuorder)){
      setmenus.push(dmFieldData[i]);
    }
  }


  //3. Order the set...
  if(setmenus.length > 0){
    setmenus.sort(function(a,b){
      return a.menuorder - b.menuorder;
    });
  }


  //4. Assign new values to each menu in the set in order...
  for(var i=0; i < setmenus.length; i++){

    //show change indicator on field...
    addClass(setmenus[i].menufield.parentNode, "dm-pending");

    //get the correct dependency for the current set..
    var dependencies = setmenus[i].dependency;
    var dependency = {};

    if(dependencies.length){
      for (var d=0; d < dependencies.length; d++){
        if(dependencies[d] && dependencies[d]._profile == menuset){
          dependency = dependencies[d];
          break;
        }
      }
    }else{
      dependency = setmenus[i].dependency;
    }


    //get the <depend> element that corresponds to the parent menu's value...
    var depends = dependency.depend;
    var parentval = setmenus[i].parentmenu.value;
    var depend = {};

    for (var n=0; n < depends.length; n++){
      if(depends[n] && depends[n]._keyValue == parentval){
        depend = depends[n];
        break;
      }
    }
    //if the menu has options... (either because it isn't mapped or no values exist)
    if(depend.options.option[0]._value != undefined){
      //get the first option from the list of options...
      setmenus[i].menufield.value = depend.options.option[0]._value;
      setmenus[i].menulabelfield.value = depend.options.option[0]._label;
      removeClass(setmenus[i].menufield.parentNode, "dms-mapping-error"); 
    }else{
      setmenus[i].menufield.value = "";
      setmenus[i].menulabelfield.value = "";
      addClass(setmenus[i].menufield.parentNode, "dms-mapping-error");
      
    }
  }

  //hide progress indicator...
  setTimeout(function(){
    for(var i=0; i < setmenus.length; i++){
      removeClass(setmenus[i].menufield.parentNode, "dm-pending");
    }
  },500);

}

