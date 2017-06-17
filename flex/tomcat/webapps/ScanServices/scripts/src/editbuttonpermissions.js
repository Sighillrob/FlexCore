/***********************************************************
 *
 * Edit Button Permission Page
 *
 ***********************************************************/

/**
 * toggleAccessOptions
 * Edit Permissions Page Only.  Toggles the access options section.
 *  args:
 *    menu - (object) the Access Method select menu.
 *    btntype - (string) the button type being edited ("mfd", "folder", or "scan")
 */
connectkey.toggleAccessOptions = function(menu, btntype){
  var val = $(menu).val();

  if(val === "guest"){
    $("#accessOptions").hide();
    if (btntype === "mfd"){
      $("#groupHandleLabel").removeClass("required"); //remove required class
      $("#groupHandle").val(""); ///...and empty value...
      connectkey.clearFieldErrors($("#groupHandleLabel")); //remove any field error styling or messages...
    }else{
      $("#groupHandleLabel").removeClass("required"); //remove required class
      $("#access_inherit").attr("disabled", "disabled");
      $("#access_specific").val("").prop('checked',true); ///...and empty value and select...
      connectkey.clearFieldErrors($("#groupHandleLabel")); //remove any field error styling or messages...
    }
  }else{ // group access
    $("#accessOptions").show();
    if (btntype === "mfd"){
      $("#groupHandleLabel").addClass("required").removeAttr("disabled").focus();
    }else{ //when switching to group access for folder or scan buttons, always make the inherit option selected by default.
      $("#access_inherit").removeAttr("disabled").prop("checked", true);
    }
  }
};


/**
 * toggleGroupRequired
 * Edit Permissions Page Only.  Toggles whether or not the specific group textbox is required.
 * It is not if the inherit from parent option is selected.
 */
connectkey.toggleGroupRequired = function(){

  if($(this).is(":checked") && $(this).attr("id") === "access_specific"){
    $('#groupHandleLabel').addClass("required");
  }else{
    $('#groupHandleLabel').removeClass("required");
    connectkey.clearFieldErrors($("#groupHandleLabel"));
  }
};