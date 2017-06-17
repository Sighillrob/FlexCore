/* connectkey.js file */


/***********************************************************
 *
 * Add/Edit Scan Button Pages
 *
 ***********************************************************/

/*
 * initScanBtnAutocompleteFields
 * Add and Edit Scan Pages only: initializes Add/Edit Scan Button autocomplete fields
 */
connectkey.initScanBtnAutocompleteFields = function(){

  //load the autocomplete Widget for the Owner field.
  $('#ownerHandleLabel').autocomplete({
    source: function (request, response) {
      $.ajax({
        url: "EIPAdmin/Search?searchType=user&stringSearch=" + request.term,
        dataType: "json",
        type: "GET",
        minLength: 3,
        delay: 500,
        success: function (data) {
          var $ownerNotFoundMsg = $(".owner-not-found");
          
          if(data === ""){
            $(".owner-auth-fail").hide();
            $ownerNotFoundMsg.show();
            $("#ownerHandleLabel").removeClass("is-authenticated is-found");
          }

          response(
            $.map(data, function (result) {
              return {
                label: result['label'],
                value: result['value']
              };
            })
          );

        },
        error: function (){
          $('.ui-autocomplete-loading').removeClass("ui-autocomplete-loading");
        }
      });
    },
    select: function(event, ui){
      event.preventDefault();
      $("#ownerHandleLabel").val(ui.item.label);
      $("#ownerHandle").val(ui.item.value);
      
      //owner user found and selected.
      $('#ownerHandleLabel')
        .removeClass("ui-autocomplete-loading")
        .addClass("is-found");
      $(".owner-not-found").hide();
      connectkey.clearFieldErrors(this);
      
      //check to see if owner has been authenticated.
      connectkey.checkIfOwnerAuthenticated(ui.item.value);
    },
    response: function(event, ui){
      if (ui.content.length === 0) {
        $('.ui-autocomplete-loading').removeClass("ui-autocomplete-loading");
      }
    },
    close: function(){
      //if a search returns results, but the user doesn't select any...
      if(!$("#ownerHandleLabel").hasClass("is-found")){
        $(".owner-not-found").show(); 
        $(".owner-auth-fail").hide();
      }
    },
    open: function(){
      $("#ownerHandleLabel, #collHandleLabel").removeClass("is-authenticated is-found"); //opening the search menu resets the status
    }
  });


  //load the autocomplete Widget for the Collection field.
  $('#collHandleLabel').autocomplete({
    source: function (request, response) {
      $.ajax({
        url: "Search?searchType=collection&stringSearch=" + request.term + "&ownerHandle=" + $("#ownerHandle").val(),
        dataType: "json",
        type: "GET",
        minLength: 3,
        delay: 500,
        success: function (data) {
          
          if(data === ""){
            $(".folder-not-found").show(); 
            $("#collHandleLabel")
              .prop("placeholder", "")
              .prop("disabled", false)
              .removeClass("is-authenticated is-found");
            $('#subfolder-rootlabel').empty().append("-");
          }

          response(
            $.map(data, function (result) {
              return {
                label: result['label'],
                value: result['value']
              };
            })
          );
        },
        error: function (){
          $('.ui-autocomplete-loading').removeClass("ui-autocomplete-loading");
        }
      });
    },
    select: function(event, ui){
      event.preventDefault();
      $("#collHandleLabel").val(ui.item.label);
      $("#collHandle").val(ui.item.value);

      //folder found and selected.
      $('#collHandleLabel')
        .removeClass("ui-autocomplete-loading")
        .addClass("is-found is-authenticated")
        .prop("placeholder", "")
        .prop("disabled", false);
      
      //clear errors
      $(".folder-not-found").hide();
      connectkey.clearFieldErrors(this);

      //use new label as subfolder root.
      $('#subfolder-rootlabel').empty().append(ui.item.label);
    },
    response: function(event, ui){
      if (ui.content.length === 0) {
        $('.ui-autocomplete-loading').removeClass("ui-autocomplete-loading");
      }
    },
    close: function(){
      //if a search returns results, but the user doesn't select any...
      if(!$("#collHandleLabel").hasClass("is-found")){
        $(".folder-not-found").show(); 
        $('#subfolder-rootlabel').empty().append("-");
      }
    },
    open: function(){
      $("#collHandleLabel")
        .prop("placeholder", "")
        .prop("disabled", false)
        .removeClass("is-authenticated is-found");
      $('#subfolder-rootlabel').empty().append("-");
    }
  });
};


/*
 * initScanBtnAutocompleteFields
 * Edit Button Permissions Page only: initializes the User Group autocomplete field.
 * args:
 *  context - (String) either the Edit Permissions or Add Button page.  "add" or "editpermissions"
 */
connectkey.initGroupAutocompleteField = function(context){

  //load the autocomplete Widget for the Group field.
  $('#groupHandleLabel').autocomplete({
    source: function (request, response) {
      $.ajax({
        url: "EIPAdmin/Search?searchType=group&stringSearch=" + request.term,
        dataType: "json",
        type: "GET",
        minLength: 3,
        delay: 500,
        success: function (data) {
          response(
            $.map(data, function (result) {
              return {
                label: result['label'],
                value: result['value']
              };
            })
          );
        },
        error: function (){
          $('.ui-autocomplete-loading').removeClass("ui-autocomplete-loading");
        }
      });
     },
      select: function(event, ui){
        event.preventDefault();
        $("#groupHandleLabel").val(ui.item.label);
        $("#groupHandle").val(ui.item.value); //works for mfd buttons only...

        if(context === "editpermissions"){
          $("#access_specific").val(ui.item.value); //works for Add folder or scan buttons...
        }
        connectkey.clearFieldErrors(this);
        $('.ui-autocomplete-loading').removeClass("ui-autocomplete-loading");
      },
      response: function(event, ui){
        if (ui.content.length === 0) {
          $('.ui-autocomplete-loading').removeClass("ui-autocomplete-loading");
        }
      }
  });
};


/*
 * checkIfOwnerAuthenticated
 * Checks to see if the owner user that has been found and selected in the auto-complete Owner box and has been
 * authenticated with the scan system.  If not, it will be show a failure message and ask the user to supply
 * a password to authenticate.
 * args:
 *  ownerHandle {String} the numerical handle of the owner (i.e 60)
 */
connectkey.checkIfOwnerAuthenticated = function(ownerHandle){
  var $ownerNotFoundMsg = $(".owner-not-found");
  $ownerNotFoundMsg.hide();

  $.get('EIPAdmin/TestOwnerButton?ownerHandle='+ownerHandle)
    .fail(function(){
      $('#ownerPasswordLI, .owner-auth-fail').show();
      
      //reset folder - make it empty and disable it.
      $('#collHandleLabel, #collHandle').val(""); // for now, remove the Folder handle value and label.  
      $("#collHandleLabel")
        .prop("placeholder", $("#collHandleLabel").data("noownerplaceholder"))
        .prop("disabled", true)
        .removeClass("is-found is-authenticated");
    })
    .done(function(){
      $('#ownerPasswordLI').hide();
      $('.owner-auth-fail').hide();
      $("#ownerHandleLabel").addClass("is-authenticated");
      
      //reset folder - make it editable and empty.
      $('#collHandleLabel, #collHandle').val(""); // for now, remove the Folder handle value and label.
      $("#collHandleLabel")
        .prop("placeholder", "")
        .prop("disabled", false)
        .removeClass("is-found")
        .addClass("is-authenticated");
      $('#subfolder-rootlabel').empty().append("-"); //remove label in subfolder section.
    });
};


/*
 * checkOwnerExistance
 * Checks to see if the typed in user exists on owner field blur (end focus)
 */
connectkey.checkOwnerExistance = function(){
  if(!$("#ownerHandleLabel").hasClass("is-found")){
    
    //empty all owner label, handle, and docushare folder label/handle values.
    $("#ownerHandleLabel, #ownerHandle, #collHandleLabel, #collHandle").val("");
    $("#collHandleLabel")
      .prop("placeholder", $("#collHandleLabel").data("noownerplaceholder"))
      .prop("disabled", true)
      .removeClass("is-authenticated is-found");

    $(".folder-not-found").hide();
    $('#subfolder-rootlabel').empty().append("-");

    $(".owner-not-found").show();
    $(".owner-auth-fail").hide();
  }
};


/*
 * checkDSFolderExistance
 * Checks to see if the typed in folder exists on field blur (end focus)
 */
connectkey.checkDSFolderExistance = function(){
  if(!$("#collHandleLabel").hasClass("is-found")){
    //empty all owner label, handle, and docushare folder label/handle values.
    $("#collHandleLabel, #collHandle").val("");
    $("#collHandleLabel").removeClass("is-authenticated is-found");
    $(".folder-not-found").show();
    $('#subfolder-rootlabel').empty().append("-");
  }
};

/* 
 * authenticateOwner
 * submits the owner username and password to the server in order to authenticate them with the 
 * scanning system.
 */
connectkey.authenticateOwner = function(){
  var ownerPassword = $("#ownerPassword").val(),
      ownerHandle = $("#ownerHandle").val();

  $.get('EIPAdmin/TestOwnerButton?ownerHandle='+ownerHandle+"&ownerPassword="+ownerPassword)
    .fail(function(){
      $('#ownerPasswordLI').show();
      $('.owner-auth-fail').show();
    })
    .done(function(){
      $('#ownerPasswordLI').hide();
      $('.owner-auth-fail').hide();
      $("#collHandleLabel")
        .prop("placeholder", "")
        .prop("disabled", false)
        .addClass("is-authenticated");
    });
};


connectkey.checkIfFolderCanBeFoundByNewOwner = function(ownerHandle){
  
  $.ajax({
    url: "Search?searchType=collection&stringSearch=" + $('#collHandleLabel').val() + "&ownerHandle=" + ownerHandle,
    dataType: "json",
    type: "GET",
    minLength: 3,
    delay: 500,
    success: function (/*data*/) {
    },
    error: function (/*data*/){
    }
  });

};


/**
 * createFieldPropertyOptions
 * For Add & Edit Button pages.  Creates all the field properties and puts them into a list of select menu options in the hidden row template for optional non-required fields.
 * args:
 *  caller - (string) The caller - "pageload" or "script"
 */
connectkey.createFieldPropertyOptions = function(caller){
  var doctype = $("#docType").val(),
      hasDBAgents = $("#dbAgent option")[1]; //does the autofill profile menu contain at least one profile? Return null if not.

  //Does an autofill profile exist for the selected document theype?
  if(hasDBAgents){
    var autoFillProfileVal = $("#dbAgent").val(),
        autoFillProfileData = $("#dbAgent").data(doctype),
        autoFillOptionalMappedProps = [];

    //get the autofill profile mapped properties.
    for (var i=0; i<autoFillProfileData.length; i++){
      if(autoFillProfileData[i][autoFillProfileVal]){
        autoFillProfileData = autoFillProfileData[i][autoFillProfileVal];
      }
    }

    $(autoFillProfileData).each(function(i, el){
      if(el.primary === "false"){
        autoFillOptionalMappedProps.push(el.property);
      }
    });

  }


  $.get('EIPAdmin/Search?searchType=docProperties&stringSearch='+doctype, function(responseJson) {

    //store document schema data on the metadata table element.
    $("#field_list").data("dsSchemaOptional", responseJson);
    
    //alphabetize options
    responseJson = $(responseJson).sort(function(a,b){
      var alabel=a.label,blabel=b.label;
      return (alabel === blabel) ? 0 : (alabel > blabel) ? 1 : -1;
    });

    var optionsHTML = "";

    //choose the scope - change all property select menus on the page...
    //(either visible and in the row template if done after a page load, OR just in the hidden template if called by a page script)
    var scope = (caller === "pageload") ? ".propchooser" : "#fieldlist_rowtemplate .propchooser";

    //find the property menus in scope and erase their current options and put in the new ones according to the selected doctype.
    $(scope).each(function(){
      var curProp = $(this).attr("seldsprop"),
          selected = "",
          menu = "",
          autoFillMappedPropClass = "",
          isAutoFillmappedProp = -1;

      $(this).empty(); //empty current options...

      $.each(responseJson, function(index, prop) { // Iterate over the JSON array.

        selected = (prop['value'] === curProp) ? 'selected="selected"' : '';
        menu = (prop['menu']) ? 'menu="'+prop['menu']+'"' : '';

        if(hasDBAgents && $("#dbAgent").val() !==""){
          //is the property one mapped in the selected Autofill profile? If so, attach a special class to the option element.
          isAutoFillmappedProp = autoFillOptionalMappedProps.indexOf(prop['value']);
          autoFillMappedPropClass = (isAutoFillmappedProp !== -1) ? "autofill-mapped-prop" : "";
          optionsHTML = optionsHTML + '<option class="'+autoFillMappedPropClass+'" value="'+prop['value']+'" '+menu+selected+'>'+prop['label']+'</option>';
          //reset class value.
          autoFillMappedPropClass = "";

        }else{
          optionsHTML = optionsHTML + '<option value="'+prop['value']+'" '+menu+selected+'>'+prop['label']+'</option>';
        }

      });

      $(this).append(optionsHTML);

      //reset optionsHTML
      optionsHTML = "";

    });

    connectkey.renderSubCollectionOptions_required(); // update the required properties for the subcollection path menus...
    connectkey.renderSubCollectionOptions_optional(); // update the optional properties for the subcollection path menus...

  });
};


