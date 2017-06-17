/***********************************************************
 *
 * Form Validation Scripts
 *
 ***********************************************************/

/**
 * validateForm
 * Submits a form via AJAX and posts a success or error message and possibly redirects the user to another page.
 * args:
 *  e - (object) the event object
 *  generalerror - (string) a general form validation error message that appears at the top of the page.
 *  emptyerror - (string) the message that shows when an empty field has been found.
 *  successmsg - (string) the success message.
 *  failuremsg - (string) the failure message.
 *  redirecturl - (string) the url for the redirect after the form has successfully submitted.  Use null if no redirect is desired.
 *                         if just a page refresh is desired, use document.location for the value.
 *   callbackfunc - (function) Optional.  A function to run after the post has completed.  This is used if no redirect url is specified.
 *  presubmitfunc - (function) Optional. Returns true/false to this validator function.  A function that runs before the post has occured. Handles
 *                                       its own failure scenario (by putting up a message or something else.)
 *  failurecallbackfunc - (function) Optional. A function to run after a failed post has completed.
 *
 */
connectkey.validateForm = function(e, generalerror, emptyerror, successmsg, failuremsg, redirecturl, callbackfunc, presubmitfunc, failurecallbackfunc){
  e.preventDefault();
  var form = e.target,
      posturl = $(form).attr("action"),
      data = $(form).serialize(),
      errorflag = false;

  //check all required fields (that are not disabled)...
  $(".required[disabled!='disabled']").each(function(){
    //remove existing errors...
    $(this).parent().find(".error_empty").remove();

    if($(this).val() == ""){
      $(this).addClass("required_error");
      $(emptyerror).insertAfter($(this));

      //if already true, don't change it!
      connectkey.formErrorFlag = (connectkey.formErrorFlag === true) ? true : false;
      //empty required field causes the error flag to be true...
      errorflag = true;
    }else{
      $(this).removeClass("required_error");
      errorflag = (errorflag === true) ? true : false;
    }
  })

  //run presumbit function if one exists...
  //processes and then returns true or false to stop the form post.
  if(presubmitfunc != null){
    var presubmitPass = presubmitfunc;
  }

  //only sumbit if there is no presubmit function, or if there is, only if the presubmitPass is true.
  //the presubmit function must take care of its own custom error handling if it returns false.

  if((presubmitfunc && presubmitPass === true) || presubmitfunc == null){

      //submit if fields are all filled in.
      if(errorflag === false && connectkey.formErrorFlag===false){
       $("body").nimbleLoader("show");
        $.post(posturl, data)
          .success(function(response){
            if(redirecturl != null){ //redirect to the specified page...
              connectkey.showMessage(successmsg, "success");
              setTimeout(function(){
                window.location.href = redirecturl;
              },1500);
            }else{ //stay on same page
              if(callbackfunc != null){
                callbackfunc(response);
                $("body").nimbleLoader("hide");
                connectkey.showMessage(successmsg, "success");
              }else{
                $("body").nimbleLoader("hide");
                connectkey.showMessage(successmsg, "success");
              }
            }
          })
          .fail(function(response) {
            $("body").nimbleLoader("hide");
            var responseJSON = (response.responseText) ? jQuery.parseJSON(response.responseText) : "",
                errormsg = (typeof responseJSON == "string" && responseJSON != "") ? connectkey.clean400ErrorResponseText(responseJSON) : failuremsg;
            connectkey.showMessage(errormsg, "error");

            if (failurecallbackfunc != null) {
                failurecallbackfunc(response);
            } 

          })
      }else{
        connectkey.showMessage(generalerror, "error");
      }

  }
}


/**
 * isWizardStepError
 * On Autofill Profile & ODBC Menu Add pages, this validation check for fields - for empty required fields,
 * name fields that have illegal characters, and name fields using a duplicate name.
 * @param  {String} emptyerror The text to show (i.e. "Field cannot be empty.")
 * @param  {String} invalidCharsError Text to show when an invalid character error occurs.
 */
