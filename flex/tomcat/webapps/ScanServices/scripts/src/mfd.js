/***********************************************************
 *
 * Multifunction Device Listing Page & Add/Edit Page
 *
 ***********************************************************/

/**
 * selectAllCheckboxes
 * selects all devices on the Configure Devices listing pages.
 */
connectkey.selectAllCheckboxes = function(e){
  var cbx = e.target,
      cbx_state = ($(cbx).prop("checked")) ? true : false;

  $(".objectlist tbody").find("input[type=checkbox]").prop('checked', cbx_state);
  connectkey.toggleSelectedActionBtns();
};


/**
 * toggleSelectedActionBtns
 * toggles the selected buttons to only display when a device has been selected.
 */
connectkey.toggleSelectedActionBtns = function(){
  var n = $(".objectlist tbody input:checked").length;
  var total = $(".objectlist tbody input").length;

  if(n > 0){
    $("#selectedbtns").show();
  }else{
    $("#selectedbtns").hide();
  }

  //show the all checkboxes checked or unchecked if the list checkboxes are all checked or not.
  if(total > n){
    $("#chkbx_selectAllDevices").prop("checked", false);
  }else{
    $("#chkbx_selectAllDevices").prop("checked", true);
  }
};


/**
 * deleteDevice
 * deletes a device using ajax and returns the user to the button listing page.
 * args:
 *   e - {Object} the event object.
 *   context - {String} Either "editpage" or "listpage" - lets the function know what page the action is coming from.
 *   deleteurl - {String} the url to point the post to. Set to null if extracting from a hyperlink.
 *   confirmmsg - {String} the confirm message i.e. "Are you sure?"
 *   successmsg - {String} the delete success message.
 *   failuremsg - {String} the delete failure message.
 *   redirecturl - {String} the redirect url after the delete has successfully completed.  assign null if not desired.
 */
connectkey.deleteDevice = function(e, context, deleteurl, confirmmsg, successmsg, failuremsg, redirecturl){
  e.preventDefault();

  if(confirm(confirmmsg)){
    if(context === "editpage"){
      var deviceId = $("#deviceId").val();
      var data={"deviceId[]" : deviceId, "action" : "delete"};

      $("body").nimbleLoader("show");

      $.post(deleteurl, data, function() {
        window.location.href = redirecturl;
      })
      .fail(function() {
        $("body").nimbleLoader("hide");
        connectkey.showMessage(failuremsg, "error");
      });


    }else if(context === "listpage"){
      var btn = e.target,
          row = $(btn).closest("tr");
      deleteurl = $(btn).attr("href");

      $("body").nimbleLoader("show");

      $.post(deleteurl, function() {
        $(row).fadeOut(function(){row.remove();});
        $("body").nimbleLoader("hide");
        connectkey.showMessage(successmsg, "success");

      })
      .fail(function() {
        $("body").nimbleLoader("hide");
        connectkey.showMessage(failuremsg, "error");
      });
    }

  }
};


/**
 * deleteSelectedDevices
 * deletes all the selected devices on the Configure Devices listing pages.
 * args:
 *  deleteurl - (string) the post url for the delete operation.
 *  confirmmsg - (string) the confirm message i.e. "Are you sure??!"
 *  successmsg - (string) the success message.
 *  failuremsg - (string) the failure message.
 */
connectkey.deleteSelectedDevices = function(deleteurl, confirmmsg, successmsg, failuremsg){

  var isOnlyDevice = (document.getElementsByName("deviceId[]").length > 1) ? false : true;

  if(confirm(confirmmsg)){
    var data = $("#devicelistform").serialize();
        data = data+"&action=delete";

    $("body").nimbleLoader("show");

    $.post(deleteurl, data, function() {

      if(isOnlyDevice === true){
        connectkey.showMessage(successmsg, "success");
        setTimeout(function(){
          location.reload(true); //reload page...
        }, 2000);

      }else{  // just remove the row of the deleted device.
        $(".objectlist tbody input:checked").closest("tr").fadeOut(function(){$(this).remove();});
        //if the select All checkbox was checked... uncheck it.
        $("#chkbx_selectAllDevices:checked").prop('checked', false);
        //hide loader..
        $("body").nimbleLoader("hide");
        connectkey.showMessage(successmsg, "success");
      }

    })
    .fail(function(response) {
      $("body").nimbleLoader("hide");
      var errormsg_final = (response.status === 400) ? connectkey.clean400ErrorResponseText(response.responseText) : failuremsg;
      connectkey.showMessage(errormsg_final, "error");
    });
  }
};


