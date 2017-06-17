/**********************************
 *
 * Autofill Profiles Listing Pages
 *
 **********************************/

/**
 * deleteSelectedAFPs
 * deletes all the selected autofill profiles on the AFP listing page.
 * @param  {String} deleteurl       the post url for the delete operation.
 * @param  {String} confirmmsg      the confirm message i.e. "Are you sure??!"
 * @param  {String} successmsg      the success message.
 * @param  {String} failuremsg      the generic AJAX failure message.
 * @param  {String} mappingerrormsg the failure message if a profile is used on a scan button.
 */
connectkey.deleteSelectedAFPs = function(deleteurl, confirmmsg, successmsg, failuremsg, mappingerrormsg){

  var isOnlyAFP = (document.getElementsByName("autofillProfiles[]").length > 1) ? false : true;

  if(confirm(confirmmsg)){
    var data = $("#datasourcemenulistform").serialize(),
        mappederror = false;
    data = data+"&action=delete";

    //determine if any items checked are used by a button or a dependent menu by 
    //checking its attributes hasscanbtn="true" or hasdms="false".
    $(".objectlist input:checked").each(function(){
      if($(this).attr("hasscanbtn") == "true" || $(this).attr("hasdms") == "true"){
        mappederror= true;
        connectkey.showMessage(mappingerrormsg, "error");
        return false;
      }
    });
    
    if(mappederror === false){
      $("body").nimbleLoader("show");
      var xhr = $.post(deleteurl, data, function(response) {

        if(isOnlyAFP == false){
          connectkey.showMessage(successmsg, "success");
          setTimeout(function(){
            location.reload(true); //reload page...
          }, 2000);

        }else{ // just remove the row of the deleted AFPs.
          $("#selectedbtns").hide();
          $(".objectlist tbody input:checked").closest("tr").fadeOut(function(){$(this).remove();});
          //if the select All checkbox was checked... uncheck it.
          $("#chkbx_selectAll:checked").prop('checked', false);
          //hide loader..
          $("body").nimbleLoader("hide");
          connectkey.showMessage(successmsg, "success");
        }

      })
      .fail(function(response) {
        $("body").nimbleLoader("hide");
        var errormsg_final = (response.status == 400 || response.status == 500) ? connectkey.clean400ErrorResponseText(response.responseText) : failuremsg;
        connectkey.showMessage(errormsg_final, "error");
      })
    }
  }
}


/**
 * deleteDSAgent
 * deletes a dsAgent (menu or autofill) using ajax and returns the user to the listing page.
 * args:
 *   e - (object) the event object.
 *   context - (string) Either "editpage" or "listpage" - lets the function know what page the action is coming from.
 *   deleteurl - (string) the url to point the post to. Set to null if extracting from a hyperlink.
 *   confirmmsg - (string) the confirm message i.e. "Are you sure?"
 *   successmsg - (string) the delete success message.
 *   failuremsg - (string) the delete failure message.
 *   redirecturl - (string) the redirect url after the delete has successfully completed. Assign null if not desired.
 */
connectkey.deleteDSAgent = function(e, context, deleteurl, confirmmsg, successmsg, failuremsg, redirecturl){
  e.preventDefault();

  if(confirm(confirmmsg)){

    if(context == "editpage"){
      $("body").nimbleLoader("show");

      var xhr = $.post(deleteurl, function() {
        window.location.href = redirecturl;
      })
      .fail(function(response) {
        $("body").nimbleLoader("hide");
        var errormsg_final = (response.status == 400 || response.status == 500) ? connectkey.clean400ErrorResponseText(response.responseText) : failuremsg;
        connectkey.showMessage(errormsg_final, "error");
      });


    }else if(context == "listpage"){
      var btn = e.target,
          deleteurl = $(btn).attr("href"),
          row = $(btn).closest("tr");

      $("body").nimbleLoader("show");

      var xhr = $.post(deleteurl, function() {
        $(row).fadeOut(function(){row.remove();});
        $("body").nimbleLoader("hide");
        connectkey.showMessage(successmsg, "success");

      })
      .fail(function(response) {
        $("body").nimbleLoader("hide");
        var errormsg_final = (response.status == 400 || response.status == 500) ? connectkey.clean400ErrorResponseText(response.responseText) : failuremsg;
        connectkey.showMessage(errormsg_final, "error");
      })
    }

  }
}

/**********************************************
 *
 * Autofill Profile / ODBC Menu Edit / Add Page
 *
 **********************************************/