/**
 * convertRequiredNamestoLabels
 * For Edit Button Page: after the required field rows have rendered, looks up required property names and displays their label in the field settings list
 * args:
 *  doctype - (string) The document type class associated with the button (i.e. "Document", "Invoice")
 */
connectkey.convertRequiredNamestoLabels = function(doctype){
  var scantype = $("#scanType").val(),
      afpfieldlabels = $('#field_list .meta_requiredbyafp, #field_list .meta_optionalforafp');

    $.get('EIPAdmin/Search?searchType=docRequiredProperties&stringSearch='+doctype, function(responseJson) {
      $('#field_list .display_name').each(function(){
        var proplabelcontainer = $(this),
            propname = $(this).attr("dsname");

        //lookup in the required property data and find corresponding label...
        $.each(responseJson, function(index, prop) { // Iterate over the JSON array.
          if(scantype !== "Folder" && scantype !== "Email"){
            if(prop["value"] === propname){
              proplabelcontainer.append(prop["label"]);
            }
          }else if((scantype === "Folder" || scantype === "Email") && prop["value"] !== "com.xerox.xcm.elf.Displayable.title"){
            if(prop["value"] === propname){
              proplabelcontainer.append(prop["label"]);
            }
          }
        });
      });      
    });

    //Handle autofill profiles fields (both required for autofill and mapped)
    //do autofill profile required fields that are NOT required in DocuShare exist, or do mapped fields exist?
    //reads the value of the label element's class.  If the class "meta_requiredbyafp" or "meta_optionalforafp" exits, it is a required afp value.
    //
    if($(afpfieldlabels).length > 0){
      $.get('EIPAdmin/Search?searchType=docProperties&stringSearch='+doctype, function(responseJson) {
          $(afpfieldlabels).each(function(){
            var proplabelcontainer = $(this);
            var propname = $(this).attr("dsname");

            //lookup in the property data and find corresponding label...
            $.each(responseJson, function(index, prop) { // Iterate over the JSON array.
              if(prop["value"] === propname){
                proplabelcontainer.append(prop["label"]);
              }
            });
          });

          connectkey.renderSubCollectionOptions_required(); // update the required properties for the subcollection path menus...
          connectkey.renderSubCollectionOptions_optional(); // update the optional properties for the subcollection path menus...

        });
    }

};


/**
 * convertHandleToTitle
 * For Edit Button page.  Searches DocuShare for the given object handle and returns it's label/ title information
 * and puts it into a specified text field.
 * args:
 *  errormsg - (string) the error message if the object isn't found.
 *  url - (string) the url of the resource to retrieve the data.
 *  id - (string) the id of the field to insert the object's label string into.
 *  handle - (string) the handle of the object (i.e. "Collection-123")
 */
connectkey.convertHandleToTitle = function(errormsg, url, id, handle){

  var fieldid = "#"+id,
      field= document.getElementById(id);

      $(fieldid).addClass("ui-autocomplete-loading");

  //get the Object title from it's handle and put it in the Scan to Collection field value.
  $.get(url, function(responseJson) {
    if(responseJson){
      if(typeof responseJson[0].label !== "undefined"){ //json with data

        if(field.nodeName === "INPUT"){
          $(fieldid).val(responseJson[0].label);
          $(fieldid)
            .addClass("is-authenticated is-found")
            .removeClass("ui-autocomplete-loading");
        }else{ //if not a text field, just clear the container and put the title into it instead.
          $(fieldid).empty().append(responseJson[0].label);
        }

        //if this is the collection being updated, make sure the label is copied to the sub-folder section below.
        if(id==="collHandleLabel"){
          $("#subfolder-rootlabel").empty().append(responseJson[0].label);
        }

      }else{ // empty json with error page.
        if(field.nodeName === "INPUT"){
          $(fieldid).val(handle);
        }else{
          $(fieldid).empty().append(handle);
        }
        $(errormsg).insertAfter(fieldid);
      }
    }else{
      if(field.nodeName === "INPUT"){
        $(fieldid).val("");
      }else{ //if not a text field, just clear the container and put the title into it instead.
        $(fieldid).empty();
      }
    }
  });
};


/**
 * addFieldRow
 * adds a field row to the field list
 * args
 *  propselvalue {String} The selected value of the property menu. (optional).  When the Add Row button is clicked, this is empty.
 *  type {String} Either "required" or "optional"
 */
connectkey.addFieldRow = function(propselvalue){
  var rowmarkup = $('#fieldlist_rowtemplate tr').clone();

  //if this row was added using the add row button, get the property chooser value,
  //the propselvalue will be undefined in this case.
  var prop = (propselvalue === undefined) ? $(rowmarkup).find(".propchooser").val() : propselvalue;

  //append all form field ids with the name of the property
  $(rowmarkup).find("select,input").each(function(){
    this.id = this.id + prop;
  });

  //remove disabled state for template fields (Except for the Concatenation menu, which is disabled by default)
  $(rowmarkup).find("select,input").attr("disabled", function(){
    if($(this).hasClass("metaConcatLocMenu") === false){
      $(this).removeAttr("disabled");
    }
    if($(this).hasClass("propchooser")){
      //remove already used properties from chooser...
      var existingfields = [],
          optioncount = 0;
      $("#field_list .meta_name").each(function(){
        existingfields.push($(this).val());
      });

      $("option", this).each(function(){
        if($.inArray($(this).attr("value"), existingfields) !== -1){
          $(this).remove();
        }
      });
      
      optioncount = $("option", this).length;

      if(optioncount === 1){
        $("#addfieldrow").hide();
      }

      $(this).attr("preval", prop);
      connectkey.changeOrAddPropertyMenu(this, propselvalue);
    }
  });

  var insertedmarkup = $(rowmarkup).appendTo('#field_list');
  connectkey.renderSubCollectionOptions_optional();

  return $(insertedmarkup);
};


/** 
 * addRequiredFieldRow
 * adds a required field by specifying a required autofill property (primary key field)
 * args:
 *  prop {String} the required for autofill property (primary key field).
 */
connectkey.addRequiredFieldRow = function(prop){
  var rowmarkup = $('#fieldlist_rowtemplate_required tr').clone(),
      requiredSchema = $("#field_list").data("dsSchemaRequired"),
      optionalSchema = $("#field_list").data("dsSchemaOptional"),
      fullschema = [],
      propdata = {},
      odbcMenu = $(rowmarkup).find(".odbc-menu"),
      doctype = $("#docType").val(),
      mappedMenuAgents = $("#docType").data(doctype)[prop];

  for (var key in requiredSchema){
    fullschema.push(requiredSchema[key]);
  }
  for (key in optionalSchema){
    fullschema.push(optionalSchema[key]);
  }

  $(fullschema).each(function(i, el){
    if(el["value"] === prop){
      propdata = el;
    }
  });

  //General Menu/Input Property template adjustments...
  //insert required property label in first column...
  $(rowmarkup).find("span.label").append(propdata['label']).attr("dsname", propdata['value']);
  //insert property value in hidden field in first column
  $(rowmarkup).find("#prop_").val(propdata['value']);
  //give the row an incrementing id value
  $(rowmarkup).attr("id", "proprow_"+ propdata['value']);
  //remove disabled state for template fields (Except for the hidden Concatenation Location field, which is disabled by default)
  $(rowmarkup).find("select,input").attr("disabled", function(){
    if($(this).hasClass("metaConcatLocMenu") === false && $(this).hasClass("menu_concat_type_novalue") === false){
      $(this).removeAttr("disabled");
    }
  });

  $(rowmarkup).addClass("autofill-mapped-prop-required");
  $(rowmarkup).find(".required_tag").empty().append(connectkey.afpRequiredStrings.requiredtag);

  var isMenu = (propdata['menu']) ? true : false;
  //Is this a DocuShare menu property?
  //Yes...
  if(isMenu === true){
    //show the default value menu
    $(rowmarkup).find("select.meta_defaultvaluemenu")
      .append(connectkey.generateDefaultMenuOptions(propdata['menu']))
      .show();

    //and keep the default value textbox hidden and disabled.
    //no concatination option if this is a menu property!
    $(rowmarkup).find(".meta_defaultvalue, .menu_concat_type").attr("disabled", "disabled");

  // No, not a menu property...
  }else{
    //show the default value textbox, disable the default value menu hidden input field...
    $(rowmarkup).find(".meta_defaultvalue").show();
    $(rowmarkup).find("select.meta_defaultvaluemenu").append('<option value=""/>').attr("disabled", "disabled");
  }


  //Do ODBC Menus exist for this property?
  if(mappedMenuAgents){
    var options = '<optgroup label="'+connectkey.odbcMenuLabels["simplemenu"]+'">';
    
    //add ODBC Menus to menu...
    $(mappedMenuAgents).each(function(index, value){
      options += "<option odbctype='simplemenu' value='"+ value+"'>"+value+"</option>";
    });

    $(odbcMenu).removeAttr("disabled").append(options);
    $(rowmarkup).find(".odbc-menu-wrapper").show();
  }


  //append all form field ids with the name of the property
  $(rowmarkup).find("select,input").each(function(){
    this.id = this.id + propdata['value'];
  });

  //insert completed required row into field list...
  $(rowmarkup).appendTo('#field_list');

  connectkey.renderSubCollectionOptions_required(); // update the required properties for the subcollection path menus...
  connectkey.renderSubCollectionOptions_optional(); // update the optional properties for the subcollection path menus...

  return $(rowmarkup);
};


/** 
 * removeFieldRow
 * remove a field row from the field list
 * args:
 *  e- (object) the event object.
 */
connectkey.removeFieldRow = function(e){
  var btn = e.target,
      row = $(btn).parents("tr");
      //how many options are in the last optional property chooser? If only 1, add back in the Add Row button.
      var propsshown = $("#field_list tr:last .propchooser option").length;
      if(propsshown === 1){
        $("#addfieldrow").show();
      }

    $(row).fadeOut(function(){
      row.remove();
      connectkey.renderSubCollectionOptions_optional();
    });
};


/** 
 * toggleConcatLocMenu
 * toggles the disabled state of the Appended Info Location menu and hidden field.
 * args:
 *  e- (object) the event object.
 */
connectkey.toggleConcatLocMenu = function(e){

  var concatTypeMenu = e.target,
      row = $(concatTypeMenu).parents("tr"),
      concatLocMenu = $(row).find("select.metaConcatLocMenu"),
      concatLocHidden = $(concatLocMenu).next();

  if($(concatTypeMenu).val() === ""){
    $(concatLocMenu).attr("disabled", "disabled");
    $(concatLocHidden).removeAttr("disabled");
  }else{
    $(concatLocMenu).removeAttr("disabled");
    $(concatLocHidden).attr("disabled", "disabled");
  }
};


/**
 * loadRequiredFieldRows
 * loads the rows for the required fields into the Metadata Field List table
 */