/**
 * loadAssignButtonsForm
 * Initializes the dialog for the reassign buttons action.
 * args:
 *  errormsg (string) Error message if assignment action partially or completely fails.
 *  successmsg (String) Success message if assignment action succeeds without a reassignment failure on any selected device.
 *  updateBtnLabel (string) the "Update Assignment" button label.
 *  cancelBtnLabel (string) the "Cancel" button label.
 *  closeBtnTip (string) the x (close) titlebar button title tip text.
 */
connectkey.loadAssignButtonsForm = function(errormsg, successmsg, updateBtnLabel, cancelBtnLabel, closeBtnTip){

  $("#dialog-form-editbuttons").dialog({
    autoOpen: false,
    height: 350,
    width: 600,
    modal: true,
    closeText: closeBtnTip,
    buttons: [
      {
        text: updateBtnLabel,
        id: "btn_dialog_updateAssignments",
        click: function() {
          $(this).dialog( "close" );
          connectkey.reassignMultipleDeviceBtns(errormsg, successmsg);
          $(this).find("input[type=checkbox]").prop('checked', false);
        }
      },
      {
        text: cancelBtnLabel,
        click: function(){
          $(this).dialog( "close" );
          $(this).find("input[type=checkbox]").prop('checked', false);
        }
      }
    ],

    close: function() {
      $(this).dialog( "close" );
    },

    open: function(){
      //hide update button if no buttons are in the system...
      if($("#servicebtnlist").length === 0){ // check for existence of button list...
        $("#btn_dialog_updateAssignments").hide();
      }

      //if only one device is selected, make the button selections reflect the current selection of that button instead of leaving blank.
      var deviceCheckedList = $(".objectlist tbody input:checked");
      if(deviceCheckedList.length === 1){
         var buttonIdArray = deviceCheckedList.data("buttonArray");
         $(buttonIdArray).each(function(index, val){
           var selector = "#servicebtnlist input[value='" +val+ "']";
           $(selector).prop("checked", "checked");
         });

      }

    }
  });
};


/**
 * reassignMultipleDeviceBtns
 * Gathers form data and posts the reassign buttons to multiple devices operation.
 * args:
 *  errormsg (String) Error message if assignment action partially or completely fails.
 *  successmsg (String) Success message if assignment action succeeds without a reassignment failure on any selected device.
 */
connectkey.reassignMultipleDeviceBtns = function(errormsg, successmsg){

  var data = $("#devicelistform").serialize(),
      posturl = $("#buttonlistform").attr("action");
  
  data = data+"&"+$("#buttonlistform").serialize();
      

  $("body").nimbleLoader("show");

  $.post(posturl, data, function() {
    connectkey.showMessage(successmsg, "success");
    setTimeout(function(){
      location.reload(true);
    }, 2000);

  })
  .fail(function(response) {
    $("body").nimbleLoader("hide");
    var responseJSON = jQuery.parseJSON(response.responseText);

    if (typeof responseJSON === "object"){ // a list of failed devices is returned in a json object.
      connectkey.loadFailedButtonAssignmentDialog(responseJSON);
      connectkey.showMessage(errormsg, "error");
    }else if (typeof responseJSON === "string"){  // just an error string was returned.
      connectkey.showMessage(responseJSON, "error");
    }
  });
};


/**
 * loadCSVImportForm
 * initializes the dialog UI widget that will display the csv file upload form.
 * args:
 *  btn_importCSVLabel (string) - Upload button label
 *  btn_cancelLabel (string) - Cancel button label
 *  btn_closeTip (string) - Close (x) toolbar button tooltip.
 */
connectkey.loadCSVImportForm = function(btn_importCSVLabel, btn_cancelLabel, btn_closeTip){

  $("#dialog-form-csvupload").dialog({
    autoOpen: false,
    height: 230,
    width: 550,
    modal: true,
    closeText: btn_closeTip,
    buttons: [
      {
        text: btn_importCSVLabel,
        id: "btn_csvimport_import",
        click: function(){
          $("#csvuploadform").submit();
          $(this).dialog("close");
          $("body").nimbleLoader("show");
        }
      },
      {
        text: btn_cancelLabel,
        click: function(){
          $(this).dialog( "close" );
        }
      }
    ],
    create: function(){
      //disable import button until the file field has been filled in...
      $("#btn_csvimport_import").prop('disabled', true);
      $("#fileupload").change(function(){
        if($("#fileupload").val().length > 0){
          $("#btn_csvimport_import").prop('disabled', false);
        }
      });
    },
    close: function() {
      $(this).dialog( "close" );
    }
  });
};


