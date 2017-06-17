/***********************************************************
 *
 * Dependent Menu Set Listing Page
 *
 ***********************************************************/

/**
 * deleteDMS
 * deletes an ODBC agent (ODBC menu, ODBC dependent menu profile, or autofill profile) using ajax and returns the user to the listing page.
 * args:
 *   e - (object) the event object.
 *   context - (string) Either "editpage" or "listpage" - lets the function know what page the action is coming from.
 *   deleteurl - (string) the url to point the post to. Set to null if extracting from a hyperlink.
 *   confirmmsg - (string) the confirm message i.e. "Are you sure?"
 *   successmsg - (string) the delete success message.
 *   failuremsg - (string) the delete failure message.
 *   redirecturl - (string) the redirect url after the delete has successfully completed. Assign null if not desired.
 */
connectkey.deleteDMS = function(e, context, deleteurl, confirmmsg, successmsg, failuremsg, redirecturl){
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


/**
 * deleteSelectedDSMs
 * deletes all the selected autofill profiles on the AFP listing page.
 * @param  {String} deleteurl       the post url for the delete operation.
 * @param  {String} confirmmsg      the confirm message i.e. "Are you sure??!"
 * @param  {String} successmsg      the success message.
 * @param  {String} failuremsg      the generic AJAX failure message.
 * @param  {String} mappingerrormsg the failure message shown if a dms is being used on a scan button.
 */
connectkey.deleteSelectedDSMs = function(deleteurl, confirmmsg, successmsg, failuremsg, mappingerrormsg){

  var isOnlyAFP = ($(".objectlist input[name='menuAgentId[]']:checked").length > 1) ? false : true;

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
      var xhr = $.post(deleteurl, data, function() {

        if(isOnlyAFP == false){
          connectkey.showMessage(successmsg, "success");
          setTimeout(function(){
            location.reload(true); //reload page...
          }, 2000);

        }else{  // just remove the row of the deleted device.
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
        var errormsg_final = (response.status == 400) ? connectkey.clean400ErrorResponseText(response.responseText) : failuremsg;
        connectkey.showMessage(errormsg_final, "error");
      });
    }
  }
}



/***********************************************************
 *
 * Dependent Menu Set Add/Edit Page
 *
 ***********************************************************/

/**
 * loadDMColumnValues
 * Loads the list of ODBC menus setup in the system and inserts them into the mapping table.
 * @param {Object} e           Event object of a menuAgent select menu (either the primary or any dependent menus)
 * @param {String} url         The url resource to get the list of options for the selected ODBC menu.
 * @param {String} columnsurl  The url resource to get the list of Columns in the selected ODBC Menu's selected table/worksheet.
 * @param {String} optionshelp The empty options message when a dependent menu's column value and label fields have not yet been selected.
 * @param {String} emptycolmenumsg The empty message when a column menu has no selection (e.g. "Select a column...")
 * @param {Object} chstr Column heading strings.  Contains an associated array of strings for different column heading strings:
 *      {
          "mapping" : "Mapping", // chstr.mapping
          "options" : "Options", // chstr.options
          "optscolsubheading" : "Label : Value", // chstr.optscolsubheading
          "columnforlabel" : "Column for Label", // chstr.columnforlabel
          "columnforvalue" : "Column for Value" // chstr.columnforvalue
        }
 */