connectkey.loadRequiredFieldRows = function(){
  var doctype = $("#docType").val(),
      scantype = $("#scanType").val();

  var xhr = $.get('EIPAdmin/Search?searchType=docRequiredProperties&stringSearch='+doctype, function(responseJson) {
    //sort required properties (don't really need to do this...)
    //responseJson = responseJson.sort(function(a,b){
    //  var alabel=a.label,blabel=b.label;
    //  return (alabel == blabel) ? 0 : (alabel > blabel) ? 1 : -1;
    //});

    //store document schema data on the metadata table element.
    $("#field_list").data("dsSchemaRequired", responseJson);

    //empty the current property rows...
    $('#field_list').empty();

    //for each required field, make a row in the field list...
    $.each(responseJson, function(index, prop) {

      //clone row template
      var rowmarkup = $('#fieldlist_rowtemplate_required tr').clone(),
          isMenu = (prop.menu) ? true : false,
          odbcMenu = $(rowmarkup).find(".odbc-menu"),
          mappedMenuAgents = $("#docType").data(doctype)[prop.value],
          mappedDMProfiles = [];

      //insert required property label in first column
      $(rowmarkup).find("span.label").append(prop['label']).attr("dsname", prop.value);

      //insert property value in hidden field in first column
      $(rowmarkup).find("#prop_").val(prop.value);

      //give the row an incrementing id value
      $(rowmarkup).attr("id", "proprow_"+ prop.value);

      //remove disabled state for template fields (Except for the hidden Concatenation Location field, which is disabled by default)
      $(rowmarkup).find("select:not(.metaConcatLocMenu),input:not(.menu_concat_type_novalue)").removeAttr("disabled");

      //add in the ODBC select menu if MenuAgents or Dependent Menu Sets exist for this property.
      if(mappedMenuAgents){
        var options = '<optgroup label="'+connectkey.odbcMenuLabels["simplemenu"]+'">';
        
        //add ODBC Menus to menu...
        $(mappedMenuAgents).each(function(index, value){
          options += "<option odbctype='simplemenu' value='"+ value+"'>"+value+"</option>";

          if(connectkey.dependentMenuSets[value]){ // if any Dependent Menu sets exists using this ODBC Menu...
            $(connectkey.dependentMenuSets[value]).each(function(i){ 
              mappedDMProfiles.push(connectkey.dependentMenuSets[value][i]); // add to an array of sets (mappedDMProfiles) for this ODBC menu...
            });
          }

        });

        if(mappedDMProfiles.length > 0){ //if mapped dependent menus sets exist...
          options += '<optgroup label="'+connectkey.odbcMenuLabels["dmset"]+'">';
          $(mappedDMProfiles).each(function(i, dmp){
            options += "<option odbctype='dependentmenuset' value='"+ dmp +"'>"+dmp+"</option>";
          });
        }

        $(odbcMenu).removeAttr("disabled").append(options);
        $(rowmarkup).find(".odbc-menu-wrapper").show();
      }

      //special handling if the required field is a menu property...
      if(isMenu === true){

        //show the default value menu
        $(rowmarkup).find("select.meta_defaultvaluemenu")
          .append(connectkey.generateDefaultMenuOptions(prop.menu))
          .show();

        //and keep the default value textbox hidden and disabled.
        //no concatenation option if this is a menu property!
        $(rowmarkup).find(".meta_defaultvalue, .menu_concat_type, .metaConcatLocMenu").attr("disabled", "disabled");
        $(rowmarkup).find(".metaConcatLocHidden, .menu_concat_type_novalue").removeAttr("disabled");

      }else{ // not a menu property...

        //show the default value textbox, disable the default value menu...
        $(rowmarkup).find(".meta_defaultvalue").show();
        $(rowmarkup).find("select.meta_defaultvaluemenu").append('<option value=""/>').attr("disabled", "disabled");
      }

      //append all form field ids with the name of the property
      $(rowmarkup).find("select,input").each(function(){
        this.id = this.id + prop.value;
      });

      //insert completed row into field list...
      $(rowmarkup).appendTo('#field_list');

      //special case instructions for the title field for the Folder ...
      if(prop['value'] === "com.xerox.xcm.elf.Displayable.title" && scantype === "Folder"){
        $(rowmarkup).find(".menu_concat_type option[value='autoCount']").attr("selected","selected");
        $(rowmarkup).find(".menu_concat_type option").not("[value='date'],[value='autoCount']").hide();
        $(rowmarkup).find(".metaConcatLocMenu").removeAttr("disabled");
        $(rowmarkup).find(".metaConcatLocHidden").attr("disabled", "disabled");
      }

     });

    connectkey.updateReqDefaultTitleVal(); //update the title field with the name of the button
    connectkey.renderSubCollectionOptions_required(); // update the required properties for the subcollection path menus...
    connectkey.renderSubCollectionOptions_optional(); // update the optional properties for the subcollection path menus...

  });

  return xhr;
};


/**
 * loadTitleFieldRow
 * loads one row - just for the Filename/title field.  This is only for Email or Network scan types when
 * metadata exporting is turned off.
 */
connectkey.loadTitleFieldRow = function(){
  var prop = {"value":"com.xerox.xcm.elf.Displayable.title"},
      $rowmarkup = $('#fieldlist_rowtemplate_required tr').clone(),
      scantype = $("#scanType").val(),
      metatype = $rowmarkup.find(".meta_type").val(),
      $fileNameTag = $rowmarkup.find(".filename_tag");
      
  //empty the current property rows...
  $('#field_list').empty();
  //insert property value in hidden field in first column
  $rowmarkup.find("#prop_").val(prop['value']);
  //give the row an id value withthe 
  $rowmarkup.attr("id", "proprow_" + prop['value']);
  //remove disabled state for template fields (Except for the hidden Concatenation Location field, which is disabled by default)
  $rowmarkup.find("select:not(.metaConcatLocMenu),input:not(.menu_concat_type_novalue)").removeAttr("disabled");
  //show the default value textbox, disable the default value menu...
  $rowmarkup.find(".meta_defaultvalue").show();
  $rowmarkup.find("select.meta_defaultvaluemenu").append('<option value=""/>').attr("disabled", "disabled");
  //append all form field ids with the name of the property...
  $rowmarkup.find("select,input").each(function(){
    this.id = this.id + prop['value'];
  });

  //handle special case for Folder scan types...
  if(scantype === "Folder" || scantype === "Email"){
    $rowmarkup.find(".metaConcatLocMenu").removeAttr("disabled");
    $rowmarkup.find(".metaConcatLocHidden").attr("disabled", "disabled");
  }

  if(scantype === "Folder"){
    $rowmarkup.find(".menu_concat_type option[value='']").text(connectkey.AppendedInfoMenuLabels.uniqueid);
    if(metatype === "writerequired"){
      $rowmarkup.find(".menu_concat_type option").not("[value=''],[value='date']").hide();
      $rowmarkup.find(".menu_concat_type option[value='date']").prop("selected",true);
    }else{
      $rowmarkup.find(".menu_concat_type option").not("[value=''],[value='date'],[value='autoCount']").hide();
      $rowmarkup.find(".menu_concat_type option[value='autoCount']").prop("selected",true);   
    }
    $fileNameTag.empty().append(connectkey.metalistFilenameLabels.folder).show();
  }else if(scantype === "Email"){ 
    $rowmarkup.find(".menu_concat_type option[value='']").text(connectkey.AppendedInfoMenuLabels.none);
    $rowmarkup.find(".menu_concat_type option").not("[value=''],[value='date'],[value='autoCount']").hide();
    $rowmarkup.find(".menu_concat_type option[value='autoCount']").prop("selected",true);
    $fileNameTag.empty().append(connectkey.metalistFilenameLabels.email).show();
  }else{
    $rowmarkup.find(".menu_concat_type option[value='']").text(connectkey.AppendedInfoMenuLabels.none);
    $rowmarkup.find(".menu_concat_type option").show();
  }

  //insert completed row into field list...
  $rowmarkup.appendTo('#field_list');
  //update the title field with the name of the button...
  connectkey.updateReqDefaultTitleVal();
};


/**
 * renderSubCollectionOptions_required
 * Renders the required property options for the subcollection menus based on the current doctype.
 */
connectkey.renderSubCollectionOptions_required = function(){
  var requiredOptionsHTML = "",
      doctype = $("#docType").val(); //get the selected doctype.

  //Get the required properties...
  $.get('EIPAdmin/Search?searchType=docRequiredProperties&stringSearch='+doctype, function(responseJson) {

    $.each(responseJson, function(index, prop) {
      requiredOptionsHTML += '<option value="'+prop['value']+'">'+prop['label']+'</option>';
    });

  //if we have autofill profile required (primary key) fields, add them also to the required optgroup...
  $("#field_list .autofill-mapped-prop-required span.label").each(function(){
    var text = $(this).text(),
        val = $(this).attr("dsname");
    requiredOptionsHTML += '<option value="'+ val +'">'+ text +'</option>';
  });

    $(".subfolder-reqfield-optgroup").each(function(){
      $(this).empty();
      $(this).append(requiredOptionsHTML);
    });

  //now that the required fields have been added as options to the select menu, if a required field was selected, select it.
  //grab the array selected values from the jquery data on the subCollectionSettings element...
  var selectionArray = $("#subCollectionSettings").data();
  selectionArray = selectionArray[doctype];

  if(selectionArray){
    $(".subCollectionSelect").each(function(index){
      $(this).val(selectionArray[index]);
    });
  }

  });
};


/**
 * renderSubCollectionOptions_optional
 * Renders the optional property options for the subcollection menus based what optional properties have
 * been selected in the field listing above.
 */
connectkey.renderSubCollectionOptions_optional = function(){
  var optionalOptionsHTML = "",
      hasDuplicate = {};

  $("#field_list .propchooser[disabled!='disabled'] option:selected").each(function(){
    var text = $(this).text(),
        val = $(this).val();

    if(!hasDuplicate[text]){
      hasDuplicate[text] = true;
      optionalOptionsHTML += '<option value="'+ val +'">'+ text +'</option>';
    }
  });

  //if we have autofill profile mapped fields, add them also to the optional optgroup...
  $("#field_list .autofill-mapped-prop span.label").each(function(){
    var text = $(this).text(),
        val = $(this).attr("dsname");
    optionalOptionsHTML += '<option value="'+ val +'">'+ text +'</option>';
  });

  //update the subcollection title select menu optional properties optgroup.
  $("#subCollectionPathTemplate .subfolder-optionalfield-optgroup").each(function(){
    $(this).empty();
    $(this).append(optionalOptionsHTML);
  });


  //Now that the option list has the latest optional values, restore the currently selected option to the selected state.
  //grab the array selected values from the jquery data on the subCollectionSettings element...
  var doctype = $("#docType").val(),
      selectionArray = $("#subCollectionSettings").data();

    selectionArray = selectionArray[doctype];

  //if the doctype is not in the array list, then create it.
  if(selectionArray){
    $(".subCollectionSelect").each(function(index){
      $(this).val(selectionArray[index]);
    });
  }else{
    var newdoctype = doctype, doctypedata = {};
    doctypedata[newdoctype] = ["","",""];
    $("#subCollectionSettings").data(doctypedata);
  }
};


/**
 * changeOrAddPropertyMenu
 * Handles the behavior associated with changing or adding a new property chooser
 * in conjunction with the sub-collection path controls.
 * args:
 *  menu (object) The select menu object.
 *  selectedOption {String} (optional) the value of the selected option.
 */
