/***********************************************************
 *
 * ODBC Menu Listing Page
 *
 ***********************************************************/

/**
 * duplicateMenunameCheck
 * checks to see if a duplicate name of the same menu type exists.
 * @param  {Object} e              the onblur event object of the name field.
 * @param  {Array} existingtitles  an array of existing title strings.
 * @param  {String} duplicateerror the error message wrapped in a <p> element that goes behind the title field.
 */
connectkey.duplicateMenunameCheck = function(e,existingtitles,duplicateerror){
  var menu = e.target,
      menuval = $(menu).val(),
      titleUsed = $.inArray(menuval, existingtitles);

  //remove existing errors...
  $(menu).parent().find("p.error_duplicatetitle").remove();

  if(titleUsed > -1){
    $(menu).addClass("duplicate_error");
    $(duplicateerror).insertAfter($(menu));
    connectkey.formErrorFlag = true;
  }else{
    $(menu).removeClass("duplicate_error");
    connectkey.formErrorFlag = false;
  }
}


/**
 * illegalCharInMenuNameCheck
 * checks to see if a duplicate name of the same menu type exists.
 * @param  {Object} e the onblur event object of the name field.
 * @parem {String} invalidCharsError - the markup and text for the invalid characters error.
 */
connectkey.illegalCharInMenuNameCheck = function(e,invalidCharsError){
  var menu = e.target,
      menuval = $(menu).val(),
      regex = /[\'\"&<>~!@#$*()=:/,;?+]/; //regex for finding all characters except alphanumeric and spaces.

  //remove existing errors...
  $(menu).parent().find("p.error_illegalchars").remove();

  if(regex.test(menuval)){
    $(menu).addClass("illegalchars_error");
    $(invalidCharsError).insertAfter($(menu));
    connectkey.formErrorFlag = true;
  }else{
    $(menu).removeClass("illegalchars_error");
    connectkey.formErrorFlag = false;
  }
}


/**
 * deleteSelectedODBCMenus
 * deletes all the selected ODBC Menus on the ODBC Menu listing page.
 * args:
 *  deleteurl       {String} the post url for the delete operation.
 *  confirmmsg      {String} the confirm message i.e. "Are you sure??!"
 *  successmsg      {String} the success message.
 *  failuremsg      {String} the generic AJAX failure message.
 *  mappingerrormsg {String} the failure message displayed if the odbc menu is mapped to a dms or scan button.
 */
connectkey.deleteSelectedODBCMenus = function(deleteurl, confirmmsg, successmsg, failuremsg, mappingerrormsg){

  var isOnlyMenu = ($(".objectlist input[name='name[]']:checked").length > 1) ? false : true;

  if(confirm(confirmmsg)){
    var data = $("#datasourcemenulistform").serialize(),
        mappederror = false;
    
    data = data+"&action=delete";

    //determine if any items checked are used by a button or a dependent menu by 
    //checking its attributes hasscanbtn="true" or hasdms="false".
    $(".objectlist input:checked").each(function(i,el){
      if($(this).attr("hasscanbtn") == "true" || $(this).attr("hasdms") == "true"){
        mappederror= true;
        connectkey.showMessage(mappingerrormsg, "error");
        return false;
      }
    });

    if(mappederror === false){
      $("body").nimbleLoader("show");
      var xhr = $.post(deleteurl, data, function(response) {

        if(isOnlyMenu == false){
          connectkey.showMessage(successmsg, "success");
          setTimeout(function(){
            location.reload(true); //reload page...
          }, 2000);

        }else{  // just remove the row of the deleted AFPs.
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
 * deleteODBCMenu
 * deletes an ODBC Menu on the ODBC Menu listing page.
 * args:
 *   e - (object) the event object.
 *   context - (string) Either "editpage" or "listpage" - lets the function know what page the action is coming from.
 *   deleteurl - (string) the url to point the post to. Set to null if extracting from a hyperlink.
 *   confirmmsg - (string) the confirm message i.e. "Are you sure?"
 *   successmsg - (string) the delete success message.
 *   failuremsg - (string) the delete failure message.
 *   redirecturl - (string) the redirect url after the delete has successfully completed. Assign null if not desired.
 */
connectkey.deleteODBCMenu = function(e, context, deleteurl, confirmmsg, successmsg, failuremsg, redirecturl){
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