connectkey.loadDMColumnValues = function(e, url, columnsurl, optionshelp, emptycolmenumsg, chstr){
  var menu              = e.target,
      menudoctyperaw    = $("option:selected", menu).attr("doctype"),
      menudoctype       = menudoctyperaw.replace(/\./g, "\\\."), //in falcon, property names have dots in them - add backslash in front "\."
      dbname            = "",
      host              = "",
      port              = "",
      username          = "",
      password          = "",
      dataSource        = "",
      table             = "",
      columnLabel       = "",
      options_tablerows = "",
      tablehead         = "",
      order             = 0,
      orderClass        = "",
      params            = "";

  url = url+e.target.value;

  $("#dependentMenuList select").each(function(i, el){
    if($(this).attr("id") == $(menu).attr("id")){
      order = i;
      orderClass = "dm-"+order;
    }
  })

  // Handle dependent menu mapping fields.
  if(order > 0){
    if($(menu).val() != ""){
      var nextMenu = $("#dependentMenuList select")[order+1];
      if(nextMenu){
        $(nextMenu).removeAttr("disabled", "disabled");
        $("option", nextMenu).show();
        $("option[doctype!="+menudoctype+"][doctype!='']", nextMenu).hide();
      }

    $(connectkey.menuAgents).each(function(i, el){
      if($(this)[0].name == menu.value){

        dbname     = $(this)[0].dbname,
        host       = $(this)[0].host,
        port       = $(this)[0].port,
        username   = $(this)[0].username,
        password   = $(this)[0].password,
        dataSource = $(this)[0].dataSource,
        table      = $(this)[0].table;

        params= "&dbname="+dbname+
                "&host="+host+
                "&port="+port+
                "&username="+username+
                "&password="+password+
                "&dataSource="+dataSource+
                "&table="+table;
      }
    });

    columnsurl += params;

    //clear existing menu settings, if any.
    $("#dmMappingTable").find("."+orderClass).remove();
    $("#dmMappingTable").find("."+orderClass).remove();
    //clear height assignements...
    $("#dmMappingTable").find("tbody td").height("inherit")

    $.get(columnsurl)
      .done(function(response){

        var optionshtml = '<option value="">'+emptycolmenumsg+'</option>';
        $(response).each(function(i, el){
          optionshtml += '<option value="'+el+'">'+el+'</option>'
        });

        var rowdatainfo = {
                            "data-dbname" : dbname,
                            "data-host" : host,
                            "data-port" : port,
                            "data-username" : username,
                            "data-password" : password,
                            "data-dataSource" : dataSource,
                            "data-table" : table,
                            "data-order" : order
                          },
            labelcell   = $("<td>").addClass("labelcell  "+orderClass).attr(rowdatainfo),
            valuecell   = $("<td>").addClass("valuecell "+orderClass).attr(rowdatainfo),
            labelselect = $("<select>").addClass("tablecolumn-label required").attr('name', 'columnLabel[]').append(optionshtml),
            valueselect = $("<select>").addClass("tablecolumn-value required").attr('name', 'columnName[]').append(optionshtml);

        //variables for 2nd+ level dependent menus

        $("#dmMappingTable_thead tr:first-child").append("<th colspan='2' class='"+orderClass+"'>"+e.target.value+" "+chstr.mapping+"</th><th rowspan='2' class='"+orderClass+"'>"+e.target.value+" "+chstr.options+"<span>"+chstr.optscolsubheading+"</span></th>");
        $("#dmMappingTable_thead tr:last-child").append("</th><th class='"+orderClass+"'>"+chstr.columnforlabel+"</th><th class='"+orderClass+"'>"+chstr.columnforvalue+"</th>");

        $("#dmMappingTable_tbody > tr").each(function(i, el){

          //1st level dependent menu...
          if(order == 1){
            $(this).append($(labelcell).clone().append($(labelselect).clone()));
            $(this).append($(valuecell).clone().append($(valueselect).clone()));
            $(this).append($("<td>").addClass("options nopadding "+orderClass).append("<p>"+optionshelp+"</p>"));

          //2nd+ dependent menus
          }else{

            var optscolumn = $(this).children().last();
            var opttables = optscolumn.children('table');
            var opttablesubtables = $(opttables).find("table");
            var subtablelength = $(opttablesubtables).length;

            //2nd dependent menu
            if(subtablelength == 0){

              var length = $(this).children().last().find("table tr").length;
              var labelcellwtable = $("<td>").addClass("labelcell nopadding "+orderClass).attr(rowdatainfo),
              valuecellwtable     = $("<td>").addClass("valuecell nopadding "+orderClass).attr(rowdatainfo),
              labeltable          = $("<table>"),
              labeltablerowshtml  = "",
              valuetable          = $("<table>"),
              valuetablerowshtml  = "",
              optionstable        = $("<table>"),
              optionscolumnrow    = "",
              optionstd           = $("<td>").addClass("options nopadding "+orderClass);

              for (i=0; i<length; i++){
                labeltablerowshtml += "<tr><td><select name='columnLabel[]' class='tablecolumn-label required'>"+optionshtml+"</select></td></tr>";
                valuetablerowshtml += "<tr><td><select name='columnName[]' class='tablecolumn-value required'>"+optionshtml+"</select></td></tr>";
                optionscolumnrow += '<tr><td class="options nopadding"><p>'+optionshelp+'</p></td></tr>';
              }

              $(labeltable).append(labeltablerowshtml);
              $(valuetable).append(valuetablerowshtml);
              $(optionstable).append(optionscolumnrow);
              $(this).append($(labelcellwtable).clone().append(labeltable));
              $(this).append($(valuecellwtable).clone().append(valuetable));
              $(this).append($(optionstd).clone().append(optionstable));

            }

          }

        }) // end each row
      })
      .fail(function(response){

      })

    //empty value for a dependent menu!
    }else{
      $("#dependentMenuList select").each(function(i, el){
        if(i >= order){
          $(this).val("");
          $(".dm-"+i).remove();
        }

        if(i > order){
          $(this).attr("disabled", "disabled");
        }
      });

    }
  }else{ // get primary menu values and put in the table.

    if($(menu).val() != ""){
      var nextMenu = $("#dependentMenuList select")[order+1];
      var finalMenu = $("#dependentMenuList select")[order+2];
      $(nextMenu).removeAttr("disabled", "disabled");
      $("option", nextMenu).show(); //reset
      $("option[doctype!="+menudoctype+"][doctype!='']", nextMenu).hide();
      $("option", finalMenu).show(); //reset
      $("option[doctype!="+menudoctype+"][doctype!='']", finalMenu).hide();

      $.get(url)
        .done(function(response){
          var options = response.split("||");
          for (i=0; i<options.length; i++){
            var label = options[i].split(":")[0];
            var value = options[i].split(":")[1];
            options_tablerows += '<tr><td class="options">'+label+' : '+value+
                                 '<input type="hidden" class="dm-1-keyLabel" name="keyLabel[]" value="'+label+'"/>'+
                                 '<input type="hidden" class="dm-1-keyValue" name="keyValue[]" value="'+value+'"/>'+
                                 '</td></tr>';
          }
          tablehead = "<tr><th rowspan='2'>"+e.target.value+" "+chstr.options+"<span>"+chstr.optscolsubheading+"</span></th></tr><tr></tr>";
          $("#dmMappingTable_thead").empty().append(tablehead);
          $("#dmMappingTable_tbody").empty().append(options_tablerows);
        })
        .fail(function(response){

        })

      }else{
        //remove the whole table tbody and thead contents...
        $("#dmMappingTable_thead, #dmMappingTable_tbody").empty();
        //reset the 1st and 2nd dependent menus to be set to none...
        $("#dependentMenuList select").each(function(i, el){
          if(i > 0){
            $("option", this).show();
            $(this).val("").attr("disabled","disabled").val(""); 
          }
        });

      }
  }
}