connectkey.changeOrAddPropertyMenu = function(menu, selectedOption){
  menu = $(menu);
  var curval = (selectedOption) ? selectedOption : $(menu).val(),
      curvalclean = curval.replace(/\./g, "\\\."), //in falcon, property names have dots in them - add backslash in front "\."
      preval = menu.attr("preval"),
      proprow = $(menu).closest("tr"),
      requiredmsg = menu.next(),  //required message
      defaultvaluefield = $(proprow).find("input.meta_defaultvalue"), //default value field
      defaultvaluefield_menu = $(proprow).find("select.meta_defaultvaluemenu"), //default value menu field
      menufield = $(proprow).find("input.meta_menu"),
      selectedoption = $(menu).find('option:selected'),
      concattypemenu = $(proprow).find("select.menu_concat_type"), //concat type menu
      concattype_novalue_menu = $(proprow).find(".menu_concat_type_novalue"), //concat type menu
      isUsedBySubCollectionCtrl = $("#subCollectionPathTemplate").find(".subCollectionSelect option:selected[value='"+curvalclean+"']").length > 0,
      odbcMenu = $(proprow).find(".odbc-menu"),
      doctype = $("#docType").val(),
      mappedMenuAgents = $("#docType").data(doctype)[curval],
      mappedDMProfiles = [];

  //select the selectedOption if specified in the menu.
  if(selectedOption){
    $(menu).find("option").filter(function(){
      return ($(this).val() === selectedOption);
    }).prop("selected", true);
  }

  var newpropstring = "_"+curval;
  var oldpropstring = "_"+preval;

  //append input and select menu ids with the new property name.
  $(proprow).find("select, input").each(function(i,el){
    var oldid = el.id;
    var re = new RegExp(oldpropstring,"g");
    el.id = oldid.replace(re, newpropstring);
  });

  menu.attr("preval", curval);

  //determine if this field is required for use by the sub-collection controls.
  if(isUsedBySubCollectionCtrl === true){
    $(requiredmsg).show();
    $(defaultvaluefield).addClass("required");
  }else{
    $(requiredmsg).hide();
    $(defaultvaluefield).removeClass("required");
  }

  connectkey.renderSubCollectionOptions_optional();

  //determine if the new selected option is a mapped field in the autofill profile...
  var isMappedByAutoFillProfile = $(menu).find(":selected").hasClass("autofill-mapped-prop");
  if(isMappedByAutoFillProfile){
    $(proprow).addClass("autofill-mapped-prop");
    $(proprow).find(".meta_type option").each(function(i){
      if(i === 1 || i === 2){
        $(this).hide();
      }
    });
  }else{
    $(proprow).removeClass("autofill-mapped-prop");
    //show all meta type options
    $(proprow).find(".meta_type option").each(function(){
        $(this).show();
    });
  }

  //determine if this field has ODBC menus or ODBC Dependent Menu Sets available to use...
  if(mappedMenuAgents){
    var options = '<optgroup label="'+connectkey.odbcMenuLabels["simplemenu"]+'">';

    //add ODBC menu options
    $(mappedMenuAgents).each(function(index, value){
      options = options + "<option odbctype='simplemenu' value='"+ value+"'>"+value+"</option>";

      if(connectkey.dependentMenuSets[value]){ // if any Dependent Menu sets exists using this ODBC Menu...
        $(connectkey.dependentMenuSets[value]).each(function(i){ 
          mappedDMProfiles.push(connectkey.dependentMenuSets[value][i]); // add to an array of sets (mappedDMProfiles) for this ODBC menu...
        });
      }
    });

    if(mappedDMProfiles && mappedDMProfiles.length > 0){
      options += '<optgroup label="'+connectkey.odbcMenuLabels["dmset"]+'">';
      $(mappedDMProfiles).each(function(i, dmp){
        options += "<option odbctype='dependentmenuset' value='"+ dmp +"'>"+dmp+"</option>";
      });
    }

    $(odbcMenu)
      .removeAttr("disabled")
      .find("optgroup").remove().end()
      .find("option:gt(0)").remove().end()
      .append(options);

    $(proprow).find(".odbc-menu-wrapper").show(); //show the wrapper div for the menu agent section.


  //clear the odbc menu section...
  }else{
    //if this was a dependent menu, clear other dependent menus in set.
    if (odbcMenu.attr("prevaltype") === "dependentmenuset"){
      connectkey.removeDependentMenus(odbcMenu, "none", odbcMenu.val());
    }

    $(odbcMenu)
      .find("option:gt(0)").remove().end()
      .find("optgroup").remove();
    $(proprow).find(".odbc-menu-wrapper").hide();   
  }

  //determine if this field is a menu or a normal text field.  Hide and disable the other.
  if(selectedoption.attr("menu")){

    menufield.val(selectedoption.attr("menu"));

    defaultvaluefield.attr("disabled", "disabled").hide();
    //remove all option values, if any exist.
    defaultvaluefield_menu.empty();
    //turn the menu attribute value into option elements...
    defaultvaluefield_menu.append(connectkey.generateDefaultMenuOptions(selectedoption.attr("menu")));
    //show and enable the default value menu...
    defaultvaluefield_menu.removeAttr("disabled").show();

  }else{
    defaultvaluefield.removeAttr("disabled").show();
    defaultvaluefield_menu.attr("disabled", "disabled").hide();
    menufield.val("");
  }

  //enabled or disable the concatination options
  //disable if property is a menu or an autofill profile mapped field.
  if(selectedoption.attr("menu") || isMappedByAutoFillProfile){
    //disable the concat type menu...
    concattypemenu.attr("disabled", "disabled");
    concattype_novalue_menu.removeAttr("disabled");
  }else{
    concattypemenu.removeAttr("disabled");
    concattype_novalue_menu.attr("disabled", "disabled");
  }
};


/**
 * generateDefaultMenuOptions
 * This generates the list of options for the default value menu for a menu property and returns the resulting string.
 * args:
 *  - menuattrvalue - String - a list of menu options separated by a "||" and then split by a ":" between name and value.
 */
connectkey.generateDefaultMenuOptions = function(menuattrvalue){
  //add options based on the menu attribute value.
    var menuitems = menuattrvalue.split('||'),
        menuoptions = "";

    $(menuitems).each(function(){
      var data = this.split(":"),
          name = data[0],
          label = data[1];
      menuoptions = menuoptions + '<option value="'+name+'">'+label+'</option>';
    });
  return menuoptions;
};


/**
 * changeDocType
 * Erases the current list of field properties and puts in rows for the required
 * fields of the newly selected property
 */
connectkey.changeDocType = function(e){
  var docTypeMenu = e.target,
      newDocTypeVal = $(docTypeMenu).val(),
      scantype = $("#scanType").val(),
      currDocTypeVal = $(docTypeMenu).attr("curval"),
      autoFillAgents = $("#dbAgent").data(newDocTypeVal)[0],
      currAutoFillAgentVal = $("#dbAgent").val();

  //reset autofill profile curval to "".
  $("#dbAgent").val(""); //reset to none
  $("#dbAgent").attr("curval", "");

  connectkey.saveSelDocTypeFields(currDocTypeVal,currAutoFillAgentVal); // save currently selected doctype & autofill profile fields before the change...
  connectkey.loadSelDocTypeFields(newDocTypeVal,""); // load new values
  connectkey.updateAutoFillProfile(); // load autofill profiles if they exist...

  if(scantype !== "DocuShare"){
    $("#label_title").next().show();
  }else{
    $("#label_title").next().hide();
  }

  //show the autofill profile menu if at least one profile exists. (otherwise hide it.)
  if(autoFillAgents){
    $("#autofill_profile_wrapper").show();
  }else{
    $("#autofill_profile_wrapper").hide();
  }

  connectkey.createFieldPropertyOptions("script"); // populate properties table with required field options.
  $(docTypeMenu).attr("curval", newDocTypeVal);
};


/**
 * changeScanType
 * changes the scan type from a network folder to a DocuShare collection (or vice versa) or an email 
 * args:
 *  - e (object) the change event object on the Scan Type select menu.
 */
connectkey.changeScanType = function(e){
  var selval = e.target,
      newScanTypeVal = $(selval).val(),
      collFields = $(".scanType_coll"),
      folderFields = $(".scanType_nfolder"),
      emailFields = $(".scanType_email"),
      subCollectionFieldset = $("#subCollectionSettings");


  //Switch to Network Folder...
  if(newScanTypeVal === "Folder"){
    collFields.hide().find("input").attr("disabled", "disabled");
    emailFields.hide();
    folderFields.show().find("input").removeAttr("disabled");
    subCollectionFieldset.hide().find("select").attr("disabled", "disabled");
    $("#dbAgent, #docType").attr("disabled", "disabled");

  //Switch to Email...
  }else if(newScanTypeVal === "Email"){ // if scan type is switched to Email...
    //hiding all fields but email ones...
    collFields.hide().find("input").attr("disabled", "disabled");
    folderFields.hide().find("input").attr("disabled", "disabled");
    emailFields.show().find("input").removeAttr("disabled");
    subCollectionFieldset.hide().find("select").attr("disabled", "disabled");
    $("#dbAgent, #docType").attr("disabled", "disabled");

  //Switch to DocuShare Collection...
  }else{
    folderFields.hide().find("input").attr("disabled", "disabled"); // hide & disable Network Folder properties
    emailFields.hide().find("input").attr("disabled", "disabled");
    collFields.show().find("input").removeAttr("disabled"); //show & enable DS Collection properties
    connectkey.renderSubCollectionOptions_required(); // update the properties for the subfolder path template select menus...
    subCollectionFieldset.show().find("select").removeAttr("disabled"); //show the sub-collection settings section and enable all select menus.
  }

  connectkey.checkMetadataMode();
};


/**
 *  changeScanColor
 *  prevents a user from selecting an MRC scan format if the color is Black and White.
 *  args:
 *    e {Object} Event object - the change event on the scanColor menu.
 */
connectkey.changeScanColor = function(e){
  var menu= e.target,
      menuval = $(menu).val(),
      formatmenu = $("#format"),
      formatmenuval = $(formatmenu).val(),
      mrcoptions = $("#format option[value='MRC-PDF'], #format option[value='MRC-PDFA-1b']");

  if(menuval === "BLACK_AND_WHITE"){

    if(formatmenuval === "MRC-PDF" || formatmenuval === "MRC-PDFA-1b"){
      $('#format option:eq(0)').prop('selected', true);
    }
    $(mrcoptions).attr("disabled", "disabled");

  }else{
    $(mrcoptions).removeAttr("disabled");
  }
};


/**
 * checkMetadataMode
 * checks to see if the Export Metadata Checkbox is on / off. If off, it hides the property
 * field header and footer so users can't change doctype or add fields if off
 * for network folder or email scan types.
 * @param e {Object} The event object.  Only is used if the enable metadata checkbox is used.
 */
connectkey.checkMetadataMode = function(e){
  //if this function was run by checking the enable metadata checkbox...
  if(e){ 
    var emchecked = $(e.target).prop("checked");
    if(emchecked === false){
      $("#dbAgent, #docType").attr("disabled", "disabled");
    }else{
      $("#dbAgent, #docType").removeAttr("disabled");
    }
  }

  var propertylist_footer = $("#field_list_footer"),
      propertylist_header = $("#doctype_wrapper"),
      docTypeMenu = $("#docType"),
      docTypeVal = $("#docType").val(),
      scanType = $("#scanType").val(),
      autoFillProfile = ($("#dbAgent").val()) ? $("#dbAgent").val() : "",
      exportMetadata = $("#exportMeta").prop("checked"),
      autoFillAgents = $("#dbAgent").data(docTypeVal)[0],
      $titlerow = $("#proprow_title"),
      $concat_type = $titlerow.find(".menu_concat_type"),
      $concatLocMenu = $titlerow.find(".metaConcatLocMenu"),
      $concatLocHidden = $titlerow.find(".metaConcatLocHidden");

  if(scanType === "Folder"){
    if(exportMetadata === false){ // mode off.
      if(docTypeMenu.is(":enabled")){ //if the doctype control is enabled, it's not in filename mode, so save the current property settings...
        connectkey.saveSelDocTypeFields(docTypeVal,autoFillProfile);
      }
      if(!e){
        $("#dbAgent, #docType").attr("disabled", "disabled");
      }

      propertylist_header.hide();
      propertylist_footer.hide();
      connectkey.loadTitleFieldRow(); // populate table with the Title/Filename row

    }else if(exportMetadata === true){ // mode on.

      propertylist_header.show();
      propertylist_footer.show();
      connectkey.loadSelDocTypeFields(docTypeVal,autoFillProfile);

      if(!e){
         $("#dbAgent, #docType").removeAttr("disabled");
      }

      if(autoFillAgents){
        //show the autofill profile menu if at least one profile exists. (otherwise hide it.)
        $("#autofill_profile_wrapper").show();
      }else{
        $("#autofill_profile_wrapper").hide();
      }


    }

    $("option[value='autoCount']", $concat_type).prop("selected",true);
    $("option", $concat_type).not("[value='date'],[value='autoCount']").hide();
    $concatLocMenu.removeAttr("disabled");
    $concatLocHidden.attr("disabled", "disabled");
    $("#label_title").next().show();

  }else if(scanType === "Email"){
    if(exportMetadata === false){ // mode off.
      if(docTypeMenu.is(":enabled")){ //if the doctype control is enabled, it's not in filename mode, so save the current property settings...
        connectkey.saveSelDocTypeFields(docTypeVal,autoFillProfile);
      }
      if(!e){
        $("#dbAgent, #docType").attr("disabled", "disabled");
      }

      propertylist_header.hide();
      propertylist_footer.hide();
      connectkey.loadTitleFieldRow(); // populate table with the Subject/Title/Filename row...

    }else{ // mode on.
      propertylist_header.show();
      propertylist_footer.show();
      connectkey.loadSelDocTypeFields(docTypeVal,autoFillProfile);
      if(!e){
        $("#dbAgent, #docType").removeAttr("disabled");
      }

      if(autoFillAgents){
        //show the autofill profile menu if at least one profile exists. (otherwise hide it.)
        $("#autofill_profile_wrapper").show();
      }else{
        $("#autofill_profile_wrapper").hide();
      }
    }

  }else if(scanType === "DocuShare"){
    $("#dbAgent, #docType").removeAttr("disabled");
    $("#autofill_profile_wrapper").show();
    propertylist_header.show();
    propertylist_footer.show();
    connectkey.loadSelDocTypeFields(docTypeVal,autoFillProfile);

    $("option[value='autoCount']", $concat_type).prop("selected",true);
    $("option", $concat_type).show();
    $concatLocMenu.attr("disabled", "disabled");
    $concatLocHidden.removeAttr("disabled");
    $("#label_title").next().hide();
  }
};


