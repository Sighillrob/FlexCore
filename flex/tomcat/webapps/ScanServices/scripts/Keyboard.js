var typedValue = "";
var showValue = "";
var passwordValue = "";
var mode = "Letter";
var callingID = "";
var maxlen = 0;
var shift = false;
var checkFor = null;
var fieldLabel = "";




function showKeyboard(id, modeP, checkForP, pMaxLength, label)
{
	checkFor = checkForP;

	if (document.getElementById(id).maxLength != null)
	{
		maxlen = document.getElementById(id).maxLength;
	}

	if(modeP != null)
	{
		changeMode(modeP);
	}

	if(pMaxLength != null)
	{
		maxlen = pMaxLength;
	}

	callingID = id;
	fieldLabel = label;
	initKeys();
	typedValue = document.getElementById(callingID).value;
	updateTextArea();
	document.getElementById("keyboard").style.visibility = "visible";
}



function initKeys()
{
	var j = 1;
	var tableCell = document.getElementById("key" + j);

	while(tableCell != null)
	{
		divFields = tableCell.childNodes;

		for(var i = 0; i < divFields.length; i++)
		{
			// "div" - Text abschneiden
			var modeName = divFields[i].className;

			if(modeName != null)
			{
				modeName = modeName.substring(3, modeName.length);

				// Ist es eine aktive Klasse?
				if(modeName.indexOf("Active") != -1)
				{
					modeName = modeName.substring(0, modeName.indexOf("Active"));
				}
				else
				{
					modeName = modeName.substring(0, modeName.indexOf("Inactive"));
				}

				var newClass = "";

				if(modeName == mode)
				{
					newClass = "div" + modeName + "Active";
				}
				else
				{
					newClass = "div" + modeName + "Inactive";
				}

				divFields[i].className = newClass;

				if(mode == "Capital" && modeName == "Letter")
				{
					divFields[i].style.display = "none";
				}
				else if(mode != "Capital" && modeName == "Letter")
				{
					divFields[i].style.display = "block";
				}
			}
		}

		j++;
		tableCell = document.getElementById("key" + j);
	}
}



function closeKeyboard()
{
	document.getElementById("keyboard").style.visibility = "hidden";
}



function confirmValue(){
  		var keyboardinput = document.getElementById("kbdinput");

  		if (document.getElementById(callingID).type == "password") {
          //alert("password = " + passwordValue);
          keyboardinput.value = passwordValue;
      }

      if(isValidValue()){

          var input = document.getElementById(callingID);

        //if on the scan page that has the doctype hidden field...
        if(document.getElementById("docType")){

          var  input_tr = input.parentNode.parentNode,
          isAFPField = hasClass(input_tr, "af-mapped"),
  		    doctype = document.getElementById("docType").value,
  		    afpname = (document.getElementById("afpname")) ? document.getElementById("afpname").value : null,
          buttonId = document.getElementById("buttonId").value,
          basevalidateurl = "/ScanServices/EIPServer/ValidateMetadata?documentType="+doctype+"&metaName[]="+input.name+"&metaValue[]="+keyboardinput.value+"&buttonId="+buttonId,
          //add special dbAgent query parameter if the field is an autofill profile field...
          validateurl = (isAFPField && afpname) ? basevalidateurl+"&dbAgent="+afpname : basevalidateurl,
  		    xmlhttp=new XMLHttpRequest();

          setKeyboardInputState(keyboardinput, "pending");

          xmlhttp.open("GET", validateurl, true);
          xmlhttp.onreadystatechange=function(){
          if (xmlhttp.readyState == 4){

            //if successful response...
            if(xmlhttp.status == 200){
              setKeyboardInputState(keyboardinput, "normal");
              input.value = keyboardinput.value;
              closeKeyboard();
              shift = false;
              //if this field is a primary key for an autofill profile...
              if(hasClass(input_tr, "af-primary")){
                loadAFPMappedFields(input);
              }

              //if error response...
            }else{
              setKeyboardInputState(keyboardinput, "typeorconnerror");
            }
          }
        }
        xmlhttp.send();

      //otherwise, we are on a page that doesn't need ajax type validation...
      }else{
        input.value = keyboardinput.value;
        closeKeyboard();
        shift = false;
      }

    }
}



function typeLetter(id)
{
  typedValue = document.getElementById("kbdinput").value;
	if(maxlen <= typedValue.length)
	{
		return;
	}

	letterElements = document.getElementById(id).childNodes;
	letter = "";

	//finde den aktiven Buchstaben
	for(var i = 0; i < letterElements.length; i++)
	{
		letterClassName = letterElements[i].className;

		if(letterClassName != null)
		{
			index = letterClassName.indexOf("Active");

			if(index != -1)
			{
				letter = letterElements[i].firstChild.nodeValue;
			}
		}
	}

	typedValue += letter;
	if (document.getElementById(callingID).type == "password") {
      passwordValue += letter;
  }
	updateTextArea();

	if(shift)
	{
		shift = false;
		changeMode("Letter");
		initKeys();
	}
}