/**
 * loadDMRowValues
 * Loads the child dependent menu mapping settings for column value and label for each parent menu option.
 * @param  {Object} e           The event object, specifically the onchange event of any column value or label select menu in the mapping table.
 * @param  {String} rowsurl     URL to get the rows in the table given the column name.
 * @param  {String} columnsurl  URL to get the columns in a table given the table name.
 * @param  {String} optionshelp The empty options message when a dependent menu's column value and label fields have not yet been selected.
 * @param  {String} emptycolmenumsg The empty message when a column menu has no selection (e.g. "Select a column...")
 */
connectkey.loadDMRowValues = function(e, rowsurl, columnsurl, optionshelp, emptycolmenumsg){
  var menu         = e.target,
      parent       = $(menu).closest(".labelcell, .valuecell"),
      row          = $(parent).parent(),
      labelmenu    = "",
      valuemenu    = "",
      rowindex     = 0,
      labelmenutd  = "",
      valuemenutd  = "",
      prevoptiontd = "",
      optionstd    = "",
      menunum      = 0;

  //if the label menu was changed...
  if($(parent).hasClass("labelcell")){
    labelmenu   = $(menu);
    labelmenutd = $(menu).parent();
    if($(parent).next().children().first().prop("tagName") == "TABLE"){
      rowindex = $(menu).closest("tr").index(); //get the row index that the menu is inside...
      valuemenu   = $(parent).next().find("tr:eq("+rowindex +") select");
    }else{
      valuemenu   = $(parent).next().children().first();
    }
      valuemenutd = $(valuemenu).parent();

  //if the value menu was changed...
  }else if($(parent).hasClass("valuecell")){
    valuemenu   = $(menu);
    valuemenutd = $(menu).parent();
    if($(parent).prev().children().first().prop("tagName") == "TABLE"){
      rowindex = $(menu).closest("tr").index(); // get the row index that the menu is inside...
      labelmenu  = $(parent).prev().find("tr:eq("+rowindex +") select");
    }else{
      labelmenu  = $(parent).prev().children().first();
    }
    labelmenutd = $(labelmenu).parent();
  }

  optionstd = $(valuemenu).closest(".valuecell").next();
  prevoptiontd = $(labelmenu).closest(".labelcell").prev().children().first().children().first().children().eq(rowindex).children()

  var ggrandparent = $(menu).parents().get(2),
      ggrandparentId = $(ggrandparent).attr("id");

  if($(optionstd).children().first().prop("tagName") == "TABLE" && ggrandparentId != "dmMappingTable_tbody"){ //nested table in options row? (i.e. 2nd+ dependent menu)...
    optionstd = $(optionstd).children().first().children().first().children().eq(rowindex).children(); //get the nested td to put the option values inside...
  }

  var dbname      = $(parent).attr("data-dbname"),
      host        = $(parent).attr("data-host"),
      port        = $(parent).attr("data-port"),
      username    = $(parent).attr("data-username"),
      password    = $(parent).attr("data-password"),
      dataSource  = $(parent).attr("data-dataSource"),
      table       = $(parent).attr("data-table"),
      order       = parseInt($(parent).attr("data-order"))+1,
      column      = $(menu).val(),
      params      = "&dbname="+dbname+
                    "&host="+host+
                    "&port="+port+
                    "&username="+username+
                    "&password="+password+
                    "&dataSource="+dataSource+
                    "&table="+table+
                    "&column="+$(valuemenu).val()+
                    "&columnLabel="+$(labelmenu).val(),
      url         = rowsurl+params;

  if($(labelmenu).val().length > 0 && $(valuemenu).val().length > 0){
    
    $.get(url)
      .done(function(response){
        //$(optionstd).nimbleLoader("hide");
        if(response != ""){
          var optionstable = $("<table>");
          var optionshtml = "";

          $(response).each(function(i,el){
            if(order < 3){
              optionshtml += "<tr><td>" + $(this)[0].label + " : " + $(this)[0].value +
                             "<input type='hidden' class='dm-"+order+"-keyLabel' name='keyLabel[]' value='"+$(this)[0].label+"'/>"+
                             "<input type='hidden' class='dm-"+order+"-keyValue' name='keyValue[]' value='"+$(this)[0].value+"'/>"+
                             "</td></tr>";
            }else if(order == 3){
              optionshtml += "<tr><td>" + $(this)[0].label + " : " + $(this)[0].value + "</td></tr>";
            }

          });

          $(optionstable).append(optionshtml);
          $(optionstd).empty().append(optionstable); //empty, then put in new values.

          //resize columns if a 2nd dependent menu...
          var optionscell = $(valuemenu).closest(".valuecell").next();
          if($(optionscell).next().hasClass("labelcell")){
          }else{
            var optionstdheight = ($(optionstd).height()-10)+"px";
            $(labelmenutd).add(valuemenutd).add(prevoptiontd).height(optionstdheight);
          }
        }else{
          $(optionstd).empty().append("<p>"+optionshelp+"</p>");
        }

        var optionscell = $(valuemenu).closest(".valuecell").next();

        if($(optionscell).next().hasClass("labelcell")){
          connectkey.resetDMDecendentMenuMappings(row, optionscell, columnsurl, optionshelp, emptycolmenumsg);
        }

      })
      .fail(function(response){
      });
  
  }else{ // the user selected no value for either the value or the label menu...
    
    //empty options...
    $(optionstd).empty().append("<p>"+optionshelp+"</p>");
    var optionscell = $(valuemenu).closest(".valuecell").next();

    if(order == 2 && optionscell.next().length > 0){ //if this is the 1st dependent menu, and the 2nd is already setup... 
      connectkey.resetDMDecendentMenuMappings(row, optionscell, columnsurl, optionshelp, emptycolmenumsg);
    }else if(order == 2 && optionscell.next().length == 0){ //if this is the 1st dependent menu, and no 2nd is setup...
      labelmenutd.add(valuemenutd).add(prevoptiontd).height("");
    }else{ //if this is the 2nd dependent menu...
      var optionstdheight = (optionstd.height()-10)+"px";
      labelmenutd.add(valuemenutd).add(prevoptiontd).height(optionstdheight);
    }
  }
}


