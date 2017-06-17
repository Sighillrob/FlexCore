//make a connectkey namespace to encapsulate all our connectkey functions...
var connectkey = {};


/**
 * docTypeFields
 * storage container - an array of cloned field table rows pertaining to the selected doctype and autofill profile.  This is a container to hold
 * the field data pertaining to a selected document type.  For example, a user may have selected "summary", "description" and
 * "author" as well as the required "title" properites, set their field values (such as default value, auto-increment, etc.) for the "Document"
 * document type, but then switched to another doctype (i.e. "invoice").  This holds those values so when the user selects the "Document"
 * doctype again, their values will be reloaded.
 *
 * format: (array of object literals)
 * [{"doctype": "Document", autofillprofile: "profile1", "tbodymarkup" : saved_html_markup}, {"doctype": "Invoice", autofillprofile: "profile2", "tbodymarkup" : saved_html_markup}]
 *
 */
connectkey.docTypeFields = [];


/**
 * afpMappedFields
 * storage container - an array of cloned field table rows pertaining to the selected odbc table and doctype for an autofill profile.  T
 * This is a container to hold the field data pertaining to a selected document type and odbc table.
 * For example, a user may have selected "summary", "description" and "author" and mapped them to the ODBC table columns: "column1", "column2", and "column3"
 * but then switched to another doctype (i.e. "invoice").  This holds those values so when the user selects the same ODBC table or doctype
 * again, their values will be reloaded.
 *
 * format: (array of object literals)
 * [{"table" : "table1", "doctype": "Document", "tbodymarkup" : saved_html_markup}, {"table" : "table2", "doctype": "Invoice", "tbodymarkup" : saved_html_markup}]
 *
 */
connectkey.afpMappedFields = [];


/**
 * a connectkey namespace global error flag variable for forms.
 * @type {Boolean}
 */
connectkey.formErrorFlag = false;

/* I.E. Needs to have this setting or else never fetches new data */
$.ajaxSetup({ cache: false });
//initialize the AJAX loading display plugin.
$.fn.nimbleLoader.setSettings({hasBackground : true });


/***********************************************************
 *
 * Global Functions
 *
 ***********************************************************/

// Global document.ready functions...
$(document).ready(function() {
  connectkey.initTooltips();
  $(document).on("click", "div.btn_msgclose", function(){connectkey.closeMessage();});
});

// Initialize tooltips...
connectkey.initTooltips = function(){
  $('.hastip, .actiontip, .cbxtip').smallipop({popupDistance:0, popupAnimationSpeed:0, popupDelay:500, popupYOffset:-20, hideDelay:0});
  $('.labeltip').smallipop({popupDistance:0, popupAnimationSpeed: 0, popupDelay:500, popupOffset:150, popupYOffset:-14, hideDelay:200});
  $('.menutip').smallipop({popupDistance:0, popupAnimationSpeed: 0, popupDelay:750, popupYOffset:-20, hideDelay:0});
};