function typeSpace()
{
	typedValue += " ";
	updateTextArea();
}



function capsLock()
{
	if(mode == 'Capital' && shift == false)
	{
		changeMode('Letter');
	}
	else
	{
		changeMode('Capital');
	}
}



function setShift()
{
	if(shift == true)
	{
		shift = false;
		changeMode("Letter");
	}
	else if(mode != "Capital")
	{
		shift = true;
		changeMode("Capital");
	}
}



function setNumber()
{
	shift = false;

	if(mode == 'Number')
	{
		changeMode('Letter');
	}
	else
	{
		changeMode('Number');
	}
}



function setAltGr()
{
	shift = false;

	if(mode == 'Special')
	{
		changeMode('Letter');
	}
	else
	{
		changeMode('Special');
	}
}



function changeMode(newMode)
{
	mode = newMode;
	initKeys();

	capsLockKey = document.getElementById('capsLock');
	numberKey = document.getElementById('number');
	specialKey = document.getElementById('special');
	shiftLeftKey = document.getElementById('shiftLeft');
	shiftRightKey = document.getElementById('shiftRight');

	capsLockKey.className = "capsLock";
	numberKey.className = "number";
	specialKey.className = "special";
	shiftLeftKey.className = "shiftLeft";
	shiftRightKey.className = "shiftRight";

	if(newMode == "Capital" && shift == false)
	{
		capsLockKey.className = "capsLockActive";
	}
	else if(newMode == "Number")
	{
		numberKey.className = "numberActive";
	}
	else if(newMode == "Special")
	{
		specialKey.className = "specialActive";
	}
	else if(shift == true)
	{
		shiftLeftKey.className = "shiftLeftActive";
		shiftRightKey.className = "shiftRightActive";
	}
}



function initFuntions()
{
	document.getElementById('capsLock').className = "capsLock";
	document.getElementById('number').className = "number";
	document.getElementById('special').className = "special";

}



function updateTextArea()
{
	var callingField = document.getElementById(callingID);
	var keyboardField = document.getElementById("kbdinput");
	var keyboardFieldLabel = document.getElementById("kbdinput_label");
	keyboardFieldLabel.innerHTML = fieldLabel;

	if (callingField.type != "password")
	{
		showValue = typedValue;
		keyboardField.value = showValue;
	}
	else
	{
		i=0;
		showValue = "";
		while (typedValue.charAt(i) != null && typedValue.charAt(i) != "")
		{
			i++;
			showValue += "*";
		}
		keyboardField.value = showValue;
	}
	setTimeout(function(){
		keyboardField.focus();
	},10);
	
}



function erase()
{
	typedValue = trim(typedValue);
	if (document.getElementById(callingID).type == "password") {
      passwordValue = trim(passwordValue);
  }
	updateTextArea();
}

function clearText(){
  typedValue = "";
  passwordValue = "";
  updateTextArea();
}

function trim(text)
{
	var textArray = new Array();
	var newText = "";

	for(i=0; i<text.length; i++)
	{
		textArray[i] = text.charAt(i);
	}

	textArray[textArray.length-1] = "";
	newText = textArray.join("");

	return newText;
}



function isValidValue()
{
	if(checkFor == null)
	{
		return true;
	}
	else if(checkFor == 'int')
	{
		return isInteger();
	}
	else if(checkFor == 'float')
	{
		return isFloat();
	}

	return true;
}



function isInteger()
{
	if(!typedValue.match (/^[+-]?[0-9]+$/))
	{
		myAlert(globalErrorMessages['field_no_Int']);
		return false;
	}

	return true;
}



function isFloat()
{
	var tmpValue = typedValue.replace(",", ".");

	if((!tmpValue.match(/^[+-]?[0-9]*[.][0-9]+$/)) && (!tmpValue.match(/^[+-]?[0-9]+[.][0-9]*$/)) && (!isInteger()))
	{
		myAlert(globalErrorMessages['field_no_Float']);
		return false;
	}

	typedValue = tmpValue;

	return true;
}


function isDate()
{
	var regexDate = new Array();
	regexDate[0] = "//";
	regexDate[1] = "//";
	regexDate[2] = "//";
	var locales = new Array();
}



/**
 * setKeyboardInputState
 * sets the state for a field when the ajax validator returns with a successful 200 or other error code.
 * @param {Object} keyboardinput - the keyboard input text box.
 * @param {Object} state - "pending" or "error"
 */
function setKeyboardInputState(keyboardinput, state){
  removeClass(keyboardinput.parentNode, "pending");
  removeClass(keyboardinput.parentNode, "typeorconnerror");
  if(state != "normal"){
    addClass(keyboardinput.parentNode, state);
  }
}