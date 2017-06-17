/***********************************************************
 *
 * Add/Edit MFD Button Page
 *
 ***********************************************************/

/**
 * toggleAdvancedDeviceOptions
 * Hides and shows the Advanced options section on the Add/Edit Service Button page.
 * @param  {String} e         the click event
 * @param  {String} hideLabel the hide section label
 * @param  {String} showLabel the show section label
 */
connectkey.toggleAdvancedDeviceOptions = function(e, hideLabel, showLabel){
  var btn = e.target,
      advanced_options = $("#advanced_settings"),
      display = $(advanced_options).css("display");


  if(display === "none"){
    $(advanced_options).css("display", "");
    $(btn).empty().append(showLabel);
  }else{
    $(advanced_options).css("display", "none");
    $(btn).empty().append(hideLabel);
  }
};

/**
 * initEditIconDialog
 * initializes the dialog UI widget that will display the edit service button icon form.
 * args:
 *  btn_updateIconLabel (string) - Apply button label.
 *  btn_cancelLabel (string) - Cancel button label.
 *  btn_closeTip (string) - Close (x) toolbar button tooltip.
 *  page (string) - the page the dialog is being initialized on. (either "AddButton" or "EditButton").
 */
connectkey.initEditIconDialog = function(btn_applyLabel, btn_cancelLabel, btn_closeTip, page){

  $("#updatebtnicon-dialog-form").dialog({
    autoOpen: false,
    height: 540,
    width: 650,
    modal: true,
    closeText: btn_closeTip,
    buttons: [
      {
        text: btn_applyLabel,
        id: "btn_editicon_apply",
        click: function(){

          //disable one or the other text fields depending on what was chosen...
          if($('#seticon_reset').is(':checked')){
            $("#icon_upload").attr("disabled", true);
            $("#icon_select").attr("disabled", true);
          }else if($('#seticon_upload').is(':checked')){
            $("#icon_upload").attr("disabled", false);
            $("#icon_select").attr("disabled", true);
          }else if($('#seticon_image').is(':checked')){
            $("#icon_upload").attr("disabled", true);
            $("#icon_select").attr("disabled", false);
          }

          if(page === "EditButton"){
            //ajax submit (via the ajaxform plugin)...
            $('#updateicon-form').submit();
            //close the dialog...
            $(this).dialog("close");
            $("body").nimbleLoader("show");

          }else{ // on the add page...

            //update page with current selection...
            var selradio =  $("input[name='action']:checked"),
                selval = selradio.val(),
                newval = selradio.attr("newval"),
                iconpreview = $("#iconpreview"),
                existingimgsrc = "";

            if(selval === "upload_icon"){
              newval = newval + " <code>" + $("#icon_upload").val() + "</code>";
              iconpreview.hide();
            }else if (selval === "select_icon"){

              existingimgsrc = $(".thumbnails div.selected img").attr("src");
              $("#iconimg").prop("src", existingimgsrc);
              iconpreview.show();
            }else{
              existingimgsrc = $("#defaultsrvbtnicon").prop("src");
              $("#iconimg").prop("src", existingimgsrc);
              iconpreview.show();
            }


            $("#iconsetting").html(newval);
            $(this).dialog("close");
          }

        }
      },
      {
        text: btn_cancelLabel,
        click: function(){
          $(this).dialog( "close" );

          if(page === "EditButton"){
            $('#updateicon-form').resetForm();
          }

        }
      }
    ],
    close: function() {
      $(this).dialog( "close" );
      $("#icon_upload").attr("disabled", false);
      $("#icon_select").attr("disabled", false);
    }
  });
};


connectkey.handleIconFormUploadField = function(){
  $("#seticon_upload").prop('checked', true);
  if(($("#icon_upload").val().length > 0) && $('#seticon_upload').is(':checked')){
    $("#btn_editicon_apply").prop('disabled', false);
  }else if($("#icon_upload").val().length > 0){
    $('#seticon_upload').attr("checked", "checked");

  }else{
    $("#btn_editicon_apply").prop('disabled', true);
  }
};