/*
 * changeDataSourceType
 * hides hosted database fields when switching to a database datasource type.
 * args:
 *  e (object) the event object. (in this case, onChange).
 */
connectkey.changeDataSourceType = function(e){
  var menu = e.target,
      val = $(menu).val(),
      port = $("#port"),
      dbfields = $("body").find(".db-only");

  if(val == "Microsoft Excel" || val == "Microsoft Access"){
    $(dbfields)
      .hide()
      .find("input")
        .removeClass("required")
        .removeClass("required_error")
        .attr('value','')
      .end()
      .find('p.fielderror').remove();

  }else{
    $(dbfields)
      .show()
      .find("input")
        .addClass("required");

    //assign default port based on chosen server-based database.
    if(val == "Oracle"){
      $(port).val("1521");
    }else if(val == "Postgresql"){
      $(port).val("5432");
    }else if(val == "Microsoft SQLServer"){
      $(port).val("1433");
    }
  }
}


/*
 * dsSetupWizNav
 * Navigates from the Data Source Connection Setup page to the Mapping Page (and vice versa)
 * args:
 *  e - (Object) Event Object (onclick)
 *  hidePanel - (String) CSS id of the Wizard Step Panel to hide (use # in front of id i.e. "#panelname")
 *  showPanel - (String) CSS id of the Wizard Step Panel to show  (use # in front of id i.e. "#panelname")
 *  tablelisturl - (String) The url to get the list of datasource tables/worksheets.
 *  columnlisturl - (String) The url to get the list of datasource table columns.
 */
connectkey.dsSetupWizNav = function(e, hidePanel, showPanel){
  var btn = e.target;
  if(btn.id == "dsBack"){
    $("#dsApply").hide();
    $("#dsBack").hide();
    $("#dsNext").show();
    $(hidePanel).hide();
    $(showPanel).show();
  }
}


/**
 * afpTogglePrimary
 * checking the use for autofill checkbox will assign a true/false value to the hidden field "Primary[]"
 * args:
 *  e (object) the event object. (in this case, onChange).
 */
connectkey.afpTogglePrimary = function(e){
  var cbx = e.target,
      input = $(cbx).next();

  if($(cbx).is(':checked')){
    $(input).val("true");
  }else{
    $(input).val("false");
  }
}


/*
 * updateDataSourceSettings
 * Looks up a new list of tables and refreshes the mapping list with columns from the first returned table.
 * When done, returns "error" or "success".
 * args:
 *  e (Object) Event object, onChange
 *  tablelisturl (String) The url string to retrieve the list of tables in the new data source.
 *  columnlisturl (String) The url string to retrieve the list of columns in the new table.
 *  emptyerrormarkup (String) Error markup for required but empty fields.
 *  invalidcharserrormarkup (String) Error markup when illegal characters are found in the name field.
 *  duplicatetitleerrormarkup (String) Error markup when a duplicate title was found.
 *  error_datasrc_conn (String) Error message for datasource connection error
 *  error_columns_conn (String) Error message for datasource table/worksheet column lookup error.
 */
connectkey.updateDataSourceSettings = function(e, hidePanel, showPanel, tablelisturl, columnlisturl, emptyerrormarkup, invalidcharserrormarkup, duplicatetitleerrormarkup, error_datasrc_conn, error_columns_conn){
  var dbname = $("#dbname").val(),
      dbhost = $("#host").val(),
      dbport = $("#port").val(),
      dbusername= $("#username").val(),
      dbpass= $("#password").val(),
      dbsource = $("#dataSource").val(),
      dbparams="&dbname="+dbname+"&host="+dbhost+"&port="+dbport+"&username="+dbusername+"&password="+dbpass+"&dataSource="+dbsource,
      modifiedFlag = $("#dsSetupWrapper").data("modifiedFlag"),
      validationError = connectkey.isWizardStepError(emptyerrormarkup, invalidcharserrormarkup, duplicatetitleerrormarkup);

  tablelisturl = tablelisturl+dbparams,
  columnlisturl = columnlisturl+dbparams;

  if(modifiedFlag === true){

    if(validationError === false){
      $("#dsNext").attr("disabled", "disabled");
      $("#dbconnpendingstatus").show();

      //load the table and columns for the following wizard page.
      connectkey.dsLoadTables(tablelisturl)
        .done(function(tables){
          connectkey.dsLoadColumns(columnlisturl, tables[0])
            .done(function(columns){
              //close error message if it is present.
              if($("msgbox")){connectkey.closeMessage();}
              $(hidePanel).hide();
              $(showPanel).show();
              $("#dsNext, #dbconnpendingstatus").hide().removeAttr("disabled");
              $("#dsBack, #dsApply").show();
              $("#dsSetupWrapper").data("modifiedFlag", false)
            })
            .fail(function(request){
              $("#dsNext").removeAttr("disabled");
              $("#dbconnpendingstatus").remove();
              connectkey.showMessage(error_columns_conn, "error");
            });
        })
        .fail(function(request){
          $("#dsNext").removeAttr("disabled");
          $("#dbconnpendingstatus").hide();
          connectkey.showMessage(error_datasrc_conn, "error");
        });
    }
  }else{
    $(hidePanel).hide();
    $(showPanel).show();
    $("#dsNext").hide();
    $("#dsBack, #dsApply").show();
  }
}


