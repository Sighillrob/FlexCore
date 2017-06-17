/*
 * ScrollPane object
 * Creates a scrollable panel with an up and down button.
 *
 * Instantation Example:
 *     var myScrollpanel = new ScrollPane({
 *       windowPanelId : "treeScrollPaneWindow",
 *       contentId : "treeScrollPaneContent",
 *       buttonContainerId : "treeScrollPaneBtns",
 *       buttonUpId : "btn_treeScrollPane_up",
 *       buttonUpDisabledId : "btn_treeScrollPane_up_disabled",
 *       buttonDownId : "btn_treeScrollPane_down",
 *       buttonDownDisabledId: "btn_treeScrollPane_down_disabled",
 *       fadeOutTopId : "treeFadeOutTop",
 *       fadeOutBottomId : "treeFadeOutBottom",
 *       buffer : 57
 *     });
 */
function ScrollPane(options)
{
	this.windowPanel = document.getElementById(options.windowPanelId);
	this.content = document.getElementById(options.contentId);
  this.buttonContainer = document.getElementById(options.buttonContainerId);
	this.buttonUp = document.getElementById(options.buttonUpId);
	this.buttonUp_disabled = document.getElementById(options.buttonUpDisabledId);
  this.buttonDown = document.getElementById(options.buttonDownId);
  this.buttonDown_disabled = document.getElementById(options.buttonDownDisabledId);
  this.fadeOutTop = document.getElementById(options.fadeOutTopId);
  this.fadeOutBottom = document.getElementById(options.fadeOutBottomId);
	this.buffer = options.buffer;

	if(this.windowPanel != null || this.content != null)
	{
    this.windowHeight = this.windowPanel.offsetHeight;
    this.contentHeight = this.content.offsetHeight;
    this.contentYPos = this.content.offsetTop;

    //do we need to scroll?
    if(this.contentHeight > this.windowHeight){
      var scrollobj = this;
      //load event listeners for up and down buttons...
      this.buttonUp.onclick = function(){scrollobj.scrollPaneUp();}
      this.buttonDown.onclick = function(){scrollobj.scrollPaneDown();}
      this.buttonContainer.style.display = "block";

      //draw the pane in the right vertical position...
      this.drawPane();
    }

	}else{
	  //don't load.
	  return;
	}

}



ScrollPane.prototype.scrollPaneUp = function()
{
	this.contentYPos += this.windowHeight;
	this.contentYPos -= this.buffer;
	this.drawPane();
}



ScrollPane.prototype.scrollPaneDown = function()
{
	this.contentYPos -= this.windowHeight;
	this.contentYPos += this.buffer;
	this.drawPane();
}


ScrollPane.prototype.drawPane = function()
{

	if(this.contentYPos >= 0)
	{
		this.buttonUp.style.display = "none";
		this.buttonUp_disabled.style.display = "block";
		this.fadeOutTop.style.display = "none";
	}
	else
	{
		this.buttonUp.style.display = "block";
		this.buttonUp_disabled.style.display = "none";
		this.fadeOutTop.style.display = "block";
	}

	if(((-1 * this.contentYPos) + this.windowHeight) >= this.contentHeight)
	{
		this.buttonDown.style.display = "none";
		this.buttonDown_disabled.style.display = "block";
		this.fadeOutBottom.style.display = "none";
	}
	else
	{
		this.buttonDown.style.display = "block";
		this.buttonDown_disabled.style.display = "none";
		this.fadeOutBottom.style.display = "block";
	}

  var scrollval = this.contentYPos + "px";
	this.content.style.top = scrollval;
}