connectkey.handleIconFormSelectField = function(){
  $("#seticon_image").prop('checked', true);
  if(($("#icon_select").val().length > 0) && $('#seticon_image').is(':checked')){
    $("#btn_editicon_apply").prop('disabled', false);
  }else{
    $("#btn_editicon_apply").prop('disabled', true);
  }
};


/**
 * validateEditIconDialog
 * Edit and Add Service Button page: listens to radio button clicks in the edit icon popup.
 * and causes the apply button to be enabled or disabled for validation purposes.
 */
connectkey.validateEditIconDialog = function(){
  var radioval = $(this).val(),
      applybtn = $("#btn_editicon_apply"),
      fileuploadfield_val_length = $("#icon_upload").val().length,
      iconfiletxt_val_length = $("#icon_select").val().length;

  if (radioval === "upload_icon"){
    $("#icon_select").val(""); //reset the selected icon to nothing.
    if(fileuploadfield_val_length > 0){
      applybtn.prop('disabled', false);
    }else{
      applybtn.prop('disabled', true);
    }
  }else if(radioval === "select_icon"){
    if(iconfiletxt_val_length > 0){
      applybtn.prop('disabled', false);
    }else{
      applybtn.prop('disabled', true);
    }
  }else{
    applybtn.prop('disabled', false);
    $("#icon_select").val(""); //reset the selected icon to nothing.
  }
};


/**
 * submitIconEditForm
 * submits the icon edit/update form and performs an ajax post.
 */
connectkey.submitIconEditForm = function(response){
  $("#buttonId").val(response);
  $('#updateicon-form').submit();
  $("body").nimbleLoader("show");
};


/**
 * toggleGroupField
 * Add MFD button page only: toggles the visibility of Group auto-complete field.
 */
connectkey.toggleGroupField = function(){

  if($("#access_method").val() === "group"){
    $("#accessOptions").show();
    $("#groupHandleLabel").removeAttr("disabled").focus();
  }else{
    $("#accessOptions").hide();
    $("#groupHandle").val("");
    $("#groupHandleLabel").attr("disabled", "disabled").val("");
  }
};


/**
 * deleteButton
 * deletes a button using ajax and returns the user to the button listing page.
    args:
      e - (object) The event object (in this case, a button click)
      confirmmsg - (string) the warning message (i.e. "Are you sure you want to delete?")
      errormsg - (string) the error message if the operation failed.
      successmsg - (string) the success message if the operation succeeded.
      redirecturl - (string) the redirect url after a successful post has occured.
      posturl - (string) the url to post to for the delete action.
 */
connectkey.deleteButton = function(e, confirmmsg, errormsg, successmsg, redirecturl, posturl){
  e.preventDefault();
  if(confirm(confirmmsg)){
    if(redirecturl !== null){
      var buttonId = $("#buttonId").val();
      var data={buttonId : buttonId, action : "delete"};

      $.post(posturl, data, function() {
        window.location.href = redirecturl;
      })
      .fail(function(response) {
        var errormsg_final = (response.status === 400) ? connectkey.clean400ErrorResponseText(response.responseText) : errormsg;
        connectkey.showMessage(errormsg_final, "error");
      });


    }else{
      var btn = e.target,
          url = $(btn).attr("href"),
          row = $(btn).closest("tr");

      $("body").nimbleLoader("show");
      $.post(url, function() {
        $("body").nimbleLoader("hide");

        //Does button have children?... If so delete their row too...
        if($(row).next().prop("id")){ //child rows have id attributes...

          $(row).next().fadeOut(function(){  //fade out child row, then the parent row...
            $(row).next().remove();
            row.fadeOut(function(){
              $(row).remove();
              connectkey.showMessage(successmsg, "success");
            });
          });

        //otherwise, just delete the row of the button without children...
        }else{
          $(row).fadeOut(function(){
            row.remove();
            connectkey.showMessage(successmsg, "success");
          });
        }

      })
      .fail(function(response) {
        $("body").nimbleLoader("hide");
        var errormsg_final = (response.status === 400) ? connectkey.clean400ErrorResponseText(response.responseText) : errormsg;
        connectkey.showMessage(errormsg_final, "error");
      });

    }
  }
};