/*
 * changeDataSourceTable
 * Refreshes the mapping table with new columns from the newly selected table.
 * args:
 *  e (Object) Event object, onChange
 *  columnlisturl (String) The url string to retrieve the list of columns in the new table.
 *  columnlookuperror (String) The error shown to the user if the column lookup resource returned an error.
 */
connectkey.changeDataSourceTable = function(e, columnlisturl, columnlookuperror){
  var tablemenu = e.target,
      tablename = $(tablemenu).val(),
      currtable = $(tablemenu).attr("curval"),
      dbname = $("#dbname").val(),
      dbhost = $("#host").val(),
      dbport = $("#port").val(),
      dbusername= $("#username").val(),
      dbpass= $("#password").val(),
      dbsource = $("#dataSource").val(),
      doctype = $("#documentType").val(),
      dbparams="&dbname="+dbname+"&host="+dbhost+"&port="+dbport+"&username="+dbusername+"&password="+dbpass+"&dataSource="+dbsource,
      columnlisturl = columnlisturl+dbparams;

  $("#afpMappingTable-wrapper").nimbleLoader("show");

  // save currently selected doctype & autofill profile before the change...
  connectkey.saveAutofillMapping(currtable,doctype);

  // check to see if autofill mappings exist.  If they do, replace the page with them, if not grab new values.
  var autofillSavedMappings = connectkey.getAutofillSavedMapping(tablename,doctype);

  //stored mapping rows found...
  if(autofillSavedMappings != null){
    $("#afpMappingTable-wrapper").nimbleLoader("hide");
    $(tablemenu).attr("curval", tablename);

  //no fields found in storage, querying values from ODBC...
  }else{

    connectkey.dsLoadColumns(columnlisturl, tablename)
      .done(function(){
        $(tablemenu).attr("curval", tablename);
        $("#afpMappingTable-wrapper").nimbleLoader("hide");
      })
      .fail(function(response){
        connectkey.showMessage(columnlookuperror, "error");
        $("#afpMappingTable-wrapper").nimbleLoader("hide");
      });
  }
}


/*
 * changeDataSourceDocType
 * updates the mapping table with property choosers for the selected document type.
 * args:
 *  e - (Object)
 *  requiredPropsURL - (String) The data url to retrieve a list of required fields.
 *  optionalPropsURL - (String) The data url to retrieve a list of optional fields.
 *  columnlisturl - (String) The label for the required properties optgroup.
 *  propmenuselector - (String) The css selector for the property menu or menus to update the list of properties for.
 *  requiredPropsLoadError - {String} The error shown if the required properties could not be loaded.
 *  optionalPropsLoadError - {String} The error shown if the optional properties could not be loaded.
 *  dbColumnLoadError ${String} The error shown if the database could not be connected.
 */
