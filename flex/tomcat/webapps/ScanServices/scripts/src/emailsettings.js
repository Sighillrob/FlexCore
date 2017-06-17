/***********************************
 *
 * Email Setup Page
 *
 **********************************/

/**
 *  testEmailServerConnection
 *  Script that tests to see if the email server connection settings work.
 */
connectkey.testEmailServerConnection = function(){

  $("#emailmainformaction").attr("disabled","disabled");

  var testurl = $("#emailsendtestform").attr("action"),
      data = $("#EmailSetupForm").serialize() + "&"+ $("#emailsendtestform").serialize();

  $(".connstatus.wait").show();

  $.post(testurl, data)
    .success(function(){
      $(".connstatus.wait").hide();
      $(".connstatus.success").show();
      $("#emailmainformaction").removeAttr("disabled");
    })
    .fail(function(){
      $(".connstatus.wait").hide();
      $(".connstatus.failure").show();
      $("#emailmainformaction").removeAttr("disabled");
    });
};


/**
 * initSendTestEmailPopup
 * initializes send test email popup window.
 * args:
 *  errorMsg (String) The generic error message if the connection to the email server fails.
 */
connectkey.initSendTestEmailPopup = function(waitmsg, successmsg, errormsg, btn_closeTip, btn_closeLabel, btn_sendLabel){

  $("#dialog-form-emailsendtest").dialog({
    autoOpen: false,
    height: 280,
    width: 400,
    modal: true,
    closeText: btn_closeTip,
    buttons: [
      {
        text: btn_sendLabel,
        id: "btn_dialog_sendEmail",
        click: function() {
          //$(this).dialog("close");
          connectkey.testEmailServerConnection(waitmsg, errormsg, successmsg);
        }
      },
      {
        text: btn_closeLabel,
        click: function(){
          //location.reload(true); // need to reload the page to show any changes of successful button assignments.
          $(this).dialog("close");
          $('#emailsendtestform').resetForm();
          $(".connstatus").hide();
        }
      }
    ],
    close: function() {
      //location.reload(true); // need to reload the page to show any changes of successful button assignments.
      $(this).dialog( "close" );
      $('#emailsendtestform').resetForm();
      $(".connstatus").hide();
    },
    open: function(){
      $("#dialog-form-emailsendtest").keypress(function(e) {
        if (e.keyCode === $.ui.keyCode.ENTER) {
          return false;
        }
    });
    }
  });
};