/**
 * changeOCRType
 * controls the behavior of the page when the value of the OCR menu is changed.
 * args:
 *  e (Object) The event object (onchange)
 */
connectkey.changeOCRType = function(e){
  var menu = e.target,
      isServerMRC = $(menu).data("isServerMRC"),
      isServerPDFA = $(menu).data("isServerPDFA"),
      newval = $(menu).val();


  if(newval === "SEARCHABLE_IMAGE_SERVER" && isServerMRC === false){
    $("body").find(".mrc_only").prop('disabled',true);
  }else{
    $("body").find(".mrc_only").prop('disabled',false);
  }

 if(newval === "SEARCHABLE_IMAGE_SERVER" && isServerPDFA === false){
    $("body").find(".pdfa_only").prop('disabled',true);
  }else{
    $("body").find(".pdfa_only").prop('disabled',false);
  }
};


/**
 * changeMetaTypes
 * turns on or off the required class for the default value field so that empty values are allowed
 * when the metatype is set to editable at scan type but required.
 *  e {Object} the event object (onchange)
 */
connectkey.changeMetaType = function(e){
  var menu = e.target,
      menuval = $(menu).val(),
      $row = $(menu).parents("tr"),
      inputfield = $row.find(".meta_defaultvalue"),
      scantype = $("#scanType").val(),
      $menu_concat_type = $row.find(".menu_concat_type"),
      $menu_concat_type_novalue = $row.find(".menu_concat_type_novalue"),
      $metaConcatLocMenu = $row.find(".metaConcatLocMenu"),
      $metaConcatLocHidden = $row.find(".metaConcatLocHidden"),
      isRequired = $row.find(".meta_require").val();

    if(menuval === "write" || menuval === "writerequired"){
      $(inputfield).removeClass("required");
    }else{
      if(isRequired === "true"){
        $(inputfield).addClass("required");
      }
    }

    //special casing for Email and Folder scan types...
    if(scantype === "Email"){
      $("option[value='']", $menu_concat_type).text(connectkey.AppendedInfoMenuLabels.none).prop("selected",true);

      //if writerequired, disable ALL concat options...
      if(menuval === "writerequired"){
        $menu_concat_type.add($metaConcatLocMenu).attr("disabled","disabled");
        $menu_concat_type_novalue.add($metaConcatLocHidden).removeAttr("disabled"); 
      }else{
        $menu_concat_type.removeAttr("disabled");
        $menu_concat_type_novalue.attr("disabled","disabled");
        //$("option", $menu_concat_type).show().not("[value=''],[value='date'],[value='autoCount']").hide();
      }

    }else if(scantype === "Folder"){
      if ($row.attr('id') === 'proprow_title') { // If this is the title row, force unique id
        $("option[value='']", $menu_concat_type).text(connectkey.AppendedInfoMenuLabels.uniqueid).prop("selected",true);
      }
      else { // if a previous row exists its not the title property, so we allow empty append value
        $("option[value='']", $menu_concat_type).text(connectkey.AppendedInfoMenuLabels.none).prop("selected",true);
      }
      
      //if writerequired, only allow concat option for timestamp and none...
      //if(menuval == "writerequired"){
        //$("option", $menu_concat_type).show().not("[value=''],[value='date']").hide();
      //}else{
        //$("option", $menu_concat_type).show().not("[value=''],[value='date'],[value='autoCount']").hide(); 
      //}
    
    }else{
      $("option[value='']", $menu_concat_type).text(connectkey.AppendedInfoMenuLabels.none);
      $("option", $menu_concat_type).show();
      $menu_concat_type.removeAttr("disabled");
      $menu_concat_type_novalue.attr("disabled","disabled");
    }

    if($menu_concat_type.val() === ""){
      $metaConcatLocMenu.attr("disabled","disabled");
      $metaConcatLocHidden.removeAttr("disabled");
    }else{
      $metaConcatLocMenu.removeAttr("disabled");
      $metaConcatLocHidden.attr("disabled","disabled");
    }
};


/**
 * changeODBCMenu
 * assigns a metadata property to a datasource menu.
 * args:
 * e              {object} the event object (onchange) for the menu agent menu.
 * menuoptionsurl {String} the data url that returns a JSON string of menu option labels and values.
 * dmoptionsurl   {String} The data url that returns an xml document of menu option labels and values for this menu in the dependent menu set.
 * ajaxerror      {String} The error that is shown if the request fails.
 */
connectkey.changeODBCMenu = function(e, menuoptionsurl, dmoptionsurl, ajaxerror){
  var odbcmenu = e.target,
      odbcmenuval = $(odbcmenu).val(),
      odbctype = $('option:selected', odbcmenu).attr("odbctype"),
      url = (odbctype === 'simplemenu') ? (menuoptionsurl+odbcmenuval) : (dmoptionsurl+odbcmenuval);

  //show loading for dependendent menu set default value tds...
  if(odbctype === 'dependentmenuset'){ 
    
    //find the other dependent menus in the set and load them...
    $("#field_list select.odbc-menu").each(function(i, select){  
      $(select.options).each(function(i, opt){
        if(opt.value === odbcmenuval){
          var inputtd = $(this).closest("tr").children()[1];
          $(inputtd).nimbleLoader("show");
        }
      });
    });
  }

  if(odbcmenuval !==""){
    //get the menu values...
    $.get(url)
      .success(function(response){
        
        //SIMPLE ODBC menu... 
        if(odbctype === 'simplemenu'){
          
          var fieldrow = $(odbcmenu).closest("tr"),
              fieldtd = $(odbcmenu).closest("td"),
              defaultinput = $(fieldrow).find(".meta_defaultvalue"),
              defaultinputtd = $(defaultinput).closest("td"),
              defaultselect = $(fieldrow).find(".meta_defaultvaluemenu"),  
              concatmenu = $(fieldrow).find(".menu_concat_type"),
              concathidden = $(fieldrow).find(".menu_concat_type_novalue"),
              menuAgentHiddenField =  $(fieldtd).children(".meta-menuagent"),
              dependentMenuProfileField = $(fieldtd).children(".meta-dmprofile");

          $(defaultselect).empty().removeAttr("disabled");
          $(defaultinput).hide().attr("disabled", "disabled").removeClass("required_error").next("p.fielderror").remove();
          $(defaultinputtd).nimbleLoader("show");

          var options = response.split("||"),
              optionshtml = "";

          $(options).each(function(i, option){
            var data = option.split(":"),
                val = data[0],
                label = data[1];
            optionshtml = optionshtml + '<option value="'+val+'">'+label+'</option>';
          });

          //give the select menu the simple menu class.
          $(defaultselect).addClass("odbc-sm").removeClass("odbc-dm");
          //set the selected odbc simple menu value in the hidden menuAgent field...
          $(menuAgentHiddenField).val(odbcmenuval);
          $(dependentMenuProfileField).val("");

          if($(odbcmenu).attr("prevaltype") === "dependentmenuset"){
            connectkey.removeDependentMenus(odbcmenu, "simplemenu");
          }

          $(odbcmenu).attr("preval", odbcmenuval);
          $(odbcmenu).attr("prevaltype", odbctype);
          $(defaultselect).append(optionshtml).show();

          if(fieldrow.hasClass("autofill-mapped-prop-required")){
            connectkey.loadAFPValues(null, $(defaultselect)); 
          }

         $(defaultinputtd).nimbleLoader("hide");
         $(concatmenu).attr("disabled", "disabled");
         $(concathidden).removeAttr("disabled");
        
        //DEPENDENT menu in a set...
        }else{ 
          var x2js = new X2JS({arrayAccessFormPaths:['EditDependentMenuAgents.MenuAgent.dependency', 
                                                 'EditDependentMenuAgents.MenuAgent.dependency.depend',
                                                 'EditDependentMenuAgents.MenuAgent.dependency.depend.options.option'
                                                ]}),
              data = x2js.xml2json(response), //turn xml into json object
              menuAgents = $(data.EditDependentMenuAgents.MenuAgent);

          connectkey.dmsprops[data.EditDependentMenuAgents.DependentMenuProfile["_name"]] = [];

          //load any properties in the set that aren't in the table already...
          var existingprops = [];
          $("#field_list .meta_name").each(function(){
            existingprops.push($(this).val());
          });
          
          $(menuAgents).each(function(i,menuAgent){
            var propraw = menuAgent.property;
            var prop = propraw.replace(/\./g, "\\\."); //in falcon, property names have dots in them - add backslash in front "\."
            menuAgent.menu = $("#defaultvaluemenu_"+prop);
            if($.inArray(menuAgent.property, existingprops) === -1){ //not in the existing props array
              connectkey.addFieldRow(menuAgent.property);
            }
          });

          //find all the menus in the dependent menu set and load their values (in order).
          $(menuAgents).each(function(i, menuAgent){
            var propraw = menuAgent.property;
            var prop = propraw.replace(/\./g, "\\\."); //in falcon, property names have dots in them - add backslash in front "\."

            var ma_td = $(menuAgent.menu).closest("td"),
                metatype = $("#type_"+prop),
                odbcmenu = $("#odbcmenu_"+prop),
                defaultselect = $("#defaultvaluemenu_"+prop),
                defaultinput = $("#defaultvalue_"+prop),
                concatmenu = $("#concat_type_"+prop),
                concathidden = $("#concat_type_novalue_"+prop),
                dependentMenuProfileField = $("#dependentMenuProfile_"+prop),
                menuAgentHiddenField = $("#menuAgent_"+prop),
                dependency = {},
                optionshtml = "";

            $(defaultselect).empty().removeAttr("disabled");
            $(defaultinput).hide().attr("disabled", "disabled").removeClass("required_error").next("p.fielderror").remove();

            //set the odbcmenu preval and prevaltype attributes and set with the newly selected profile...
            $(odbcmenu).attr({"preval" : odbcmenuval, "prevaltype" : odbctype}).val(odbcmenuval);

            //get primary menu options...
            if(i === 0){
              dependency = $.grep(menuAgents[1].dependency, function(dep){ return dep._profile === odbcmenuval;});
              $(dependency[0].depend).each(function(i, depend){
                optionshtml += '<option value="'+depend._keyValue+'">'+depend._keyLabel+'</option>';
              });
            
            //handle 2nd and 3rd dependent menus...
            }else{
              dependency = $.grep(menuAgent.dependency, function(dep){ return dep._profile === odbcmenuval;});
              $(dependency[0].depend[0].options.option).each(function(i, opt){
                optionshtml += '<option value="'+opt._value+'">'+opt._label+'</option>';
              });
            }

            //dependent menus get the writerequired metatype by default...
            $(metatype).val("writerequired");
            //give the default value select menu the dependent menu class...
            $(defaultselect).addClass("odbc-dm").removeClass("odbc-sm").append(optionshtml).show();
            //set the dependent menu profile value in the hidden dependentMenuProfile field.
            $(dependentMenuProfileField).val(odbcmenuval);
            $(menuAgentHiddenField).val("");

            $(ma_td).nimbleLoader("hide");
            $(concatmenu).attr("disabled", "disabled");
            $(concathidden).removeAttr("disabled");

          });
        }
      })
      .fail(function(){
        //$(defaultinputtd).nimbleLoader("hide");
        connectkey.showMessage(ajaxerror, "error");
      });

    //Remove any settings for ODBC menus or Dependent Menu Sets...
    }else{
      var fieldrow = $(odbcmenu).closest("tr"),
          fieldtd = $(odbcmenu).closest("td"),
          defaultinput = $(fieldrow).find(".meta_defaultvalue"),
          defaultselect = $(fieldrow).find(".meta_defaultvaluemenu"),  
          concatmenu = $(fieldrow).find(".menu_concat_type"),
          concathidden = $(fieldrow).find(".menu_concat_type_novalue"),
          menuAgentHiddenField =  $(fieldtd).children(".meta-menuagent"),
          dependentMenuProfileField = $(fieldtd).children(".meta-dmprofile");
      
      $(defaultselect).hide().attr("disabled", "disabled");
      $(defaultinput).show().removeAttr("disabled");
      $(defaultinput).closest("td").removeClass("afpprimaryfield-nomatch afpprimaryfield-loading afpprimaryfield-success"); //reset any autofill result status
      $(dependentMenuProfileField).val("");
      $(menuAgentHiddenField).val("");
      $(concatmenu).removeAttr("disabled");
      $(concathidden).attr("disabled", "disabled");

      if($(odbcmenu).attr("prevaltype") === "dependentmenuset"){
        connectkey.removeDependentMenus(odbcmenu, "none", $(dependentMenuProfileField).val());
      
      //clearing the values of an autofill profile.
      }else if($(odbcmenu).attr("prevaltype") === "simplemenu" && $("dbAgent").val() !== ""){
        $(".meta_defaultvalue[readonly]").val("");
      }
        $(odbcmenu).attr("prevaltype", "");
        $(odbcmenu).attr("preval", "");
    }
};