connectkey.changeDataSourceDocType = function(e, requiredPropsURL, optionalPropsURL, columnlisturl, propmenuselector, requiredPropsLoadError, optionalPropsLoadError, dbColumnLoadError){

  var rpropsoptionsHTML = "",
      opropsoptionsHTML = "",
      doctypemenu = e.target,
      doctype = $(doctypemenu).val(),
      currdoctype = $(doctypemenu).attr("curval"),
      table = $("#table").val(),
      requiredPropsURL = requiredPropsURL+doctype,
      optionalPropsURL = optionalPropsURL+doctype,
      dbname = $("#dbname").val(),
      dbhost = $("#host").val(),
      dbport = $("#port").val(),
      dbusername= $("#username").val(),
      dbpass= $("#password").val(),
      dbsource = $("#dataSource").val(),
      doctype = $("#documentType").val(),
      dbparams="&dbname="+dbname+"&host="+dbhost+"&port="+dbport+"&username="+dbusername+"&password="+dbpass+"&dataSource="+dbsource,
      columnlisturl = columnlisturl+dbparams;



  $("#afpMappingTable-wrapper").nimbleLoader("show");

  // save currently selected doctype & autofill profile before the change...
  connectkey.saveAutofillMapping(table,currdoctype);
  // check to see if autofill row mappings exist.  If they do, replace the page with them, if not grab new values from ODBC source.
  var autofillSavedMappings = connectkey.getAutofillSavedMapping(table,doctype);


  if(autofillSavedMappings != null){
    $("#afpMappingTable-wrapper").nimbleLoader("hide");
    $(doctypemenu).attr("curval", doctype);

  }else{
    connectkey.dsLoadColumns(columnlisturl, table).done(function(){

    $.get(requiredPropsURL)
      .done(function(responseText){
          $(responseText).each(function(i, rprop){
            if(rprop["menu"] == ""){ //don't use DocuShare menu properties.
              rpropsoptionsHTML = rpropsoptionsHTML + "<option value='"+rprop["value"]+"'>"+rprop["label"]+"</option>";
            }
          });

          $.get(optionalPropsURL)
            .done(function(responseText){
              $(responseText).each(function(i, oprop){
                if(oprop["menu"] == ""){ //don't use DocuShare menu properties.
                  opropsoptionsHTML = opropsoptionsHTML + "<option value='"+oprop["value"]+"'>"+oprop["label"]+"</option>";
                }
              });

              //get required properties
              $(propmenuselector+" optgroup.dsprops-reqfields").each(function(i, reqpropgroup){
                $(reqpropgroup).empty().append(rpropsoptionsHTML);
              });

              //get optional properties
              $(propmenuselector+" optgroup.dsprops-optionalfields").each(function(i, optpropgroup){
                $(optpropgroup).empty().append(opropsoptionsHTML);
              });

              $("#afpMappingTable-wrapper").nimbleLoader("hide");
              $(doctypemenu).attr("curval", doctype);

             })
            .fail(function(){
              connectkey.showMessage(optionalPropsLoadError, "error");
              $("#afpMappingTable-wrapper").nimbleLoader("hide");
            })
        })
        .fail(function(){
          connectkey.showMessage(requiredPropsLoadError, "error");
          $("#afpMappingTable-wrapper").nimbleLoader("hide");
        })


      })
      .fail(function(){
        connectkey.showMessage(dbColumnLoadError, "error");
        $("#afpMappingTable-wrapper").nimbleLoader("hide");
      })
  }
}


/*
 * changeDataSourceTable
 * Refreshes the mapping table with new columns from the newly selected table.
 * args:
 *  e (Object) Event object, onChange
 *  columnlisturl (String) The url string to retrieve the list of columns in the new table.
 */
connectkey.changeDataSourceTableODBC = function(e, columnlisturl){
  var tablemenu = e.target,
      tablename = $(tablemenu).val(),
      dbname = $("#dbname").val(),
      dbhost = $("#host").val(),
      dbport = $("#port").val(),
      dbusername= $("#username").val(),
      dbpass= $("#password").val(),
      dbsource = $("#dataSource").val(),
      dbparams="&dbname="+dbname+"&host="+dbhost+"&port="+dbport+"&username="+dbusername+"&password="+dbpass+"&dataSource="+dbsource,
      columnlisturl = columnlisturl+dbparams;

  connectkey.dsLoadColumns(columnlisturl, tablename)
    .done(function(){
      $(tablemenu).attr("curval", tablename);
      $("#afpMappingTable-wrapper").nimbleLoader("hide");
    })
    .fail(function(response){
      connectkey.showMessage("Could not load the database columns.", "error");
      $("#afpMappingTable-wrapper").nimbleLoader("hide");
    });
}


/**
 * changeDataSourceDocTypeODBC
 * For the ODBC menu page, changes the properties menu after a new doctype has been selected.
 * @param  {Object} e                The onChange event for the Doctype select menu.
 * @param  {String} requiredPropsURL The URL of the resource to retrieve required properties for the selected doctype.
 * @param  {String} optionalPropsURL The URL of the resource to retrieve optional properties for the selected doctype.
 * @param  {String} propmenuselector The CSS selector for the property selection menu.
 * @param  {String} requiredPropsLoadError Error message shown if the required properties resource fails to load.
 * @param  {String} optionalPropsLoadError Error message shown if the optional properties resource fails to load.
 */