/**
 * resetDMDecendentMenuMappings
 * Clears downstream mappings when a label or value column select menu for a parent dependent menu has been changed.
 * @param  {Object} row         The row in the mapping table that is being reset.
 * @param  {Object} optionscell The cell the options will be displayed in based on the selected columns for value and label.
 * @param  {String} columnsurl  The URL that retrives a list of columns for a dependent menu based on its table value.
 * @param  {String} optionshelp The unassigned options cell message.
 * @param  {String} emptycolmenumsg The empty message when a column menu has no selection (e.g. "Select a column...")
 */
connectkey.resetDMDecendentMenuMappings = function(row, optionscell, columnsurl, optionshelp, emptycolmenumsg){
  var originalop  = optionscell,
      labelcell   = $(optionscell).next(),
      valuecell   = $(optionscell).next().next(),
      optionscell = $(optionscell).next().next().next(),
      dbname      = $(labelcell).attr("data-dbname"),
      host        = $(labelcell).attr("data-host"),
      port        = $(labelcell).attr("data-port"),
      username    = $(labelcell).attr("data-username"),
      password    = $(labelcell).attr("data-password"),
      dataSource  = $(labelcell).attr("data-dataSource"),
      table       = $(labelcell).attr("data-table"),
      params      = "&dbname="+dbname+
                    "&host="+host+
                    "&port="+port+
                    "&username="+username+
                    "&password="+password+
                    "&dataSource="+dataSource+
                    "&table="+table,
      url         = columnsurl+params;

  $(labelcell).empty().height("inherit");
  $(valuecell).empty().height("inherit");
  $(optionscell).empty().height("inherit");
  $(originalop).height("inherit");

  $.get(url)
    .done(function(response){

      var optionshtml = '<option value="">'+emptycolmenumsg+'</option>';

      $(response).each(function(i, el){
        optionshtml += '<option value="'+el+'">'+el+'</option>'
      });

      var length = $(originalop).find("table tr").length,
          labeltable = $("<table>"),
          labeltablerowshtml = "",
          valuetable = $("<table>"),
          valuetablerowshtml = "",
          optionstable = $("<table>"),
          optionscolumnrow = "";

      for (i=0; i<length; i++){
        labeltablerowshtml += "<tr><td><select class='tablecolumn-label required' name='columnLabel[]'>"+optionshtml+"</select></td></tr>";
        valuetablerowshtml += "<tr><td><select class='tablecolumn-value required' name='columnName[]'>"+optionshtml+"</select></td></tr>";
        optionscolumnrow += '<tr><td class="options nopadding"><p>'+optionshelp+'</p></td></tr>';
      }

      $(labeltable).append(labeltablerowshtml);
      $(valuetable).append(valuetablerowshtml);
      $(optionstable).append(optionscolumnrow);
      $(labelcell).append(labeltable);
      $(valuecell).append(valuetable);
      $(optionscell).append(optionstable);
    })
    .fail(function(response){

    })
}