/**
 * removeDependentMenus
 * Removes dependent menu values for each property in the set and returns them to their original
 * textbox field type.
 * @param  {Object} menu        The odbc menu for a given property in the metadata table. 
 * @param  {String} newodbctype The new odbc type after the dependent menu has been deselected.
 * @param  {String} dmsval      Name of the dependent menu set that has been deselected.
 */
connectkey.removeDependentMenus = function(menu, newodbctype, prevdmsval){
  var preval = $(menu).attr("preval");
  delete connectkey.dmsprops[prevdmsval]; //delete the dm set in the dmsprops object.

  //reset all menus in the previously selected dependent menus set...
  $("#field_list select.odbc-menu").each(function(i, select){
      var hiddenDMProfileField = $(select).closest("td").children(".meta-menuagent"),
          hiddenMenuAgentField = $(select).closest("td").children(".meta-dmprofile");
    if($(this).attr("preval") === preval && select !== menu){
      var concatmenu = $(select).closest("tr").find(".menu_concat_type"),
          concathidden = $(select).closest("tr").find(".menu_concat_type_novalue"),
          defaultselect = $(select).closest("tr").find(".meta_defaultvaluemenu"),
          defaultinput = $(select).closest("tr").find(".meta_defaultvalue");

      $(select).val("");
      $(concatmenu).removeAttr("disabled");
      $(concathidden).attr("disabled", "disabled");
      $(defaultselect).hide().empty().attr("disabled", "disabled");
      $(defaultinput).removeAttr("disabled").show();
      $(hiddenDMProfileField).val("");
      $(hiddenMenuAgentField).val("");
    }

  });
};


/**
 * connectkey.StringToXML
 * Turn a string into an xml document.
 * @param {String} oString The escaped string of XML.
 */
connectkey.StringToXML = function(oString) {
  //code for IE
  if(window.ActiveXObject){
    var oXML = new ActiveXObject("Microsoft.XMLDOM"); oXML.loadXML(oString);
    return oXML;
  
  //code for Chrome, Safari, Firefox, Opera, etc.
  }else{
   var parser = new DOMParser();
   var newval = parser.parseFromString(oString, "text/xml");
   return newval;
  }
};


/**
 * loadDependentMenuSetData
 * Edit Button Page Only. converts the string of XML for the dependent menu data to json for javascript consumption.  
 * Then loads the right options into the different menus in the Dependent Menu Sets used in the Scan button metadata fields.
 * @param  {Object} dmProfiles - the XML data for each dependent menu set (a.k.a profile) in an object literal format.
 *                               i.e. {'profile1' : '<xmldata>, 'profile2' : '<xmldata>'}
 */
connectkey.loadDependentMenuSetData = function(dmProfiles){
  
  //1. generate the dependent menu set data...
  for (var key in dmProfiles){
    //convert the xml to json.
    var xmlDoc = connectkey.StringToXML(dmProfiles[key]); //turn data into xml document...
    var xotree = new XML.ObjTree();
    xotree.attr_prefix = '_';
    xotree.force_array = [ "MenuAgent", "option", "dependency", "depend" ];
    var tree = xotree.parseDOM(xmlDoc);
    connectkey.dmProfiles[key] = tree["#document"].EditDependentMenuAgents; //trim out unnecessary parent nodes.

    //find depend menu set menus in the metadata list...
    $(connectkey.dmProfiles[key].MenuAgent).each(function(i,menuAgent){
      var propraw = menuAgent.property,
      prop = propraw.replace(/\./g, "\\\."); // escape periods in property names so it can be used in the jquery id selector.
      menuAgent.menu = $("#defaultvaluemenu_"+prop);
    }); 
  }


  //2. use data to create dependent menu set menus in metadata list...
  for (key in connectkey.dmProfiles){
    //populate options for each menu in the set.
    $(connectkey.dmProfiles[key].MenuAgent).each(function(i,menuAgent){
      
      var optionshtml;
      var dependency;
      
      //get primary menu options 
      if(i === 0){
        //make sure to use depend elements only from the selected profile (menuAgents can have more than one profile)
        dependency = $.grep(connectkey.dmProfiles[key].MenuAgent[1].dependency, function(d){ return d._profile === key; });
        $(dependency[0].depend).each(function(n, pmopt){
          var currentValInConfig = connectkey.dependentMenuFields[key][menuAgent.property],
              selected = (currentValInConfig === pmopt._keyValue) ? 'selected="selected"' : '';
          optionshtml += '<option value="'+pmopt._keyValue+'" '+selected+'>'+pmopt._keyLabel+'</option>';
        });
        $(connectkey.dmProfiles[key].MenuAgent[0].menu).append(optionshtml);

      
      //get options for 1st and 2nd dependent menus... (this is stored in order in the json data)
      }else{
        var parentMenu = connectkey.dmProfiles[key].MenuAgent[i-1].menu,
            parentVal = $(parentMenu).val();
        
        //make sure to use depend elements only from the selected profile (menuAgents can have more than one profile)
        dependency = $.grep(connectkey.dmProfiles[key].MenuAgent[i].dependency, function(d){ return d._profile === key; });

        var depend = $.grep(dependency[0].depend, function(dep){return dep._keyValue === parentVal;}),
            currentValInConfig = connectkey.dependentMenuFields[key][menuAgent.property];



        if(depend[0].options.option[0]._value){ // if there are any options...
          $(depend[0].options.option).each(function(n, opt){
            var selected = (currentValInConfig === opt._value) ? 'selected="selected"' : '';
            optionshtml += '<option value="'+opt._value+'" '+selected+'>'+opt._label+'</option>';
          });
          $(menuAgent.menu).append(optionshtml);
        }
       
      }

    });
  }
};


/**
 * changeDMDefaultMenuVal
 * Fires when a dependent menu has its value changed, cascade the change to tbe option values and the current selection in child menus.
 * @param  {Object} e       The event, in this case, the change event for the default value dependent select menu.
 * @param  {String} url     The url to get the option values and labels for all dependent menus.
 * @param  {String} failmsg The message shown when the url to retrieve the dependent menu options returns an error code.
 */
connectkey.changeDMDefaultMenuVal = function(e,url,failmsg){

  var menu                 = e.target,
      menuval              = $(menu).val(),
      prop                 = $(menu).closest("tr").find(".meta_name").val(),
      dependentMenuProfile = $(menu).closest("tr").find(".meta-dmprofile").val();

  url = url+dependentMenuProfile;

  $.get(url)
    .success(function(response){
      var x2js = new X2JS({arrayAccessFormPaths:['EditDependentMenuAgents.MenuAgent.dependency', 
                                                 'EditDependentMenuAgents.MenuAgent.dependency.depend',
                                                 'EditDependentMenuAgents.MenuAgent.dependency.depend.options.option'
                                                ]}),
          data = x2js.xml2json(response), //turn xml into json object
          menuAgent = $.grep(data.EditDependentMenuAgents.MenuAgent, function(m){ return m.property === prop; }),
          menuPos = jQuery.inArray(menuAgent[0].name, data.EditDependentMenuAgents.DependentMenuProfile.menuAgent),
          dependentMenus = $.grep(data.EditDependentMenuAgents.MenuAgent, function(n, i){ return i > menuPos;}),
          dependentMenuLength = dependentMenus.length,
          prevMenu = menu,
          preMenuVal = menuval;

      //find all dependent menus in the cascade and get their menu options for each parent menu's selected value.
      for (var i=0; i < dependentMenuLength; i++){
        //make sure to use depend elements only from the selected profile (menuAgents can have more than one profile)
        var dependency = $.grep(dependentMenus[i].dependency, function(d){ return d._profile === dependentMenuProfile; }),
            depends = dependency[0].depend,
            depend = $.grep(depends, function(d){return d._keyValue === preMenuVal; }),
            depmenuprop = dependentMenus[i].property,
            fields = $("#field_list .meta_name"),
            depmenunamefield = $.grep(fields, function(input){ return $(input).val() === depmenuprop; }),
            depmenu = $(depmenunamefield).closest("tr").find(".meta_defaultvaluemenu.odbc-dm");
        
        if(depend[0]){ //if the current dependent menu has no child menu mapped in the set...
          var options = depend[0].options.option,
              optionshtml = "",
              selval = "";

          $(options).each(function(i, opt){
            if(i === 0){
              selval = opt._value;
            }
            optionshtml += '<option value="'+opt._value+'">'+opt._label+'</option>';
          });

          $(depmenu).empty().append(optionshtml);
          prevMenu = depmenu;
          preMenuVal = selval;
        }else{
          $(depmenu).empty();
        }
      }
      
    })
    .fail(function(){
      connectkey.showMessage(failmsg, "error");
    });
};


/**
 *  changeAutoFillMenu
 *  Changes the metadata property listing to show properties required for the selected autofill profile.
 *  args:
 *    e {Object} Event object - the onChange event on the Autofill Profile Menu.
 */
connectkey.changeAutoFillMenu = function(e){
  var docTypeVal =$("#docType").val(),
      afpmenu = e.target,
      newAutoFillProfileVal = $(afpmenu).val(),
      currAutoFillProfileVal = $(afpmenu).attr("curval");

  connectkey.saveSelDocTypeFields(docTypeVal,currAutoFillProfileVal); // save currently selected doctype & autofill profile before the change...
  connectkey.createFieldPropertyOptions("script"); // loads the options for each property menu in the row template.
  connectkey.loadSelDocTypeFields(docTypeVal,newAutoFillProfileVal); // load properties for doctype and autofill profiles.
  
  //set new curval for the Autofill Profile Menu.
  $("#dbAgent").attr("curval", newAutoFillProfileVal);
};


/**
 * saveSelDocTypeFields
 * Add/Edit Scan Button Page.  Saves a copy of the table body rows for each field for a selected document type.
    args:
      docType {String} the document type associated with the field rows in the field list table.
      autoFillProfile {String} the autofill profile name.
 */
connectkey.saveSelDocTypeFields = function(docType, autoFillProfile){

  var docTypeFields = $("#field_list").children(),
      result = $.grep(connectkey.docTypeFields, function(i){ return (i.doctype === docType && i.autofillprofile === autoFillProfile);});

  $('#field_list .textboxhint').smallipop('destroy'); //destroy all textbox hints in table for mapped afp fields.
  $("#field_list .afpmappedbadge").smallipop('destroy'); //destroy all the afp badge hints.

  if(result.length === 0){ // doctype not found, adding it...
    connectkey.docTypeFields.push({"doctype" : docType, "autofillprofile" : autoFillProfile, "tbodymarkup" : docTypeFields});
  }else if(result.length === 1){  // doctype found, updating markup...
    result[0].tbodymarkup = docTypeFields;
  }
};


/**
 * loadSelDocTypeFields
 * Add/Edit Scan Button Page.  Loads a copy of the table body rows for each field for a selected document type.
 *  args:
 *    docType - {String} the document type value: "DocuShare", "Folder", "Email".
 *    autoFillProfile {String} the Autofill profile value.
 */