connectkey.changeDataSourceDocTypeODBC = function(e, requiredPropsURL, optionalPropsURL, propmenuselector, requiredPropsLoadError, optionalPropsLoadError){
  var rpropsoptionsHTML = "",
      opropsoptionsHTML = "",
      doctypemenu = e.target,
      doctype = $(doctypemenu).val(),
      requiredPropsURL = requiredPropsURL+doctype,
      optionalPropsURL = optionalPropsURL+doctype;

    $.get(requiredPropsURL)
      .done(function(responseText){

          $(responseText).each(function(i, rprop){
            if(rprop["menu"] == ""){ //don't use DocuShare menu properties.
              rpropsoptionsHTML = rpropsoptionsHTML + "<option value='"+rprop["value"]+"'>"+rprop["label"]+"</option>";
            }
          });

          $.get(optionalPropsURL)
            .done(function(responseText){

              $(responseText).each(function(i, oprop){
                if(oprop["menu"] == ""){ //don't use DocuShare menu properties.
                  opropsoptionsHTML = opropsoptionsHTML + "<option value='"+oprop["value"]+"'>"+oprop["label"]+"</option>";
                }
              });

              //get required properties
              $(propmenuselector+" optgroup.dsprops-reqfields").each(function(i, reqpropgroup){
                $(reqpropgroup).empty().append(rpropsoptionsHTML);
              });

              //get optional properties
              $(propmenuselector+" optgroup.dsprops-optionalfields").each(function(i, optpropgroup){
                $(optpropgroup).empty().append(opropsoptionsHTML);
              });

              $("#afpMappingTable-wrapper").nimbleLoader("hide");
              $(doctypemenu).attr("curval", doctype);

             })
            .fail(function(){
              connectkey.showMessage(optionalPropsLoadError, "error");
              $("#afpMappingTable-wrapper").nimbleLoader("hide");
            })
      })
      .fail(function(){
        connectkey.showMessage(requiredPropsLoadError, "error");
        $("#afpMappingTable-wrapper").nimbleLoader("hide");
      })
}


/*
 * dsLoadTables
 * loads the columns of the selected table in the selected database.
 */
connectkey.dsLoadTables = function(url){
  var table = $("#table").val();
  return $.get(url, function(responseJson){
    $("#table")
      .empty()
      .attr("curval", responseJson[0]);

    $(responseJson).each(function(i,el){
      $("#table").append("<option value='"+el+"'>"+el+"</option>");
    })
  });
}


/*
 * dsLoadColumns
 * loads the columns of the selected table in the selected database.
 * args:
 *  url: (String) The URL to get the list of columns
 *  table: (string) Optional.  The name of the table/worksheet to retrieve columns for.
 */
connectkey.dsLoadColumns = function(url, table){

  var tablename = (table) ? table : $("#table").val(),
      url = url+"&table="+tablename,
      bodyid = $("body").attr("id");

  var xhr = $.get(url, function(responseJson){
    if(bodyid == "AutofillProfile"){

      $("#afp-mapping-tbody").empty();
      $(responseJson).each(function(i, colname){
        var rowmarkup = $('#afp-mapping-tbody-template tr').clone();
        $(rowmarkup).find("select").removeAttr("disabled");
        $(rowmarkup).find(".column-name").append(colname);
        $(rowmarkup).find(".columnNames").val(colname);
        $(rowmarkup).appendTo('#afp-mapping-tbody');
      });

    }else if(bodyid == "SimpleDataSourceMenu"){
      $("#columnvalue").empty();
      $("#columnlabel").empty();
      $(responseJson).each(function(i,el){
        $("#columnvalue").append("<option value='"+el+"'>"+el+"</option>");
        $("#columnlabel").append("<option value='"+el+"'>"+el+"</option>");
      })
    }

  });

  return xhr;
}


/**
 * changeDataSourceProperty
 * Autofill Profile Add/Edit page. Handles behavior associated with selecting a property.
 * args:
 *  e (object) The event object (onchange) that fires when a propety menu is selected.
 */
