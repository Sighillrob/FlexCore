/***********************************************************
 *
 * Scan History Page
 *
 ***********************************************************/

/*
 * getScanHistory
 * gets the scan history log and populates a table listing on the Scan Logging page
 * args:
 *  url (string) the url of the scan log data source
 *  errormsg (string) the error message if there is no server response.
 *  numrecords (integar) the number of records to return.
 *  successmsg (string) Scan job success status string.
 *  failmsg (String) Scan Job failure status string.
 */
connectkey.getScanHistory = function(url, errormsg, numrecords, successmsg, failmsg){

  $("#page_body").nimbleLoader("show");

  $.get(url, function(data) {
    connectkey.renderScanLogTable(data, numrecords, successmsg, failmsg);
    $("#page_body").nimbleLoader("hide");
  })
  .fail(function(response) {
    $("#page_body").nimbleLoader("hide");
    var errormsg_final = (response.status === 400) ? connectkey.clean400ErrorResponseText(response.responseText) : errormsg;
    connectkey.showMessage(errormsg_final, "error");
  });
};


/*
 * updateScanPageSize
 * Updates the scan log page size value on the server and then refreshes the page.
 * args:
 *  form (string) The form id of the updateScanPageSize form
 *  errormsg (string) The error message if the form could not be submitted.
 *  url (string) The url to get the latest scans.
 *  successmsg (string) Scan job success status string.
 *  failmsg (String) Scan Job failure status string.
 */
connectkey.updateScanPageSize = function(form, errormsg, url, successmsg, failmsg){
  var updateform = $("#"+ form),
      posturl = updateform.attr("action"),
      data = updateform.serialize(),
      numrecords = $("#logpagesize").val();

  $("#page_body").nimbleLoader("show");

  $.post(posturl, data)
   .success(function(){
      connectkey.getScanHistory(url, errormsg, numrecords, successmsg, failmsg);
      $("#page_body").nimbleLoader("hide");
   })
   .fail(function(response){
      $("#page_body").nimbleLoader("hide");
      var errormsg_final = (response.status = 400) ? connectkey.clean400ErrorResponseText(response.responseText) : errormsg;
      connectkey.showMessage(errormsg_final, "error");
   });
};


/*
 * renderScanLogTable
 * renders the scan log table
 * args:
 *  data (Object) the returned data from the ajax call to retrieve the scan log.
 *  numrecords (integar) the number of records to return.
 *  successmsg (string) Scan job success status string.
 *  failmsg (String) Scan Job failure status string.
 */
connectkey.renderScanLogTable = function(data, numrecords, successmsg, failmsg){
  var numScans= $(data).length;


  if(numScans > 0){
    $("#scanLogList").empty();
    $.each(data, function(index, entry) {
      var rowmarkup = $('#scanLogList_template tr').clone(),
          status = (entry["status"] === true) ? successmsg : failmsg,
          rowclass = (entry["status"] === true) ? "" : "error";

      $(rowmarkup).addClass(rowclass);

      //insert required property label in first column
      $(rowmarkup).children("td.date").append(entry['date']);
      $(rowmarkup).children("td.coll").append(entry['collection']);
      $(rowmarkup).children("td.device").append(entry['device']);
      $(rowmarkup).children("td.btnname").append(entry['button']);
      $(rowmarkup).children("td.username").append(entry['username']);
      $(rowmarkup).children("td.status").append(status);

      //insert completed row into field list...
      $(rowmarkup).appendTo('#scanLogList');
      return index < numrecords;
    });

  }else{
    var rowmarkup = $('#scanLogList_empty tr').clone();
    $("#scanLogList").empty();
    $(rowmarkup).appendTo('#scanLogList');
  }
};