connectkey.loadSelDocTypeFields = function(docType, autoFillProfile){
  var scanType = $("#scanType").val();
  //check to see if the current set of fields is stored in the docTypeFields container object...
  var result = $.grep(connectkey.docTypeFields, function(i){
    return (i.doctype === docType && i.autofillprofile === autoFillProfile);
    });

  if(result.length === 0){
    // doctype & autofill profile combo not found, rendering new rows from required row template...
    connectkey.loadRequiredFieldRows().then(function(){
      connectkey.loadAutoFillProfileFields(); // load any required autofill properties.
      
      var $titlerow = $("#proprow_title"),
          $metatype = (".meta_type", $titlerow),
          $concat_type = $titlerow.find(".menu_concat_type"),
          $concat_type_options = $("option", $concat_type),
          $displayname = $(".display_name", $titlerow),
          $filenametag = $(".filename_tag", $titlerow);

      $concat_type_options.show(); //show all options for concat information.

      if(scanType === "Email"){
        $displayname.empty();
        $filenametag.empty().append(connectkey.metalistFilenameLabels.email).show();
        $("option[value='']", $concat_type).text(connectkey.AppendedInfoMenuLabels.none);
        if($metatype === "writerequired"){
          $concat_type_options.not("[value=''],[value='date']").hide();
          $("option[value='date']", $concat_type).prop("selected",true);
        }else{
          $("option", $concat_type).not("[value=''],[value='date'],[value='autoCount']").hide();
          $("option[value='autoCount']", $concat_type).prop("selected",true);   
        }
      }else if(scanType === "Folder"){
        $displayname.empty();
        $filenametag.empty().append(connectkey.metalistFilenameLabels.folder).show();
        $concat_type_options.not("[value=''],[value='date'],[value='autoCount']").hide();
        $("option[value='']", $concat_type).text(connectkey.AppendedInfoMenuLabels.uniqueid);
        $("option[value='autoCount']", $concat_type).prop("selected",true);
      }
    });

  }else if(result.length === 1){  // doctype found, loading saved markup into field_list tbody...
    $("#field_list").empty().append(result[0].tbodymarkup); // load in the saved field data rows and settings...

    var $titlerow = $("#proprow_title"),
        $concat_type = $titlerow.find(".menu_concat_type"),
        $displayname = $(".display_name", $titlerow),
        $filenametag = $(".filename_tag", $titlerow);

      if(scanType === "Email"){
        $("option[value='']", $concat_type).text(connectkey.AppendedInfoMenuLabels.none);
        $displayname.empty();
        $filenametag.empty().append(connectkey.metalistFilenameLabels.email).show();
      }else if(scanType === "Folder"){
        $("option[value='']", $concat_type).text(connectkey.AppendedInfoMenuLabels.uniqueid);
        $displayname.empty();
        $filenametag.empty().append(connectkey.metalistFilenameLabels.folder).show();
      }

    //initialize hints for autofill mapped fields...
    $('#field_list .textboxhint').smallipop({popupOffset:10, popupDistance:0, popupAnimationSpeed:0, popupDelay:500, preferredPosition: 'right', hideDelay:0, handleInputs:false});
    $("#field_list .afpmappedbadge").smallipop({popupDistance:0, popupAnimationSpeed: 0, popupDelay:500, popupOffset:150, popupYOffset:-14, hideDelay:200});
  }
};


/**
 * loadAutoFillProfileFields
 * Loads any autofill profile required fields and tags other mapped fields as being used by the currently select profile.
 */
connectkey.loadAutoFillProfileFields = function(){

  var menu                    = $("#dbAgent"),
      menuval                 = $(menu).val(),
      doctype                 = $("#docType").val(),
      doctypeAutofillProfiles = $("#dbAgent").data(doctype),
      afpprops                = [], // all afp props
      mappedprops             = [], // mapped afp props
      primaryprops            = [], // primary key afp props
      primaryneeded           = [], // primary key afp props not shown in table.
      mappedneeded            = [], // mapped afp props not shown in table.
      requiredprops           = []; // required props shown in table by default.

  // Find all afp properties, then make a list of primary key props and a list of mapped props.
  $(doctypeAutofillProfiles).each(function(i){
    if(doctypeAutofillProfiles[i][menuval]){
      $(doctypeAutofillProfiles[i][menuval]).each(function(i, el){
        afpprops.push(el["property"]);
        if(el["primary"] === "true"){
          primaryprops.push(el["property"]); //list of afp primary key properties.
        }else{
          mappedprops.push(el["property"]); //list of afp mapped properties.
        }
      });
    }
  });

  //find required fields already being displayed...
  $("#field_list").find("span.label").each(function(){
      requiredprops.push($(this).attr("dsname"));
  });

  //Handle REQUIRED Docushare Properties (which are already loaded on the page)...
  $("#field_list").find("span.label").each(function(){
    var prop = $(this).attr("dsname"),
        isAFPField = afpprops.indexOf(prop),
        isPrimary = primaryprops.indexOf(prop),
        row = $(this).closest("tr"),
        defaultinput = ($(row).find(".meta_defaultvalue").is(":disabled")) ? $(row).find(".meta_defaultvaluemenu") : $(row).find(".meta_defaultvalue");

    if(isAFPField !== -1){
      //disable concatenation options for AFP fields...
      $(row).find(".menu_concat_type").attr("disabled", "disabled");
      $(row).find(".menu_concat_type_novalue").removeAttr("disabled");
      
      if(isPrimary !== -1){ //is a primary key field...
        //set as editable & required at scan time.
        $(row).find(".meta_type").val("writerequired");
        $(defaultinput).removeClass("required");
        //mark with autofill mapping icon...
        $(row).addClass("autofill-mapped-prop-required");
        $(row).find(".required_tag").append(connectkey.afpRequiredStrings.requiredtag);
      
      }else{ // is a mapped field.
        $(row).addClass("autofill-mapped-prop");
        $(row).find(".meta_type option:eq(1)").hide(); //remove editable display option.
        $(row).find(".odbc-menu-wrapper").hide(); //remove odbc menu if available for this property.
        $(row).find(".inputhintwrapper").addClass("textboxhint");
        $(defaultinput).attr({readonly : "readonly", tabindex : "-1"});
      }

    }

  });

  //Handle OPTIONAL DocuShare properties...
  //find primary key fields that are optional docushare properties...
  $.grep(primaryprops, function(value) {
    if ($.inArray(value, requiredprops) === -1){primaryneeded.push(value);}
  });

  //add optional DocuShare rows for each primary key prop in the Autofill Profile ...
  if(primaryneeded.length > 0){
    $(primaryneeded).each(function(i, el){
      //add row and then return a reference to the row...
      var row = connectkey.addRequiredFieldRow(el);
      var defaultinput = ($(row).find(".meta_defaultvalue").is(":disabled")) ? $(row).find(".meta_defaultvaluemenu") : $(row).find(".meta_defaultvalue");
      //disable concatenation options...
      $(row).find(".menu_concat_type").attr("disabled", "disabled");
      $(row).find(".menu_concat_type_novalue").removeAttr("disabled");
      //select the display option for edit & required.
      $(row).find(".meta_type").val("writerequired");
      $(defaultinput).removeClass("required");
    });
  }

  //find mapped fields that are optional docushare properties...
  $.grep(mappedprops, function(value) {
    if ($.inArray(value, requiredprops) === -1){mappedneeded.push(value);}
  });

  //add optional DocuShare rows for each mapped prop in the Autofill Profile ...
  if(mappedneeded.length > 0){
    $(mappedneeded).each(function(i, el){
      var row = connectkey.addRequiredFieldRow(el);
      $(row).addClass("autofill-mapped-prop").removeClass("autofill-mapped-prop-required");
      $(row).find(".odbc-menu-wrapper").hide(); //remove odbc menu if available for this property.
      $(row).find(".meta_name").addClass("meta_optionalforafp");
      $(row).find(".menu_concat_type").attr("disabled", "disabled");
      $(row).find(".menu_concat_type_novalue").removeAttr("disabled");
      $(row).find(".required_tag").empty();
      $(row).find(".meta_type option:eq(1)").hide();
      $(row).find(".meta_require").val("false");
      $(row).find(".inputhintwrapper").addClass("textboxhint");
      $(row).find(".meta_defaultvalue")
        .removeClass('required')
        .attr({readonly : "readonly", tabindex : "-1"});
    });
  }

  //initialize hints for mapped afp fields...
  $('#field_list .textboxhint').smallipop({popupOffset:10, popupDistance:0, popupAnimationSpeed:0, popupDelay:500, preferredPosition: 'right', hideDelay:0, handleInputs:false});
  $("#field_list .afpmappedbadge").smallipop({popupDistance:0, popupAnimationSpeed: 0, popupDelay:500, popupOffset:150, popupYOffset:-14, hideDelay:200});

  connectkey.renderSubCollectionOptions_required(); // update the required properties for the subcollection path menus...
  connectkey.renderSubCollectionOptions_optional(); // update the optional properties for the subcollection path menus...

};


/**
 * loadAFPValues
 * when a profile selected and its fields are loaded,
 * @param  {Object} e - event object (the afp primary field- either a menu or a textbox)
 * @param  {Object} pkfield - The primary key menu or textbox.
 */
connectkey.loadAFPValues = function(e, pkfield){ 
  var doctype = $("#docType").val(),
      afp     = $("#dbAgent").val(),
      buttonId = $("#buttonId").val(),
      pkfields = $("#field_list .autofill-mapped-prop-required .meta_defaultvaluemenu:enabled, #field_list .autofill-mapped-prop-required .meta_defaultvalue:enabled"),
      afpurl  = "/connectkey/EIPServer/ValidateMetadata?documentType="+doctype+"&dbAgent="+afp+"&buttonId="+buttonId,
      otheremptypkfields = false;

  if(!e){ //if this is not a primary key textbox...
    //are other primary fields present? If they are, are they filled in?
    //if so, load the mapped values with ajax.
    $(pkfields).each(function(i, el){
      if(el !== pkfield && $(this).val().length === 0){
        otheremptypkfields = true;
      }
    });
  }

  if(otheremptypkfields === false){

    //make the textbox have a loading icon
    $(".autofill-mapped-prop .meta_defaultvalue").addClass("afpmappedfield-loading");

    //add all primary key names and values to the lookup url...
    $(pkfields).each(function(){
      var pkname = $(this).closest("tr").find(".meta_name").val(),
          pkval = $(this).val();
      afpurl += "&metaName[]="+pkname+"&metaValue[]="+pkval;
    });

    //make the ajax call to get the mapped values based on the primary keys.
    $.ajax({
      url: afpurl,
      dataType: "text"
    })
    .done(function( data ) {

      var xml = $.parseXML( data ), //convert text to xml
          x2js = new X2JS({arrayAccessFormPaths : ["autofills.autofill"]}); //create a converter object
      
      data = x2js.xml2json(xml); //turn xml into json object

      if($(data.autofills.autofill).length > 0){

        $(data.autofills.autofill).each(function(n, field){
          var fkey = field._key,
              fval = field._value,
              fkey_clean = fkey.replace(/\./g, "\\\."), //in falcon, property names have dots in them - add backslash in front "\."
              defaultinputid = "#defaultvalue_"+fkey_clean;
              
          $(defaultinputid).val(fval);
        });
        setTimeout(function(){
          $(".autofill-mapped-prop .meta_defaultvalue").removeClass("afpmappedfield-loading");
          $(pkfields).closest("td").removeClass("afpprimaryfield-nomatch afpprimaryfield-loading").addClass("afpprimaryfield-success");
          $(pkfields).removeClass("afpprimaryfield-nomatch afpprimaryfield-loading").addClass("afpprimaryfield-success");
        },500);
        
      }else{
        setTimeout(function(){
          $(".autofill-mapped-prop .meta_defaultvalue").removeClass("afpmappedfield-loading").val("");
          $(pkfields).closest("td").removeClass("afpprimaryfield-success afpprimaryfield-loading").addClass("afpprimaryfield-nomatch");
          $(pkfields).removeClass("afpprimaryfield-success afpprimaryfield-loading").addClass("afpprimaryfield-nomatch");
        },500);
      }

    })
    .fail(function(){

    });

  }
};


/**
 * loadValidAFPVals
 * Edit Button page.  Loads valid default values when the primary key values using an ODBC menu
 * for a profile have been removed from the data source.  We will load then next value found in 
 * the menu and its mapped fields instead.
 * @param  {String} url - The validation URL that if given primary key values, will return mapped field values.
 * @param  {String} doctype The document type of the scan button
 * @param  {String} dbagent The autofill profile of the scan button.
 * @param  {Object} fieldlist - list of fields and their values saved in an object literal, i.e. {"title" : "My button", last_name" :  "Jones"}.
 */
