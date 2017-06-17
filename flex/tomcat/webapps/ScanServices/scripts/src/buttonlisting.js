/***********************************************************
 *
 * Configure Buttons Listing Page
 *
 ***********************************************************/

/**
 * toggleButtonChildrenList
 * Expands or collapse's a button's children list on the button listing page.
    args:
      e - (object) the event object (a button click).
      expandLabel - (object) the label for the button tree expand button.
      expandTip - (object)  the rollover tooltip for the expand button.
      collapseLabel - (object) the label for the collapse button.
      collapseTip - (object) the rollover tip for the collapse button.
 */
connectkey.toggleButtonChildrenList = function(e, expandLabel, expandTip, collapseLabel, collapseTip){
  var togglebtn = e.target;

  if($(togglebtn).hasClass("btn_collapse")){
    $(togglebtn).closest("tr").next().find("div.childrenwrapper").first().animate({opacity: 0, height:'toggle'},{easing: "swing",duration:"fast"});
    $(togglebtn)
      .removeClass("btn_collapse")
      .addClass("btn_expand")
      .attr("title", expandTip)
      .empty()
      .append(expandLabel);
  }else{
    $(togglebtn).closest("tr").next().find("div.childrenwrapper").first().animate({opacity: 1, height:'toggle'},{easing: "swing",duration:"fast"});
    $(togglebtn)
      .removeClass("btn_expand")
      .addClass("btn_collapse")
      .attr("title", collapseTip)
      .empty()
      .append(collapseLabel);
  }
};