/**
 * saveDMMappedFields
 * saves the mapped fields for the 1st and 2nd dependent menus.
 * @param  {String} updateurl   The menuagent update url that updates the mapping dependencies.
 * @param  {String} redirecturl The url to redirect the user to when the saving is complete.
 * @param  {String} successmsg  The success message when the menus have been saved.
 * @param  {String} failuremsg  The failure message when the menus could not be saved.
 */
connectkey.saveDMMappedFields = function(updateurl, redirecturl, successmsg, failuremsg){
  //1st dependent menu...
  var params = "&"+$("#dmMappingTable_tbody .dm-1 select, #dmMappingTable_tbody input.dm-1-keyLabel, #dmMappingTable_tbody input.dm-1-keyValue").serialize(),
      primarymenuval = "&primaryMenu="+$("#primaryMenu").val(),
      dm1val = "&dependentMenu="+$("#dependentMenu1").val(),
      profileName = $("#profileName").val(),
      data = primarymenuval+dm1val+params+"&action=updateDependencyMenu&agentType=dependentMenu&profileName="+profileName;

  var xhr = $.post(updateurl,data)
    .done(function(response){
      //2nd dependent menu...
      if($("#dependentMenu2").val() != ""){
        var params2 = "&"+$("#dmMappingTable_tbody .dm-2 select, #dmMappingTable_tbody input.dm-2-keyLabel, #dmMappingTable_tbody input.dm-2-keyValue").serialize(),
            parentdmval = "&primaryMenu="+$("#dependentMenu1").val(),
            thisdmval = "&dependentMenu="+$("#dependentMenu2").val(),
            data2 = parentdmval+thisdmval+params2+"&action=updateDependencyMenu&agentType=dependentMenu&profileName="+profileName;

        $.post(updateurl, data2)
          .done(function(){
            connectkey.showMessage(successmsg, "success");
            setTimeout(function(){
              window.location.href = redirecturl;
            },1500);
          })
          .fail(function(response){
            connectkey.showMessage(failuremsg, "error");
          })
      }else{
        connectkey.showMessage(successmsg, "success");
        setTimeout(function(){
          window.location.href = redirecturl;
        },1500);
      }

    })
    .fail(function(response){
      connectkey.showMessage(failuremsg, "error");
    })
}


/**
 * editpageAlignRows
 * aligns all rows if a 2nd dependent menu is present on page load.
 */
connectkey.editpageAlignRows = function(){
  $("#dmMappingTable_tbody > tr").each(function(i, row){
    var dm2opts = $(this).children().last().find(".nopadding"),
        optstd  = $(this).children().last();

    $(dm2opts).each(function(dm2_index, dm2opt){
      var d2optheight = $(dm2opt).height()-10;
          dm1values = $(optstd).prev().find("td")[dm2_index],
          dm1labels = $(optstd).prev().prev().find("td")[dm2_index];
          dm1opts = $(optstd).prev().prev().prev().find("td")[dm2_index];

      $(dm1values).height(d2optheight);
      $(dm1labels).height(d2optheight);
      $(dm1opts).height(d2optheight);
    })

  })
}