connectkey.changeDataSourceProperty = function(e){
  var menu = e.target,
      menuval = $(menu).val(),
      preval = $(menu).attr("preval"),
      row = $(menu).closest("tr"),
      cname = $(row).find(".columnNames"),
      cprimary = $(row).find(".primary-hidden"),
      cbxprimary = $(row).find(".primary-ckbx"),
      propmenus = $("#afp-mapping-tbody select.dsProperty");

  if(menuval == ""){
   
    if($(propmenus).length > 1){
      //enable this menu's previoius selection in all other property menus.
      $(propmenus).each(function(i,el){
        if(el !== menu){ //this doesn't apply to the current menu.
          $(this).find("option[value='"+preval+"']").removeAttr("disabled");
        }
      });
    }

    $(cname).attr("disabled", "disabled");
    $(cprimary).attr("disabled", "disabled").val("false");
    $(row).removeClass("mapped");
    $(cbxprimary).attr("disabled", "disabled").removeAttr("checked", "checked");

  }else{
    if($(propmenus).length > 1){
      //disable this menu selection in all other property menus so it won't get reused.
      $(propmenus).each(function(i,el){
        if(el !== menu){ //this doesn't apply to the current menu.
          $(this).find("option[value='"+menuval+"']").attr("disabled", "disabled");
          $(this).find("option[value='"+preval+"']").removeAttr("disabled");
        }
      });
    }

    $(cname).removeAttr("disabled");
    $(cprimary).removeAttr("disabled");
    $(row).addClass("mapped");
    $(cbxprimary).removeAttr("disabled");
  }

  $(menu).attr("preval", menuval);
}


/**
 *  validateAutofillMapping
 *  disables empty fields so they don't post.  Also, validates that at least one mapped field is
 *  required for autofill, and at least two fields are mapped (one being required)
 *  args:
 *    noAutofillCbxsError (string) The error if no 'Use for Autofill' checkboxes were checked.
 *    twoMappedFieldMinimumError (String) The error if all mapped fields have been checked as required, or only one is mapped and is required.
 */
connectkey.validateAutofillMapping = function(noAutofillCbxsError, twoMappedFieldMinimumError){
  var primaryCount = $("#afpMappingTable-wrapper input[type='checkbox']:checked").length,
      mappedCount = $("#afpMappingTable-wrapper select option:selected[value!='']").length,
      errorflag = false,
      errormsg = "";

  //throw an error if no fields are marked required (primary)...
  if(primaryCount == 0){
    errormsg = noAutofillCbxsError;
    errorflag = true;
  }else{
    errorflag = false;
  }

  //make sure at least one autofill field is mapped, and one is mapped and is a primary key.
  if((mappedCount > 1) && (mappedCount > primaryCount)){
    //don't reset flag if this check is ok.
    errorflag = (errorflag == true) ? true : false;
  }else{
    errorflag = true;
    errormsg = (errormsg = "") ? twoMappedFieldMinimumError : (errormsg + " " + twoMappedFieldMinimumError);
  }

  //if there is an error, show message and return false.
  if(errorflag === true){
    connectkey.showMessage(errormsg, "error");
    return false;
  }else{
    //disabled unused select menus.
    $("#afpMappingTable-wrapper select").each(function(){
      if($(this).val() == ""){
        $(this).attr("disabled", "disabled");
      }
    });
    return true;
  }
}


/**
 *  saveAutofillMapping
 *  saves the property/column mapping settings for the selected table and doctype.
 *  args:
 *    table {String} the value of the table menu
 *    doctype {String} the value of the doctype menu
 */
connectkey.saveAutofillMapping = function(table, doctype){

  var afpMappedFields = $("#afp-mapping-tbody").children(),
      result = $.grep(connectkey.afpMappedFields, function(i){return (i.table == table && i.doctype == doctype);});

  //check to see if the currently selected table and doctype rows are already saved.
  if(result.length === 0){ // if table & doctype rows not found, adding it...
    connectkey.afpMappedFields.push({"table" : table, "doctype" : doctype, "tbodymarkup" : afpMappedFields});
  }else if(result.length === 1){  // table & doctype found, updating stored markup...
    result[0].tbodymarkup = afpMappedFields;
  }
}


/**
 *  getAutofillSavedMapping
 *  retrieves the property/column mapping settings for the selected table and doctype, or if it doesn't exist, return null.
 *  args:
 *    table {String} the value of the table menu
 *    doctype {String} the value of the doctype menu
 *  returns:
 *    null if no mapping exists or the saved table mapping markup if it exists.
 */
connectkey.getAutofillSavedMapping = function(table, doctype){

  var result = $.grep(connectkey.afpMappedFields, function(i){ return (i.table == table && i.doctype == doctype );}),
      markup = null;

  //check to see if the currently selected table and doctype rows are already saved.
  if(result.length === 1){  // table & doctype found, updating actual table markup on page...
    markup = result[0].tbodymarkup;
    $("#afp-mapping-tbody").empty().append(result[0].tbodymarkup);
  }

  return markup;
}