connectkey.isWizardStepError = function(emptyerror, invalidCharsError, duplicateTitleError){
  var errorflag = false,
      empty_errorflag = false,
      illchars_errorflag = false,
      duptitle_errorflag = false;
  
  //1. check all required fields (that are not disabled)...
  $(".required[disabled!='disabled']").each(function(){
    //if any empty field errors are visible, remove them.
    if($(this).hasClass("required_error")){
      connectkey.clearFieldErrors($(this));
    }
    //check for empty but required fields...
    if($(this).val() == ""){
      $(this).addClass("required_error");
      $(emptyerror).insertAfter($(this));

      //if already true, don't change it!
      empty_errorflag = true;
    }else{
      $(this).removeClass("required_error");
      empty_errorflag = (empty_errorflag === true) ? true : false;
    }
  });


  
  //2. check if the name field has illegal characters...
  var namefield = $("#name"),
      namefieldval = $(namefield).val(),
      regex = /[\'\"&<>]/; //regex for finding all characters except alphanumeric and spaces.

  //remove existing illegal character error message...
  $(namefield).parent().find("p.error_illegalchars").remove();

  if(regex.test(namefieldval)){
    $(namefield).addClass("illegalchars_error");
    $(invalidCharsError).insertAfter($(namefield));
    illchars_errorflag = true;
  }else{
    $(namefield).removeClass("illegalchars_error");
    illchars_errorflag = false;
  }
  

  //3. check if there is a duplicate title for the name field...
  var titleUsed = $.inArray(namefieldval, connectkey.usedtitles);

  //remove existing errors...
  $(namefield).parent().find("p.error_duplicatetitle").remove();

  if(titleUsed > -1){
    $(namefield).addClass("duplicate_error");
    $(duplicateTitleError).insertAfter($(namefield));
    duptitle_errorflag = true;
  }else{
    $(namefield).removeClass("duplicate_error");
    duptitle_errorflag = false;
  }

  if(empty_errorflag === true || illchars_errorflag == true || duptitle_errorflag == true){
    errorflag = true;
  }

  //check if the general error flag has been thrown...
  if (connectkey.formErrorFlag === true){
    errorflag = true;
  }

  return errorflag;
}


/**
 * clearFieldErrors
 * clears field errors when an auto-complete selection has been made.
 * args:
 *  field - (object) a reference to the form field element.
 */
connectkey.clearFieldErrors = function(field){
  var parent = $(field).parent();
  $(field).removeClass("required_error");
  $(parent).find('p.fielderror').remove();
}


/**
 * checkRequiredErrorField
 * checks to see if a required field with an error has been cleared of errors after it looses focus.
 * args:
 *  e - (object) the blur event object.
 */
connectkey.checkRequiredErrorField = function(e){
  var field = e.target;
  if ($(field).val() != ""){
    connectkey.clearFieldErrors(field);
  }
}


/**
 * showMessage
 * shows a message at the top of the page after an ajax post has completed or failed.
 * credit: http://stackoverflow.com/questions/2983899/does-jquery-have-a-plugin-to-display-a-message-bar-like-the-twitter-wrong-pas
 * args:
 *  message - (string) the success or failure message
 *  type - (string) the type of message, either "error" or "success".
 */
connectkey.showMessage = function(message, type){

  var msgclass = (type == "error") ? "msgbar_error" : "msgbar_success";
  if($("#msgbox")){$("#msgbox").remove()} //if messagebox exists, remove it.

  if(type == "success"){
    $("<div />", { 'class': msgclass, text: message, 'id': 'msgbox' }).hide().prependTo("body")
      .slideDown('fast').delay(10000).slideUp(function() { $(this).remove(); });
  }else{
    $("<div />", { 'class': msgclass, text: message, 'id': 'msgbox' }).hide().prependTo("body").slideDown('fast').append($("<div />", {"class": "btn_msgclose", text: "x"}));
  }
}


/**
 * closeMessage
 * closes the message box.
 */
connectkey.closeMessage = function(){

  $("#msgbox").slideUp(function() { $(this).remove(); });
}