connectkey.loadValidAFPVals = function(url, doctype, dbagent, fieldlist){
  var autoFillProfileVal = $("#dbAgent").val(),
      autoFillProfileData = $("#dbAgent").data(doctype),
      buttonId = $("#buttonId").val(),
      autoFillOptionalMappedProps = [],
      autoFillRequiredProps = [],
      validateURL = url;

  //get the autofill profile properties.
  for (var i=0; i<autoFillProfileData.length; i++){
    if(autoFillProfileData[i][autoFillProfileVal]){
      autoFillProfileData = autoFillProfileData[i][autoFillProfileVal];
    }
  }

  //make a lists of input (primary key) and output properties...
  $(autoFillProfileData).each(function(i, el){
    if(el.primary === "false"){
      autoFillOptionalMappedProps.push(el.property);
      $("#defaultvalue_"+el.property).val(""); //remove values of mapped output properties.  Need the latest data from database.
    }else{
      autoFillRequiredProps.push(el.property);
      //create validator url from primary key names and values...
      validateURL += "&metaName[]="+el.property+"&metaValue[]="+fieldlist[el.property]+"&buttonId="+buttonId;
    }
  });

  //submit values to validator url.  If no output field values come back, then we 
  //have a validation error - a primary key value is no longer in the database!!
  $.get(validateURL, function(response){
    //convert the xml to json.
    var xotree = new XML.ObjTree();
    xotree.attr_prefix = '_';
    xotree.force_array = ["autofill"];
    var tree = xotree.parseDOM(response),
        autofills = tree["#document"].autofills, //trim out unnecessary #document parent node.
        isValidPKFields = (autofills.autofill) ? true : false, //are all the primary key values still in the database?
        hasPKTextField = null,  //is one of the primary key fields a text field?
        valuesURL = url;

    //Determine if it's possible to refetch new values:
    //only in the case where all primary key fields are using ODBC menus.
    $(autoFillRequiredProps).each(function(i, el){

      var propval_clean = el.replace(/\./g, "\\\."), //some property names have dots in them - add backslash in front "\."
          $defaultval_el = $("#proprow_"+propval_clean+" .defaultval:enabled"),
          defaultval = $defaultval_el.val(),
          tagname = $defaultval_el.prop("tagName").toLowerCase();


      //if there is a primary key that is a text field, set hasPKTextField = true.
      hasPKTextField = (hasPKTextField !== true && tagname === "select") ? false : true;
      valuesURL += "&metaName[]="+el+"&metaValue[]="+defaultval;
      
      if(!isValidPKFields){
        $defaultval_el.closest("td").addClass("afpprimaryfield-nomatch");
      }

    });

    //if the primary key values are still in the database
    //if the primary key values are missing, and there are no primary key textboxes...
    if(isValidPKFields){
      //just use the validation data to populate mapped fields.
      $(autofills.autofill).each(function(i,af){
        $("#defaultvalue_"+af._key).val(af._value); //load the values into the correct default value textboxes.
      });
    }else if(!isValidPKFields && hasPKTextField === false){
      //refetch new values based on the new primary key odbc menu(s) default loaded value(s)...
      $.get(valuesURL, function(response){
        var xotree = new XML.ObjTree();
        xotree.attr_prefix = '_';
        xotree.force_array = ["autofill"];
        var tree = xotree.parseDOM(response),
            autofills = tree["#document"].autofills.autofill; //trim out unnecessary #document parent node.
        $(autofills).each(function(i,af){
          $("#defaultvalue_"+af._key).val(af._value); //load the values into the correct default value textboxes.
        });
      })
      .fail(function(){

      });
    }

  })
  .fail(function(){

  });
};


/**
 * delayLoadAFPValues
 * Load autofill profile mapped fields as soon as a primary key field has been typed in with a 1000ms delay.
 * @param  {Object} e - event object - the afp primary field textbox onkeyup event.
 */
connectkey.delayLoadAFPValues = function(e){
  var field = e.target,
      pkfields = $("#field_list .autofill-mapped-prop-required .meta_defaultvaluemenu:enabled, #field_list .autofill-mapped-prop-required .meta_defaultvalue:enabled"),
      otherpkfields = false,
      timeoutval = (e.type === "focusout") ? 100 : 1000;

    clearTimeout(connectkey.afptextboxTimeout);
    
    connectkey.afptextboxTimeout = setTimeout(function(){ 
      //are other primary fields present? If they are, are they filled in?
      //if so, load the mapped values with ajax.
      $(pkfields).each(function(i, el){
        if(el !== field && $(this).val().length === 0){
          otherpkfields = true;
        }
      });

      if(otherpkfields === false){
        $(pkfields).closest("td").addClass("afpprimaryfield-loading").removeClass("afpprimaryfield-nomatch afpprimaryfield-success");
        connectkey.loadAFPValues(null, field);
      }

    }, timeoutval );
};


/**
 * updateAutoFillProfile
 * Updates the autofill profile with the ones available for the selected doctype.
 */
connectkey.updateAutoFillProfile = function(){
  var doctype = $("#docType").val(),
      doctypedata = $("#dbAgent").data(doctype);

  $("#dbAgent").find("option:gt(0)").remove();

  $(doctypedata).each(function(i, el){
    for (var key in el){
      $("#dbAgent").append("<option value='" + key + "'>" + key + "</option>");
    }
  });
};


/**
 * updateReqDefaultTitleVal
 * Only for the Add Scan button page. Once the name of the button has been set in the name field, the string
 * is copied to the title metadata default value field.
 */
connectkey.updateReqDefaultTitleVal = function(){
  if($("#defaultvalue_title").length && $("#defaultvalue_title").val() === ""){ //if it exists and it is empty.
    $("#defaultvalue_title").val($("#buttonName").val());
  }
};


connectkey.updateSubFolderRootLabel = function(e){
  var collLabelField = e.target,
      collLabel = $(collLabelField).val();
  if(collLabel !== "" && $("#collHandle").val !== ""){
    $("#subfolder-rootlabel").empty().append(collLabel);
  }
};


/**
 * toggleOptionalFieldRequired
 * forces users to input a default value for an optional property if that property has been selected in one of the
 * sub-collection path menus.  Puts a required badge next to the optional property pulldown in selected rows.  It will also remove the badge
 * and removed the required class of the default property textbox if it is no longer selected in one of the sub-collection path menus.
 * args:
 *  e (object) THe event object that triggers this function (in this case, the onchange event on the sub-collection path menus)
 */
connectkey.toggleOptionalFieldRequired = function(e){
  var menu = e.target,
      curval = $(menu).val(),
      preval = $(menu).attr("currval"),
      option = $(menu).find("option:selected"),
      menuindex = $(menu).index("#subCollectionPathTemplate select"),
      doctype = $("#docType").val(),
      preval_isOptional = $(menu).find(".subfolder-optionalfield-optgroup option[value='"+preval+"']").length > 0,
      otherMenuMatchesFound = $("#subCollectionPathTemplate").find(".subCollectionSelect option:selected[value='"+preval+"']").length > 0,
      matchingpropmenu = "",
      proptd = "",
      requiredmsg = "",
      required = "",
      proprow = "";

  // if the previous value was an optional value...
  // determine if the previous value was an optional property...
  if (preval_isOptional === true && otherMenuMatchesFound === false){
    matchingpropmenu = $("#field_list .propchooser option:selected[value='"+preval+"']").parent();
    proptd = matchingpropmenu.parent();
    requiredmsg = matchingpropmenu.next();
    required = requiredmsg.next();
    proprow = matchingpropmenu.parent().parent();

    $(requiredmsg).hide();
    $(proprow).find("input.meta_defaultvalue").removeClass("required");
  }

  // if the selected option is an optional property (by looking at the optgroup)
  if($(option).parent().attr("class") === "subfolder-optionalfield-optgroup"){
    matchingpropmenu = $("#field_list .propchooser option:selected[value='"+curval+"']").parent();
    proptd = matchingpropmenu.parent();
    requiredmsg = matchingpropmenu.next();
    required = requiredmsg.next();
    proprow = matchingpropmenu.parent().parent();

    $(requiredmsg).show();
    $(proprow).find("input.meta_defaultvalue").addClass("required");
  }

  //set the currval attribute with the new currently selected value after the onchange event.
  $(menu).attr("currval", curval);

  //update the handy data() property of #subCollectionSettings element that stores the array of the currently selected values so that when
  //rows are added, removed, or changed (which wipes out the optional properties options and then restores them), they will look at this array
  //and remember their selections.
  var selectionArray = $("#subCollectionSettings").data(doctype);
  selectionArray[menuindex] = curval;
};


/**
 * validateODBCSettings
 * On the Add or Edit Button pages, determines if Autofill profiles or Dependent Menu Sets have all their properties 
 * added to the metadata table.
 * @param {String} afp_error_msg The error message if a field in the Autofill profile has not been added.
 * @param {String} dms_error_msg The error message if all the fields in a dependent menu set are not added.
 * @return {Boolean} Returns true or false to the form submission function.
 * 
 */
connectkey.validateODBCSettings = function(afp_error_msg, dms_error_msg){
  
  var proplist = [],
      optionalprops = {},
      afp_error = false,
      dms_error = false,
      dms_missingprops = [],
      errormsg = "";

  //what properties are added to the metadata field table?
  $("#field_list .meta_name").each(function(){
    proplist.push($(this).val());
  });

  // we will get the current set of optional property names and labels from property select menu in the row template...
  $("#fieldlist_template .propchooser option").each(function(i,el){
    optionalprops[el.getAttribute("value")] = el.innerHTML;
  });

  /*
  Check for Autofill profile fields. Make sure they are all present.
  */
  // if($("#dbAgent").val() != ""){

  //   var doctype = $("#docType").val(),
  //       autoFillProfileVal = $("#dbAgent").val(),
  //       autoFillProfileData = $("#dbAgent").data(doctype),
  //       autoFillMappedProps = [];

  //   //get the autofill profile mapped properties.
  //   for (i=0; i<autoFillProfileData.length; i++){
  //     if(autoFillProfileData[i][autoFillProfileVal]){
  //       autoFillProfileData = autoFillProfileData[i][autoFillProfileVal];
  //     }
  //   }

  //   $(autoFillProfileData).each(function(i, el){
  //     autoFillMappedProps.push(el.property);
  //   });

  //   $(autoFillMappedProps).each(function(i, el){
  //     //if any property is missing in the metadata table, set the afp_error to true.
  //     if ($.inArray(el, proplist) == -1){
  //       afp_error = true;
  //       afp_missingprops.push(optionalprops[el])
  //     }
  //   });

  //   if(afp_error === true){
  //     errormsg = afp_error_msg + afp_missingprops.join(", ");
  //   }

  // }


  /*
    Check for Dependent Menu Sets.  Make sure all properties for each set are present in the table.
   */
  var dmspropsneeded = [];
  $(connectkey.dmsprops).each(function(){
    $.map(connectkey.dmsprops, function(value){
      $.merge(dmspropsneeded,value);
    });
  });

  $(dmspropsneeded).each(function(i, prop){
    if($.inArray(prop, proplist) === -1){
      dms_error = true;
      dms_missingprops.push(optionalprops[prop]);
    }
  });

  if(dms_error === true){
    errormsg = dms_error_msg + dms_missingprops.join(", ");
  }


  //if there are errors, return false and display error, otherwise, true.
  if(afp_error === true || dms_error === true){
    connectkey.showMessage(errormsg, "error");
    return false;
  }else{
    return true;
  }
};


/**
 * testNetworkFolderSettings
 * submits an ajax call to a resource that tests the network folder, username, and password to see if they are valid.
 * args:
 *  - e - (object) the event object (in this case a button click)
 *  - url (string) the url of the network folder account testing resource.
 */
connectkey.testNetworkFolderSettings = function(e, url){

  var params = $("#uncPath, #uncUser, #uncPassword").serialize();
  $("#nfconnwait").show();
  $(".nfconnmsg").hide();

  $.get(url, params, function(){
    $("#nfconnwait").hide();
    $("#nfconn_success_msg").show();
  })
    .fail(function(response){
      var errorname = response.responseText;
      errorname = errorname.replace(/\"/g, ""); // remove double quotes.
      var errormsgid = "#nfconn_" + errorname + "_msg";
      $("#nfconnwait").hide();
      $(errormsgid).show();
    });
};