/**
 * initFailedButtonReassignDialog
 * initializes the dialog UI widget that will display a list of devices that failed button reassignment..
 * args:
 *  btn_closeLabel (string) - dialog close button label.
 *  btn_closeTip (string) - Close (x) toolbar button tooltip.
 */
connectkey.initFailedButtonReassignDialog = function(btn_closeLabel, btn_closeTip){

  $("#dialog-failedbtnreassign").dialog({
    autoOpen: false,
    height: 330,
    width: 550,
    modal: true,
    dialogClass: "alert",
    closeText: btn_closeTip,
    buttons: [
      {
        text: btn_closeLabel,
        click: function(){
          location.reload(true); // need to reload the page to show any changes of successful button assignments.
          //$(this).dialog("close");
        }
      }
    ],
    close: function() {
      location.reload(true); // need to reload the page to show any changes of successful button assignments.
      //$(this).dialog( "close" );
    }
  });
};


/**
 * loadFailedButtonAssignmentDialog
 * opens the failed devices listing dialog and loads the list of failed devices into a table.
 * args:
 *  responseJSON (object) array object of devices that failed to have their buttons reassigned.
 */
connectkey.loadFailedButtonAssignmentDialog = function(responseJSON){

    $('#failedbtnreassignlist_tbody').empty(); //empty the current property rows...
    connectkey.uncheckAllCbx(); //clear all checkboxes from the device listing...

    $.each(responseJSON, function(index, prop) {

      //clone row template
      var rowmarkup = $('#failedbtnreassignlist_rowtemplate tr').clone();

      //give the row an incrementing id value
      $(rowmarkup).attr("id", "id_"+prop['deviceId']);

      //insert link into the failed name cell...
      $(rowmarkup).find("#failed_name_ a")
        .attr("href", function(i,val){return val + prop['deviceId'];})
        .append(prop['mfd_name']);

      //insert id for failed name cell...
      $(rowmarkup).find("#failed_name_").attr("id", function(i,val){return val + prop['deviceId'];});

      //insert mfd ip/host address value to the td id value...
      $(rowmarkup).find("#failed_address_ code").append(prop['mfd_ip']);

      //insert ip address...
      $(rowmarkup).find("#failed_address_").attr("id", function(i,val){return val + prop['deviceId'];});

      //insert completed row into field list...
      $(rowmarkup).appendTo('#failedbtnreassignlist_tbody');

    });

    $("#dialog-failedbtnreassign").dialog("open");
};


/**
 * uncheckAllCbx
 * unchecks all the checkboxes on a page after page load.
 */
connectkey.uncheckAllCbx = function(){
  $('.objectlist input[type=checkbox]').prop('checked', false);
};


/**
 * initAjaxFileUploader
 * initializes the ajax file uploader control for the csv file upload form.
 * args:
 *  errorMsg (String) The generic error message if the import fails.
 */
connectkey.initAjaxFileUploader = function(errorMsg){
  $('#csvuploadform').ajaxForm({
    resetForm:true,
    success:function(){
      location.reload(true);
    },
    error:function(response){
      $("body").nimbleLoader("hide");
      if(response.status === 400){
        var errortext = connectkey.clean400ErrorResponseText(response.responseText);
        connectkey.showMessage(errortext , "error");
      }else{
        connectkey.showMessage(errorMsg, "error");
      }

    }
  });
};


/**
 * clean400ErrorResponseText
 * Stripts quotes, trims remaining whitespace, and removes the java class namespace from the error message.
 * args:
 *  errorText (string) The raw responseText that returns from the 400 Error.
 */
connectkey.clean400ErrorResponseText = function(errorText){
  var errorTextClean = errorText.replace(/\"/g, ""); // remove surrounding double quotes.

  if(typeof errorTextClean === "string"){
    return errorTextClean;
  }else{ //assumes a json object with a lable and value with a comma separating them.
    var errorTextOnly = errorTextClean.split(":")[1],
    finalerror = jQuery.trim(errorTextOnly);
    return finalerror;
  }
};