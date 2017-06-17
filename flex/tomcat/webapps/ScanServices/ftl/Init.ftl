<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />


<script type="text/javascript">
    var xmldoc ='';
    
    function getDeviceInformation() {
        
        <#if EIP_Model??>
           //alert("Calling xrxSessionGetSessionInfo()");
           xrxSessionGetSessionInfo("http://127.0.0.1", displaySessionInfo, getSessionInfo_callback_failure);
        <#else>
           //alert("Calling getDeviceInformation()");
           xrxDeviceConfigGetDeviceInformation('http://127.0.0.1', callbackSuccess, callbackFailure);
        </#if>
 
        
    }

    function submitInfo() {
        //alert('submitInfo...');
        //alert("model: " + document.configsheet.model.value);
        //alert("username: " + document.configsheet.username.value);
        document.configsheet.submit();
    }

    function callbackSuccess(envelope, response) {  
 
        //alert("inside callbackSuccess ");

	    xmldoc = xrxDeviceConfigParseGetDeviceInfo(response);

        //var eipSoftware = xrxGetValue(xrxFindElement(xmldoc, ["version", "eipSoftware", "majorVersion"] )) + "." +
        //                  xrxGetValue(xrxFindElement(xmldoc, ["version", "eipSoftware", "minorVersion"] )) + "." +
        //                  xrxGetValue(xrxFindElement(xmldoc, ["version", "eipSoftware", "revision"] ));
	    //alert("eipSoftware: " + eipSoftware);

        //var cardReader= xrxGetValue(xrxFindElement(xmldoc, ["version", "cardReaderWS", "majorVersion"] ));
	    //alert("CardReader:" + cardReader);

        //var browserInfo = xrxGetValue(xrxFindElement(xmldoc, ["version", "EIPBrowserInfo", "BrowserType"] )) + "." +
        //                  xrxGetValue(xrxFindElement(xmldoc, ["version", "EIPBrowserInfo", "BrowserVersion"] )) + "." +
        //                  xrxGetValue(xrxFindElement(xmldoc, ["version", "EIPBrowserInfo", "EipWidgets"] ));
	    //alert("BrowserInfo: " + browserInfo);

        //var dpi = xrxGetValue(xrxFindElement( xmldoc, ["display", "dpi"] ));
	    //alert("dpi: " + dpi);

	var serial = xrxGetValue(xrxFindElement( xmldoc, ["device", "serial"] ));
        var model  = xrxGetValue(xrxFindElement( xmldoc, ["device", "model"] ));
        var displayWidth = xrxGetValue(xrxFindElement(xmldoc, ["display", "canvasSize", "width"] ));
        var displayHeight = xrxGetValue(xrxFindElement(xmldoc, ["display", "canvasSize", "height"] ));
        
        document.configsheet.model.value = model;
        document.configsheet.serial.value = serial;
        document.configsheet.displayWidth.value = displayWidth;
        document.configsheet.displayHeight.value = displayHeight;
        xrxSessionGetSessionInfo("http://127.0.0.1", displaySessionInfo, getSessionInfo_callback_failure);
    }

    function callbackFailure(envelope, response, status) {
        //alert("xrxDeviceConfigGetDeviceInformation falied");
        document.configsheet.model.value = "defaultModel";
        document.configsheet.serial.value = "defaultSerial";
        document.configsheet.displayWidth.value = 800;
        document.configsheet.displayHeight.value = 480;
        xrxSessionGetSessionInfo("http://127.0.0.1", displaySessionInfo, getSessionInfo_callback_failure);
    } 



    function getSessionInfo_callback_failure(envelope, response, status) {
        //alert("xrxSessionGetSessionInfo() falied");
          document.configsheet.submit();
    }

   /*
     * Callback from request for session info.
     * Display the resulting data.
     */


    function displaySessionInfo(sessRequest, sessResponse) {
        //alert('Calling displaySessionInfo');
        var sessInfoObj = xrxSessionParseGetSessionInfo(sessResponse);

        if (!sessInfoObj) {
            //alert("displaySessionInfo: null sessionInfo");
            document.configsheet.cardReaderUser.value = "";
            document.configsheet.cardReaderEmail.value = "";
        } else {

        try {	
		    var name = null;

		    schemaVersion = xrxGetElementValue( sessInfoObj, 'MajorVersion'); 
		    schemaVersion += "." + xrxGetElementValue( sessInfoObj, 'MinorVersion');
		    schemaVersion += "." + xrxGetElementValue( sessInfoObj, 'Revision');
		    //alert(schemaVersion);


		    if(((name = xrxGetElementValue( sessInfoObj, 'username' )) != null) && (name != ""))  {
                        document.configsheet.cardReaderUser.value = name;
			//alert("Username: " + name);
		    }

		    if(((name = xrxGetElementValue( sessInfoObj, 'password' )) != null) && (name != "")) {
                        //alert("Password: " + name);
		    }

		    if(((name = xrxGetElementValue( sessInfoObj, 'from' )) != null) && (name != "")) {
                        document.configsheet.cardReaderEmail.value = name;
			//alert("Email Address: " + name);
		    }

		    if(xrxFindFirstElement( sessInfoObj, "jba" ) != null) {
		        if((name = xrxGetElementValue( sessInfoObj, 'userID' )) == null) {
		            name = "";
                        }
 
		        //alert("JBA UserID: " + name);
		       
		        if((name = xrxGetElementValue( sessInfoObj, 'accountID' )) == null) {
		            name = "";
			}
		        //alert("jbaaccountID: " + name);

		    } else {
		        if(xrxFindFirstElement( sessInfoObj, "xsa" ) != null) {
		            if((name = xrxGetElementValue( sessInfoObj, 'userID' )) == null) {
		                name = "";
			    }
			    //alert("accounting=xsa;xsauserID: " + name);
	
		            if((name = xrxGetElementValue( sessInfoObj, 'AccountType' )) == null) {
		                name = "";
			    }
			    //alert("XSA AccountType: " + name);

		            if((name = xrxGetElementValue( sessInfoObj, 'AccountID' )) == null) {
		                name = "";
                            }
			    //alert("XSA AccountID: " + name);

		        } else {
		            //alert("No Accounting Info ");
		        }
		    }
		    //alert("Session Info Retrieved");
        } catch ( e ) {
            //alert("displaySessionInfo: " + e);
        }
        }
        //alert("calling submitinfo()... ");
        //document.configsheet.username.value = "ash";
        submitInfo();

    }


// Alwyas update the following files from XRXWebservices: XRXDeviceConfig.js, XRXSession.js, XRXWebservices.js, XRXXmlHandler.js

/* 
 * XRXDeviceConfig.js
 * Copyright (C) Xerox Corporation, 2012, 2013.  All rights reserved.
 *
 * This file encapsulates the functions to call the Xerox DeviceConfig Api webservices.
 *
 * @revision    04/05/2012
 *              09/21/2012  AHB Expanded functionality to parse payload
 *              10/15/2012  AHB Updated
 *              12/20/2012  AHB Added xrxGetDeviceInformation pass thru to remain compatible with other versions
 *              08/01/2013  AHB Added synchronous behavior
 */

/****************************  CONSTANTS  *******************************/

var XRX_DEVICECONFIG_NAMESPACE = 'xmlns="http://www.xerox.com/webservices/office/device_configuration/1"';

var XRX_DEVICECONFIG_PATH = '/webservices/office/device_configuration/1';

/****************************  FUNCTIONS  *******************************/


//  DeviceConfig Interface Version


/**
* This function gets the DeviceConfig interface version and returns the parsed values.
*
* @param	url					destination address
* @param	callback_success	function to callback upon successfull completion
* @param	callback_failure	function to callback upon failed completion
* @param	timeout				function to call an error routine after a set amount 
*								of seconds (0[default] = no timeout)(optional)
* @param    async               asynchronous = true, synchronous = false
* @return 	Async   blank string or comm error beginning with "FAILURE"
*           Sync    response or comm error beginning with "FAILURE
*/
function xrxDeviceConfigGetInterfaceVersion( url, callback_success, callback_failure, timeout, aync )
{
    if((url == null) || (url == ""))
        url = "http://127.0.0.1";
    var sendUrl = url + XRX_DEVICECONFIG_PATH;
    var sendReq = xrxDeviceConfigGetInterfaceVersionRequest();
	return xrxCallWebservice( sendUrl, sendReq, callback_success, callback_failure, timeout, null, null, null, async );
}

/**
* This function builds the DeviceConfig interface version request.
*
* @return	string	xml request
*/
function xrxDeviceConfigGetInterfaceVersionRequest()
{
	return	XRX_SOAP11_SOAPSTART 
			+ xrxCreateTag( 'GetInterfaceVersionRequest', XRX_DEVICECONFIG_NAMESPACE, '' ) 
			+ XRX_SOAPEND;
}

/**
* This function returns the parsed values.
*
* @param	response	webservice response in string form
* @return	string		Major.Minor.Revision
*/
function xrxDeviceConfigParseGetInterfaceVersion( response )
{
    var data = xrxStringToDom( response );
	return xrxGetValue( xrxFindElement( data, ["InterfaceVersion","MajorVersion"] ) ) + "."
	    + xrxGetValue( xrxFindElement( data, ["InterfaceVersion","MinorVersion"] ) ) + "."
	    + xrxGetValue( xrxFindElement( data, ["InterfaceVersion","Revision"] ) );
}


//  GetDeviceConfigInfo


/**
* This function retrieves the DeviceConfigInfo data.
*
* @param	url					destination address
* @param	callback_success	function to callback upon successfull completion
* @param	callback_failure	function to callback upon failed completion
* @param	timeout				function to call an error routine after a set amount 
*								of seconds (0[default] = no timeout)(optional)
* @param    async               asynchronous = true, synchronous = false
* @return 	Async   blank string or comm error beginning with "FAILURE"
*           Sync    response or comm error beginning with "FAILURE
*/
function xrxDeviceConfigGetDeviceInformation( url, callback_success, callback_failure, timeout, async )
{
    return xrxDeviceConfigGetDeviceInfo( url, callback_success, callback_failure, timeout, null, null, null, async );
}

/**
* This function retrieves the DeviceConfigInfo data.
*
* @param	url					destination address
* @param	callback_success	function to callback upon successfull completion
* @param	callback_failure	function to callback upon failed completion
* @param	timeout				function to call an error routine after a set amount 
*								of seconds (0[default] = no timeout)(optional)
*/
function xrxDeviceConfigGetDeviceInfo( url, callback_success, callback_failure, timeout )
{
    if((url == null) || (url == ""))
        url = "http://127.0.0.1";
	var sendUrl = url + XRX_DEVICECONFIG_PATH;
	var sendReq = xrxDeviceConfigGetDeviceInfoRequest();
    xrxCallWebservice( sendUrl, sendReq, callback_success, callback_failure, timeout );
} 

/**
* This function builds the DeviceConfig Info data request.
*
* @return	string	xml request
*/
function xrxDeviceConfigGetDeviceInfoRequest()
{
	return	XRX_SOAP11_SOAPSTART 
			+ xrxCreateTag( 'GetDeviceInformationRequest', XRX_DEVICECONFIG_NAMESPACE, '' ) 
			+ XRX_SOAPEND;
}

/**
* This function returns the parsed values.
*
* @param	response	webservice response in string form
* @return	array		xml payload in DOM form
*/
function xrxDeviceConfigParseGetDeviceInfo( response )
{
	var data = xrxGetElementValue( xrxStringToDom( response ), "Information" );
	if(data != null) 
	    data = xrxStringToDom( xrxUnescape( data ) );
	return data;
}

/**
* This function returns the the payload of the response.
*
* @param	response	webservice response in string form
* @return	string		escaped xml payload in string form
*/
function xrxDeviceConfigParseGetDeviceInfoPayload( response )
{
	return xrxParsePayload( response, "Information" );
}


//  GetDeviceCapabilities


/**
* This function retrieves the DeviceCapabilities data.
*
* @param	url					destination address
* @param	callback_success	function to callback upon successfull completion
* @param	callback_failure	function to callback upon failed completion
* @param	timeout				function to call an error routine after a set amount 
*								of seconds (0[default] = no timeout)(optional)
* @param    async               asynchronous = true, synchronous = false
* @return 	Async   blank string or comm error beginning with "FAILURE"
*           Sync    response or comm error beginning with "FAILURE
*/
function xrxDeviceConfigGetDeviceCapabilities( url, callback_success, callback_failure, timeout, async )
{
    if((url == null) || (url == ""))
        url = "http://127.0.0.1";
	var sendUrl = url + XRX_DEVICECONFIG_PATH;
	var sendReq = xrxDeviceConfigGetDeviceCapabilitiesRequest();
    return xrxCallWebservice( sendUrl, sendReq, callback_success, callback_failure, timeout, null, null, null, async );
} 

/**
* This function builds the DeviceConfig Capabilities data request.
*
* @return	string	xml request
*/
function xrxDeviceConfigGetDeviceCapabilitiesRequest()
{
	return	XRX_SOAP11_SOAPSTART 
			+ xrxCreateTag( 'VoidRequest', XRX_DEVICECONFIG_NAMESPACE, '' ) 
			+ XRX_SOAPEND;
}

/**
* This function returns the parsed values.
*
* @param	response	webservice response in string form
* @return	array		xml payload in DOM form
*/
function xrxDeviceConfigParseGetDeviceCapabilities( response )
{
	var data = xrxGetElementValue( xrxStringToDom( response ), "JobModelCapabilities_DeviceJobProcessingCapabilities" );
	if(data != null) 
	    data = xrxStringToDom( xrxUnescape( data ) );
	return data;
}

/**
* This function returns the the payload of the response.
*
* @param	response	webservice response in string form
* @return	string		escaped xml payload in string form
*/
function xrxDeviceConfigParseGetDeviceCapabilitiesPayload( response )
{
    return xrxParsePayload( response, "JobModelCapabilities_DeviceJobProcessingCapabilities" );
}

/*************************  End of File  *****************************/


/* 
 * XrxSession.js
 * Copyright (C) Xerox Corporation, 2007, 2008, 2009, 2010, 2011, 2012, 2013.  All rights reserved.
 *
 * This file encapsulates the functions to call the Xerox Session Api webservices.
 *
 * @revision    04/26/2012  AHB Added xrxSessionParseGetInterfaceVersion
 *              04/2012 TC  Added SetSession functionality
 *              10/15/2012  AHB Updated
 *              08/01/2013  AHB Added synchronous behavior and updated constants
 *				06/11/2015  TC  Use XRX_SOAP11_SOAPSTART instead of XRX_SOAPSTART.
 */

/****************************  CONSTANTS  *******************************/

var XRX_SESSION_NAMESPACE = 'xmlns="http://www.xerox.com/webservices/office/cuisession/1"';

var XRX_SESSION_PATH = '/webservices/office/cuisession/1';

/****************************  FUNCTIONS  *******************************/


//  Session Interface Version


/**
* This function gets the Session interface version and returns the parsed values.
*
* @param	url					destination address
* @param	callback_success	function to callback upon successfull completion
* @param	callback_failure	function to callback upon failed completion
* @param	timeout				function to call an error routine after a set amount 
*								of seconds (0[default] = no timeout)(optional)
* @param    async               asynchronous = true, synchronous = false
* @return 	Async   blank string or comm error beginning with "FAILURE"
*           Sync    response or comm error beginning with "FAILURE
*/
function xrxSessionGetInterfaceVersion( url, callback_success, callback_failure, timeout, async )
{
    if((url == null) || (url == ""))
        url = "http://127.0.0.1";
    var sendUrl = url + XRX_SESSION_PATH;
    var sendReq = xrxSessionGetInterfaceVersionRequest();
	return xrxCallWebservice( sendUrl, sendReq, callback_success, callback_failure, timeout, null, null, null, async );
}

/**
* This function builds the Session interface version request.
*
* @return	string	xml request
*/
function xrxSessionGetInterfaceVersionRequest()
{
	return	XRX_SOAP11_SOAPSTART 
			+ xrxCreateTag( 'GetInterfaceVersionRequest', XRX_SESSION_NAMESPACE, '' ) 
			+ XRX_SOAPEND;
}

/**
* This function returns the parsed values.
*
* @param	response	webservice response in string form
* @return	string		Major.Minor.Revision
*/
function xrxSessionParseGetInterfaceVersion( response )
{
    var data = xrxStringToDom( response );
	return xrxGetValue( xrxFindElement( data, ["InterfaceVersion","MajorVersion"] ) ) + "."
	    + xrxGetValue( xrxFindElement( data, ["InterfaceVersion","MinorVersion"] ) ) + "."
	    + xrxGetValue( xrxFindElement( data, ["InterfaceVersion","Revision"] ) );
}


//  Exit Application


/**
* This function initiates an exit from EIP. There is no success callback
* because EIP will exit upon success of the webservice call.
*
* @param	url					destination address
* @param	callback_failure	function to callback upon failed completion
* @param	timeout				function to call an error routine after a set amount 
*								of seconds (0[default] = no timeout)(optional)
* @param    async               asynchronous = true, synchronous = false
* @return 	Async   blank string or comm error beginning with "FAILURE"
*           Sync    response or comm error beginning with "FAILURE
*/
function xrxSessionExitApplication( url, callback_failure, timeout, async )
{
    if((url == null) || (url == ""))
        url = "http://127.0.0.1";
	var sendUrl = url + XRX_SESSION_PATH;
	var sendReq = xrxSessionExitApplicationRequest();
	return xrxCallWebservice( sendUrl, sendReq, null, callback_failure, timeout, null, null, null, async );
}    

/**
* This function builds the Exit Application request.
*
* @return	string	xml request
*/
function xrxSessionExitApplicationRequest()
{
	return	XRX_SOAP11_SOAPSTART 
		    + xrxCreateTag( 'ExitApplicationRequest', XRX_SESSION_NAMESPACE, '' ) 
		    + XRX_SOAPEND;
}


//  GetSessionInfo


/**
* This function retrieves the SessionInfo data.
*
* @param	url					destination address
* @param	callback_success	function to callback upon successfull completion
* @param	callback_failure	function to callback upon failed completion
* @param	timeout				function to call an error routine after a set amount 
*								of seconds (0[default] = no timeout)(optional)
* @param    async               asynchronous = true, synchronous = false
* @return 	Async   blank string or comm error beginning with "FAILURE"
*           Sync    response or comm error beginning with "FAILURE
*/
function xrxSessionGetSessionInfo( url, callback_success, callback_failure, timeout, async )
{
    if((url == null) || (url == ""))
        url = "http://127.0.0.1";
	var sendUrl = url + XRX_SESSION_PATH;
	var sendReq = xrxSessionGetSessionInfoRequest();
    return xrxCallWebservice( sendUrl, sendReq, callback_success, callback_failure, timeout, null, null, null, async );
} 

/**
* This function This function builds the request.
*
* @return	string	xml request
*/
function xrxSessionGetSessionInfoRequest()
{
	return	XRX_SOAP11_SOAPSTART 
		    + xrxCreateTag( 'GetSessionInformationRequest', XRX_SESSION_NAMESPACE, '' ) 
		    + XRX_SOAPEND;
}

/**
* This function returns the parsed payload.
*
* @param	response	webservice response in DOM form
* @return	string		xml payload in string form
*/
function xrxSessionParseSessionPayload( response )
{
	return xrxGetElementValue( response, "Information" );
}

/**
* This function returns the parsed values.
*
* @param	response	webservice response in string form
* @return	array		xml payload in DOM form
*/
function xrxSessionParseGetSessionInfo( response )
{
	var data = xrxSessionParseSessionPayload( xrxStringToDom( response ) );
	if(data != null) 
	    data = xrxStringToDom( xrxUnescape( data ) );
	return data;
}


//  SetSessionInfo


/**
* This function sets the SessionInfo data. 
*
* @param	url					destination address
* @param    payload             xml payload containing the session data
* @param	callback_success	function to callback upon successfull completion
* @param	callback_failure	function to callback upon failed completion
* @param	timeout				function to call an error routine after a set amount 
*								of seconds (0 = no timeout)
* @param    async               asynchronous = true, synchronous = false
* @return 	Async   blank string or comm error beginning with "FAILURE"
*           Sync    response or comm error beginning with "FAILURE
*/
function xrxSessionSetSessionInfo( url, payload, callback_success, callback_failure, timeout, async )
{
    if((url == null) || (url == ""))
        url = "http://127.0.0.1";
	var sendUrl = url + XRX_SESSION_PATH;
	var sendReq = xrxSessionSetSessionInfoRequest( payload );
    return xrxCallWebservice( sendUrl, sendReq, callback_success, callback_failure, timeout, null, null, null, async );
}

/**
* This function builds the request.
*
* @param    session_info   payload to include
* @return	string	xml request
*/
function xrxSessionSetSessionInfoRequest( session_info )
{
	return XRX_SOAP11_SOAPSTART +
		    xrxCreateTag( 'SetSessionParametersRequest', XRX_SESSION_NAMESPACE,
			xrxCreateTag( 'SessionInfoSchema_SetSessionParametersPayload', XRX_SESSION_NAMESPACE, session_info )) 
			+ XRX_SOAPEND;
}

/*************************  End of File  *****************************/


/* 
 * XrxWebservices.js
 * Copyright (C) Xerox Corporation, 2007, 2008, 2009, 2010, 2011, 2012, 2013.  All rights reserved.
 *
 * This file encapsulates the functions to Xerox webservices.
 *
 * @revision    10/07/2007
 *              09/21/2012 
 *              10/15/2012  AHB Updated
 *              06/20/2013  3.10    AHB Added Synchronous behavior
 *              07/26/2013  3.11    AHB Added Mtom constants
 *              08/01/2013  3.12    AHB Added xrxParseStringSoap12ErrorResponse
 *              08/30/2013  3.0.13  AHB Added WsXConfig
 *                                  Added Authorization XRXWsSecurity.js
 *                                  Added Mtom
 *              07/20/2014  3.0.14  TC  Updated the XRX_WEBSERVICES_LIBRARY_VERSION to 
 *										3.0.14.
 *              08/17/2015  3.5.01  TC  Updated the XRX_WEBSERVICES_LIBRARY_VERSION to 
 *										3.5.01.
 *              10/29/2015  3.5.02  TC  Added 'xmlns:xop="http://www.w3.org/2004/08/xop/include"' 
 *										to  XRX_SOAPSTART_MTOM.
 *
 *  When changing the version don't forget to change the version in the global below.
 */
 
/****************************  CONSTANTS  *******************************/

// Overall Webservices Library Version
var XRX_WEBSERVICES_LIBRARY_VERSION = "3.5.02"; 

var XRX_XML_TYPE_BOOLEAN = 'xsi:type="xsd:boolean"';

var XRX_XML_TYPE_NONE = '';

var XRX_SOAP11_SOAPSTART = '<?xml version="1.0" encoding="utf-8"?>'
    + '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" '
    + 'xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing" '
    + 'xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" '
    + 'xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">'
    + '<soap:Body>';

var XRX_SOAPSTART = '<?xml version="1.0" encoding="utf-8"?>' +
    '<soap:Envelope' +
    ' xmlns:soap="http://www.w3.org/2003/05/soap-envelope"' +
    ' xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"' +
    ' xmlns:xsd="http://www.w3.org/2001/XMLSchema"' +
    ' xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing"' +
    ' xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"' +
    ' xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">' +
    '<env:Header xmlns:env="http://www.w3.org/2003/05/soap-envelope">' + 
    '</env:Header>' +
    '<soap:Body>';

var XRX_SOAPEND = '</soap:Body></soap:Envelope>';
    
var XRX_SOAPSTART_MTOM = '<soap:Envelope' + 
	' xmlns:xop="http://www.w3.org/2004/08/xop/include"' +
    ' xmlns:soap="http://www.w3.org/2003/05/soap-envelope"' +
    ' xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"' +
    ' xmlns:xsd="http://www.w3.org/2001/XMLSchema"' +
    ' xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing"' +
    ' xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"' +
    ' xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">' +
    '<env:Header xmlns:env="http://www.w3.org/2003/05/soap-envelope">' + 
    '</env:Header>' +
    '<soap:Body>';

var XRX_MIME_BOUNDARY = '----MIMEBoundary635101843208985196\r\n';

var XRX_MIME_BOUNDARY_END = '\r\n----MIMEBoundary635101843208985196\r\n';

var XRX_MIME_HEADER = 'content-id: <0.635101843208985196@example.org>\r\n'
        + 'content-type: application/xop+xml; charset=utf-8; type="application/soap+xml; charset=utf-8"\r\n'
        + 'content-transfer-encoding: binary\r\n\r\n';

/****************************  GLOBALS  *******************************/

// Ajax Request Object
var xrxXmlhttp = new XMLHttpRequest();
// Ajax Request Xml
var xrxEnvelope = null;
// Ajax Destination Url
var xrxUrl = null;
// Ajax Return Status Message
var xrxStatusText = "";
// Storage for Last Ajax Response
var xrxResponseSaved = null;
// Flag to Indicate to Save Ajax Response
var xrxSaveResponseFlag = false;
// Storage for Last Ajax Request Headers
var xrxSavedRequestHeaders = null;
// Storage for Last Ajax Response Headers
var xrxSavedResponseHeaders = null;
// Storage for Success Callback Function Address
var xrxAjaxSuccessCallback = null;
// Storage for Failure Callback Function Address
var xrxAjaxFailureCallback = null;
// Ajax Timeout Flag
var xrxTimeoutFlag = null;
// Ajax Timeout Counter
var xrxTimeoutCtr = 0;

/****************************  FUNCTIONS  *****************************/

/**
* This function calls the low level Ajax function to send the request.
*
* @param	url					destination address
* @param	envelope			xml string for body of message
* @param	callback_success	function to callback upon successfull completion
* @param	callback_failure	function to callback upon failed completion
* @param	timeout				function to call an error routine after a set amount 
*								of seconds (0[default] = no timeout)(optional)
* @param	headers				array of optional headers in format {name:value} or null (optional)
* @param	username			username for user credentials (blank will not be included)
* @param	password			password for user credentials (blank will not be included)
* @param    async               asynchronous = true, synchronous = false
* @return   If Async return will be a blank string - If Synch return will either be the response or an error string starting with "Failure"
*/
function xrxCallWebservice( url, envelope, callback_success, callback_failure, timeout, headers, username, password, async )
{
    return xrxCallAjax( url, envelope, "POST", ((headers != undefined)?headers:null), callback_success, callback_failure, timeout, username, password, async )           
}

/**
* This function is the low level Ajax function to send the request.
*
* @param	url					destination address
* @param	envelope			xml string for body of message
* @param	type				request type (GET or POST)
* @param	headers				array of arrays containing optional headers to set on the request or null
* @param	callback_success	function to callback upon successfull completion
* @param	callback_failure	function to callback upon failed completion
* @param	timeout				function to call an error routine after a set amount 
*								of seconds (0[default] = no timeout)(optional)
* @param    username            optional username for ajax request
* @param    password            optional password for ajax request
* @param    async               asynchronous = true, synchronous = false
* @return   If Async return will be a blank string - If Synch return will either be the response or an error string starting with "Failure"
*/
function xrxCallAjax( url, envelope, type, headers, callback_success, callback_failure, timeout, username, password, async )
{
	// For Firefox
    try 
    {
        netscape.security.PrivilegeManager.enablePrivilege( "UniversalBrowserRead" );
    } catch (e) {};
	++xrxTimeoutCtr;
	if(async == undefined)
	    async = true;
	xrxResponseSaved = null;
	xrxEnvelope = envelope;
	xrxStatusText = "";
	xrxAjaxSuccessCallback = ((callback_success == undefined)?null:callback_success);
	xrxAjaxFailureCallback = ((callback_failure == undefined)?null:callback_failure);
	xrxXmlhttp.abort();
	try
	{
	    if((username == undefined) || (password == undefined) || (username == null) || (password == null))
	        xrxXmlhttp.open( type, (xrxUrl = url), async );
	    else
	        xrxXmlhttp.open( type, (xrxUrl = url), async, username, password );
	}
	catch(exc)
	{
        var errString = "";
        var uaString = navigator.userAgent;
        if(!async && (uaString != undefined) && (uaString != null) && ((uaString = uaString.toLowerCase()).indexOf( "galio" ) >= 0))
            errString = "FAILURE: Synchronous Ajax Does Not Work in FirstGenBrowser!";
        else
            errString = "FAILURE: Failure to Open Ajax Object!";
	    xrxCallCallback( 0, errString );
	    return errString;
	}
	if(headers != null)
	{
		for(var i = 0;i < headers.length;++i)
		{
			xrxSavedRequestHeaders += headers[i][0] + ":" + headers[i][1] + "\n";
			xrxXmlhttp.setRequestHeader( headers[i][0], headers[i][1] );
		}
	} else
	{
	    xrxSavedRequestHeaders = "SOAPAction:\"\"\n";
	    xrxXmlhttp.setRequestHeader("SOAPAction", '""');
	    xrxSavedRequestHeaders += "Content-Type:text/xml\n";
	    xrxXmlhttp.setRequestHeader( "Content-Type", "text/xml" );
	}
	if(async)
	{
	// response function
	    xrxXmlhttp.onreadystatechange = function() 
	    {
		    if((xrxXmlhttp != null) && (xrxXmlhttp.readyState == 4))
		    {
			    try
			    {
				    var tflag = xrxTimeoutFlag;
				    xrxTimeoutFlag = 0;
				    if(tflag >= 0)
				    {
					    if(xrxSaveResponseFlag) 
					        xrxResponseSaved = xrxXmlhttp.responseText;
					    else
					        xrxResponseSaved = null;
					    xrxStatusText = ((xrxXmlhttp.statusText != undefined) ? xrxXmlhttp.statusText : "");
					    xrxSavedResponseHeaders = xrxXmlhttp.getAllResponseHeaders();
					    xrxCallCallback( xrxXmlhttp.status, xrxXmlhttp.responseText );
				    }
			    }
			    catch( e )
			    {
				    xrxAjaxFailureCallback( xrxEnvelope, "<comm_error>" + e.toString() + "</comm_error>", 0 );
			    }
		    }
	    }
	    xrxXmlhttp.send( xrxEnvelope );
	    if((timeout != undefined) && (timeout != null) && (timeout > 0) && (xrxAjaxFailureCallback != null)) 
		    setTimeout( "xrxTimeout(" + xrxTimeoutCtr + ")", (xrxTimeoutFlag = (timeout * 1000)) );
	} else
	{
	    try
	    {
	        xrxXmlhttp.send( xrxEnvelope );
		    if(xrxSaveResponseFlag) 
		        xrxResponseSaved = xrxXmlhttp.responseText;
		    xrxStatusText = ((xrxXmlhttp.statusText != undefined) ? xrxXmlhttp.statusText : "");
		    xrxSavedResponseHeaders = xrxXmlhttp.getAllResponseHeaders();
	        xrxCallCallback( xrxXmlhttp.status, xrxXmlhttp.responseText );
	    }
	    catch( e )
	    {
	        return "FAILURE: comm_error " + (((e != null) && (e.message != null))? e.message : "Exception" );
	    }
        return ((xrxXmlhttp.status == 200) ? "" : "FAILURE: " + xrxXmlhttp.status + " - ") + xrxXmlhttp.responseText;
    }
    return "";
}

/**
* This function calls the callbacks if they were given a value.
*
* @param    status      status code
* @param    response    websertvice response
*/
function xrxCallCallback( status, response )
{
    if((response == undefined) || (response == null))
        response = "";
    if(status != 200) 
    {
	    if(xrxAjaxFailureCallback != null) 
		    xrxAjaxFailureCallback( xrxEnvelope, response, status );
    } else 
    {
	    if(xrxAjaxSuccessCallback != null) 
		    xrxAjaxSuccessCallback( xrxEnvelope, response );
    }
}

/**
* This function handles the timeout and calls the error handler if a response has
* not been received.
*
* @param	ctr		timeout id
*/
function xrxTimeout( ctr )
{
	if((xrxTimeoutFlag > 0) && (ctr == xrxTimeoutCtr)) 
	{
		var tflag = (xrxTimeoutFlag / 1000);
		xrxTimeoutFlag = -1;
		xrxXmlhttp.abort();
		xrxAjaxFailureCallback( xrxEnvelope, "<comm_error>COMM TIMEOUT(" + tflag + " sec)</comm_error>", -99 );
	}
}

// Helper functions

/**
* This function pulls the Mtom data from the response.
*
* @param	response	webservice response in string form
* @return	string		job data
*/
function findMtomData( response, idString, idString2 )
{
    var index = response.indexOf( idString );
    if((index > 0) && ((index = response.indexOf( idString, index + 1 )) > 0))
        return response.substring( index, response.lastIndexOf( idString2 ) + 1 );
    return "FAILURE: Cannot Locate Mtom Data!";
}

/**
* This function parses the interface version.
*
* @param	response	webservice response in string form
* @return	array	[MajorVersion],[MinorVersion],[Revision]
*/
function xrxParseInterfaceVersion( response )
{
	var result = new Array();
	var dom = xrxStringToDom( response );
	var data = xrxGetTheElement( dom, "InterfaceVersion" );
	var node = xrxFindElement( data, ["MajorVersion"] );
	if(node != null) result['MajorVersion'] = xrxGetValue( node );
	var node = xrxFindElement( data, ["MinorVersion"] );
	if(node != null) result['MinorVersion'] = xrxGetValue( node );
	var node = xrxFindElement( data, ["Revision"] );
	if(node != null) result['Revision'] = xrxGetValue( node );
	return result;
}

/**
* This function returns the parsed interface values.
*
* @param	response	    webservice response in string form
* @return	string		    Major.Minor.Revision
*/
function xrxParseGetInterfaceVersion( response )
{
    var data = xrxStringToDom( response );
	return xrxGetValue( xrxFindElement( data, ["Version","MajorVersion"] ) ) + "."
	    + xrxGetValue( xrxFindElement( data, ["Version","MinorVersion"] ) ) + "."
	    + xrxGetValue( xrxFindElement( data, ["Version","Revision"] ) );
}

/**
* This function parses the error response.
*
* @param	response	webservice response in string form
* @return	fault portion of response in DOM form or null
*/
function xrxParseErrorResponse( response )
{
	var data = null;
	if((response != null) && (response != ""))
		data = xrxFindElement( xrxStringToDom( response ), ["Fault"] );
	return data;
}

/**
* This function parses the error response.
*
* @param	response	webservice response in string form
* @return	fault portion of response in DOM form or null
*/
function xrxParseStringSoap12ErrorResponse( response )
{
    var subcode = "";
    var reason = "";
    if((typeof(response) != "undefined") && (response != null))
    {
	    var index = response.indexOf( "Subcode" );
	    if(index > 0)
	        if((index = response.indexOf( "Value", index )) > 0)
	            if((index = response.indexOf( ">", index )) > 0)
	                subcode = response.substring( index + 1, response.indexOf( "<", index ) );
	    if((index = response.indexOf( "Reason" )) > 0)
	        if((index = response.indexOf( "Text" )) > 0)
	            if((index = response.indexOf( ">", index )) > 0)
	                reason = response.substring( index + 1, response.indexOf( "<", index ) );
	}
	if((subcode != "") || (reason != ""))
	    return subcode + ":" + reason;
	else
	    return "General Failure:" + response;
}

/**
* This function retrieves the last url used in an Ajax call.
*
* @return	envelope in string form
*/
function xrxGetUrl()
{
	return xrxUrl;
}

/**
* This function retrieves the last envelope used in an Ajax call.
*
* @return	envelope in string form
*/
function xrxGetEnvelope()
{
	return xrxEnvelope;
}

/**
* This function retrieves the last Ajax request status text.
*
* @return	string	status text or ""
*/
function xrxGetStatusText()
{
	return xrxStatusText;
}

/**
* This function sets the flag to save the last response received 
* in an Ajax call.
*
* @param	value	true=save response
*/
function xrxSetSavedResponse( value )
{
	xrxSaveResponseFlag = value;
}

/**
* This function retrieves the last Ajax response received in an Ajax call.
*
* @return	response in string form
*/
function xrxGetSavedResponse()
{
	return xrxResponseSaved;
}

/**
* This function retrieves the last Ajax response headers received in an Ajax call.
*
* @return	headers in string form
*/
function xrxGetSavedResponseHeaders()
{
	return xrxSavedResponseHeaders;
}

/**
* This function retrieves the last Ajax request headers received in an Ajax call.
*
* @return	headers in string form
*/
function xrxGetSavedRequestHeaders()
{
	return xrxSavedRequestHeaders;
}

function xrxParsePayload( text, name )
{
    var result = "";
    var index;
    if((index = text.indexOf( ":" + name + ">" )) < 0)
        if((index = text.indexOf( "<" + name + ">" )) < 0)
            if((index = text.indexOf( ":" + name + " " )) < 0)
                index = text.indexOf( "<" + name + " " );
    if(index >= 0)
    {
        var fullname = xrxGetWholeName( text, name, index );
        index = text.indexOf( ">", index ) + 1;
        var index2 = text.indexOf( "/" + fullname, index );
        if(index2 > 0)
            result = text.substring( index, index2 - 1 );
    }
    return result;
}

function xrxGetWholeName( text, name, index )
{
    var result;
    var start = xrxBackSearch( text, '<', index );
    if((start >= 0) && (start < index))
        result = text.substring( start + 1, start + ((index - start) + name.length + 1) );
    else
        result = "";
    return result;
}

function xrxBackSearch( text, theChar, index )
{
    var result;
    for(result = index;(text.charAt( result ) != theChar) && (result >= 0);--result);
    return result;
}

/*************************  Support Files  *****************************/

/**
* This function returns the Library version.
*
* @return	string	version string
*/
function xrxGetWebservicesLibraryVersion()
{
    return XRX_WEBSERVICES_LIBRARY_VERSION;
}

/**
* This function creates an xml tag in a string.
*
* @param	label		tag
* @param	type		attribute
* @param	value		text value
*/
function xrxCreateTag( label, type, value )
{
    if(type == "")
    {
        return( "<" + label + ">" + value + "</" + label + ">" );
    }
    else
    {
        return( "<" + label + " " + type + ">" + value + "</" + label + ">" );
    }
}

/*************************  ASync Framework  *****************************/

// Singleton object
var xrxASyncFramework = new XrxASyncFramework();

/**
* This constructor creates an object that handles some of the complexities
* of async programming. It works on the idea of a 'framework'. This framework
* is an array that holds a series of steps each with its function to call if
* the previous level was successful and one to call if not. Storage of 
* intermediate values is accomplished by the store and recall functions.
*
* A typical setup would be:
*	framework = new Array();
*	framework[0] = ["loadTemplates"];
*	framework[1] = ["finishLoadTemplates","commFailure"];
*	framework[2] = ["finishInitiateScan","commFailure"];
*	xrxASyncFramework.load( framework );
*	xrxASyncFramework.start();
*
* The function loadTemplates would be called first. Somewhere in that function a 
* Ajax call will be made. When it returns the AsyncFramework will execute the 
* first function call of the next layer if the Ajax call was successful and the 
* second if a failure. This will continue until the framework is no longer called 
* or all layers are executed.
* 
* A traditional function with a webservice would be as you normally create it but with the exception of the success callback and the failure callback are fixed
* values of xrxASyncSuccessCallback and xrxASyncFailureCallback, as below:
*
* function getDefaultApplication()
* {
*    xrxWsXConfigGetPathwayDefaultApplication( "http://127.0.0.1", "Services", adminUserString, adminPasswordString, xrxASyncSuccessCallback, xrxASyncFailureCallback, 30, true );
* }
*
* Your callback functions remain the same with two additions, one, You get the parameters by calling for them and you finish with a mandatory call:
*
* function gda_success( request, response )
* {
*     response = xrxASyncFramework.recall( "p1" ); // calls for parameter 1 (0 based parameter list) which is the response
*     var app = new AppInfo( xrxWsXConfigParseGetPathwayDefaultApplication( response ) ).name;
*     if(app != null)
*     {
*         document.getElementById( 'defaultApplication' ).innerHTML = app;
*         for(var i = 0;i < applicationLen;++i)
*             if(applicationList[i].name == app)
*             {
*                 selectedApplicationIndex = i;
*                 selectApplication();
*                 break;
*             }
*     }
*     xrxASyncCallback( null, 0 ); // returns control to the framework
* }
*
* So in the following framework the first call is made and if failure goes to your error handler gen_failure() and your handler can decide if the framework continues.
* If successful it drops down to the next which is your success handler:
*
* framework = new Array();
* framework.push( ["getDefaultApplication", "gen_failure"] );
* framework.push( ["gda_success"] );
* xrxASyncFramework.load( framework );
* xrxASyncFramework.start();
*
* You can also add any normal non-webservice functions to the list and when you call xrxASyncCallback the second parameter can be 0 for success or 1 for failure.
*
*/
function XrxASyncFramework()
{
	this.framework = null;
	this.queue = new Array();
	this.step = 0;
	this.cancel = false;
	this.parameters = null;
	
	this.load = xrxASyncLoadFramework;
	this.start = xrxASyncStartFramework;
	this.stop = xrxASyncStopFramework;
	this.restart = xrxASyncStartFramework;
	this.store = xrxASyncStoreParameter;
	this.recall = xrxASyncGetParameter;
	this.clear = xrxASyncClear;
	this.success = xrxASyncSuccessCallback;
	this.failure = xrxASyncFailureCallback;
}

/**
* This function loads a new framework and returns internal values
* to default.
*
* @param	framework	framework to load
*/
function xrxASyncLoadFramework( framework )
{
	this.framework = framework;
	this.step = 0;
	this.cancel = false;
	this.parameters = new Array();
}

/**
* This function clears the data from the framework.
*/
function xrxASyncClear()
{
	this.cancel = true;
	this.parameters = null;
	this.framework = new Array();
	this.step = 0;
}

/**
* This function starts the framework executing.
*/
function xrxASyncStartFramework()
{
	eval( this.framework[this.step++][0] + "()" );
}

/**
* This function stops the framework.
*/
function xrxASyncStopFramework()
{
	this.cancel = true;
}

/**
* This function stores a given value.
*
* @param	name	name of stored value
* @param	value	value to store
*/
function xrxASyncStoreParameter( name, value )
{
	this.parameters[name] = value;
}

/**
* This function retreives a previously stored value.
*
* @param	name	name of stored value
*/
function xrxASyncGetParameter( name )
{
	return this.parameters[name];
}

/*************************  External Functions  *****************************/

/**
* This function is called upon successful conclusion of a webservice call.
*/
function xrxASyncSuccessCallback()
{
	xrxASyncCallback( arguments, 0 );
}

/**
* This function is called upon a failed conclusion of a webservice call.
*/
function xrxASyncFailureCallback()
{
	xrxASyncCallback( arguments, 1 );
}

/**
* This function is handles the callback. The arguments are stored 
* under p1 ... pn.
*
* @param	params	arguments sent from Ajax handler
* @param	code	0=successful, 1=failure
*/
function xrxASyncCallback( params, code )
{
	if(xrxASyncFramework.parameters != null)
	    if(params != null)
		    for(var i = 0;i < params.length;++i)
			    xrxASyncFramework.store( ("p" + i), params[i] );
	if(!xrxASyncFramework.cancel)
		if(xrxASyncFramework.framework[xrxASyncFramework.step] != undefined)
			if(xrxASyncFramework.framework[xrxASyncFramework.step] != null)
				eval( xrxASyncFramework.framework[xrxASyncFramework.step++][code] + "()" );
}

/*************************  End of File  *****************************/


/* 
* XrxXmlHandler.js
* Copyright (C) Xerox Corporation, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013.  All rights reserved.
*
* This file contains functions to handle XML as the Galio Ant browser 
* does not have XML support at this time.
*
*  Revisions
*               07/11/2011  BRP Updated to allow faster XML parsing
*               10/15/2012  AHB Updated
*               08/01/2013  AHB Updated formatting
*               08/30/2013  AHB Commented out error alert
*/

/****************************  Constants  *****************************/

/****************************  XML Parser  *****************************/

/**
* This is the top level call to get a DOM structure from a text XML message.
*
* @param thedoc		string XML
* @return Dom structure representing text given
*/
function xrxStringToDom( thedoc )
{
	return( new DOMParser().parseFromString( thedoc, "text/xml" ) );
}

/**************  XML Conversion Dom to String  ******************/

/**
* This function writes a XML DOM structure to a well formed 
* XML text representation.
*
* @param document	xml document
*/
function xrxDomToString( doc )
{
	return new XMLSerializer().serializeToString( doc );
}

/**********************  Helper Functions  *******************************/

/**
* This function makes the DOM call to get a new XML document.
*/
function xrx_getXmlDocument()
{
	return xrx_getXmlDocumentNS( "", "root" );
}

/**
* This function makes the DOM call to get a new XML document.
*/
function xrx_getXmlDocumentNS( ns, name )
{
	return document.implementation.createDocument( ns, name, null );
}

/**
* This function gets the element name of the node and strips off any 
* namespace prefix.
*
* @param node	node to get the name of
* @return unqualified name of node
*/
function xrxGetElementName( node )
{
	var name = "";
	try
	{
		var names = (node.nodeName).split( ":" );
		name = names[names.length - 1];
	}
	catch( e )
	{}
	return name;
}

/**
* This function searches the given DOM structure for nodes
* with the given name.
*
* @param xmldoc		XML document
* @param name		name of node to search for
* @return	array of nodes with given name or null
*/
function xrxFindElements( xmldoc, name )
{
	var result = null;
	var pos = 0;
	if(name == xrxGetElementName( xmldoc ))
	{
		result = new Array();
		result[pos++] = xmldoc;
	}
	var number = xmldoc.childNodes.length;
	for(var i = 0;i < number;++i)
	{
		if(name == xrxGetElementName( xmldoc.childNodes[i] ))
		{
			if(result == null) 
			    result = new Array();
			result[pos++] = xmldoc.childNodes[i];
		} else
		{
			if(xmldoc.childNodes[i].nodeType != 3)
			{
				var children = xrxFindElements( xmldoc.childNodes[i], name );
				if(children != null)
				{
					if(result == null) 
					    result = new Array();
					for(var x = 0;x < children.length;++x) 
					    result[pos++] = children[x];
                }
            }
        }
    }
    return result;
}

/***************************************************************************
* This function searches the given DOM structure for first node
* with the given name.
*
* @param xmldoc		XML document
* @param name		name of node to search for
* @return	array[0] of node with given name or null
***************************************************************************/
function xrxFindFirstElement( xmldoc, name ) 
{
    var result = null;
    var pos = 0;
    if (name == xrxGetElementName(xmldoc)) 
    {
        result = new Array();
        result[pos++] = xmldoc;
    }
    if (result == null) 
    {
        var number = xmldoc.childNodes.length;
        for (var i = 0; i < number; ++i) 
        {
            if (name == xrxGetElementName(xmldoc.childNodes[i])) 
            {
                if (result == null) 
                {
                    result = new Array();
                    result[pos++] = xmldoc.childNodes[i];
                    break;
                }
            } else 
            {
                if (xmldoc.childNodes[i].nodeType != 3) 
                {
                    var children = xrxFindFirstElement(xmldoc.childNodes[i], name);
                    if (children != null) 
                    {
                        if (result == null) 
                        {
                            result = new Array();
                            result[pos++] = children[0];
                        }
                    }
				}
			} 	
		}
	}
	return result;
}

/**
* This function searches the given DOM structure for the node 
* with the given name. This is done by searching given structure 
* for nodes with the given name and returning the first one. This 
* assumes the section of DOM structure given will only have one 
* node by that name.
*
* @param root		DOM structure
* @param name		name of node to search for
* @return	first node found with given name or null
*/
function xrxGetTheElement( root, name )
{
	var list = xrxFindElements( root, name );
    return (((list != null) && (list.length > 0)) ? list[0] : null);
}

/***************************************************************************
* This function searches the given DOM structure for the first node 
* with the given name. This is done by searching given structure 
* and returning the first one. 
*
* @param root		DOM structure
* @param name		name of node to search for
* @return	first node found with given name or null
***************************************************************************/
function xrxGetTheFirstElement( root, name ) 
{
    var list = xrxFindFirstElement(root, name);
	return (((list != null) && (list.length > 0))?list[0]:null);
}

/**
* This function searches the given DOM structure for the node 
* with the given name. This is done by searching given structure 
* for nodes with the given name and returning the first one. This 
* assumes the section of DOM structure given will only have one 
* node by that name.
*
* @param    root		    DOM structure
* @param    elements		array forming path names of node to search for
* @return	first node found with given name or null
*/
function xrxFindElement( root, elements )
{
	var list;
	var node = root;
	for(var i = 0;((node != null) && (i < elements.length));++i)
	{
		list = xrxFindElements( node, elements[i] );
        node = ((list != null) ? list[0] : null);
	}
	return node;
}

/**
* This function searches the given DOM structure for the node 
* with the given name and returns its value.
*
* @param root		DOM structure
* @param name		name of node to search for
* @return	value of first node found with given name or empty 
*			string or null if node not found
*/
function xrxGetElementValue( root, name )
{
	return xrxGetValue( xrxGetTheElement( root, name ) );
}

/***************************************************************************
* This function searches the given DOM structure for the first node 
* with the given name and returns its value.
*
* @param root		DOM structure
* @param name		name of node to search for
* @return	value of first node found with given name or empty 
*			string or null if node not found
***************************************************************************/
function xrxGetFirstElementValue( root, name ) 
{
    return xrxGetValue(xrxGetTheFirstElement( root, name ));
}

/**
* This function gets the value of the given element from a text string child
* if one exists.
*
* @param	el		given element
* @return	string	value of text string child or "" if tag there but empty 
*					or null if tag is not there
*/
function xrxGetValue( el )
{
	if(el != null)
		if(el.hasChildNodes())
		{
			var node = el.firstChild;
			while(node != null)
				if(node.nodeType == 3)
					return node.nodeValue;
				else
					node = node.nextSibling;
			return "";
		} else
		{
			return "";
		}
	else
		return null;
}

/**
* This function builds a node in a Xml Structure recursively using the 
* arguments given.
*
* @param	xmlDoc	xml document being built
* @param	params	array structure defining structure (see buildRequest()
*/
function xrxCreateNode( xmlDoc, params )
{
	return xrxCreateNodeNS( xmlDoc, xrxns, params );
}

/**
* This function builds a node in a Xml Structure recursively using the 
* arguments given.
*
* @param	xmlDoc	xml document being built
* @params	ns	namespace
* @param	params	array structure defining structure (see buildRequest()
*/
function xrxCreateNodeNS( xmlDoc, ns, params )
{
	var names = params[0].split( ":" );
	var node = xmlDoc.createElementNS( ns, names[names.length - 1] );
	if(names.length == 2) 
	    node.prefix = names[0];
	if(params.length > 1)
	{
		var child;
		for(var i = 1;i < params.length;++i)
		{
			if(typeof( params[i] ) != "string")
			{
				child = xrxCreateNodeNS( xmlDoc, ns, params[i] );
			} else
			{
				if(params[i] == "attribute")
				{
					node.setAttribute( params[i+1], params[i+2] );
					i += 2;
				} else
				{
					child = xmlDoc.createTextNode( params[i] );
				}
			}
			node.appendChild( child );
		}
	}
	return node;
}
 
 /**
 * This function builds a node using the current namespace value.
 *
 * @param xmlDoc	xml document being built
 * @param name		name of node to create
 * @return	created node
 */
 function xrxCreateSingleNode( xmlDoc, name )
 {
	return xmlDoc.createElementNS( xrxns, name );
 }
 
 /**
 * This function finds all elements of a given class.
 *
 * @param className	name of desired class
 * @return	array of nodes with given class
 */
function xrxGetElementsByClassName( className )
{
    var found = new Array();
    var tags = document.getElementsByTagName( "*" );
    var names;
    for(var i = 0;i < tags.length;i++)
    {
        names = tags[i].className.split(" ");
        for(var x = 0;x < names.length;x++)
            if(names[x] == className) 
                found.push( tags[i] );
    }
    return found;
}

/***************************  Support Functions  ****************************/

/**
* This function extends the String class to include a function to 
* trim whitespace from both ends.
*/
function xrxWSTrim( str )
{
    return xrxWSLtrim( xrxWSRtrim( str ) );
}

/**
* This function extends the String class to include a function to 
* trim whitespace from the left end.
*/
function xrxWSLtrim( str )
{
	var i;
	for(i = 0;i < str.length;++i) 
	    if(str.charAt(i) != ' ') 
	        break;
	if(i > 0) 
	    return str.substring( i, str.length );
    return str;
}

/**
* This function extends the String class to include a function to 
* trim whitespace from the right end.
*/
function xrxWSRtrim( str )
{
    var i;
	for(i = (str.length - 1);i >= 0;--i) 
	    if(str.charAt(i) != ' ') 
	        break;
	if(i < (str.length - 1)) 
	    return str.substring( 0, i );
    return str;
}

/*
* Function to replace characters in a string. Replacement is global. Necessary as current 
* browser has problems with String.replace().
*
* @param text	string to modify
* @param str	string to search for
* @param rstr	replacement string
* @return modified string
*/
function xrxReplaceChars( text, str, rstr )
{
	var result = new Array();
    try
    {
	    var index = text.indexOf( str );
	    var l = str.length;
	    var start = 0;
	    var cell = 0;
	    while(index >= 0)
	    {
		    result[cell++] = text.substring( start, index );
		    result[cell++] = rstr;
		    start = index + l;
		    index = text.indexOf( str, start );
	    }
	}
	catch( e )
	{
	    //alert(e);
	}
    result[cell] = text.substring( start );
	return( result.join( "" ) );
}

/*
* Function to unescape the escaped characters in a xml payload.
*
* @param text	string to modify
*/
function xrxUnescape( text )
{
	//text = unescape( text );
	text = xrxReplaceChars( text, "&lt;", "<" );
	text = xrxReplaceChars( text, "&gt;", ">" );
	//text = xrxReplaceChars( text, "&#xA;", "\\n" );
	text = xrxReplaceChars( text, "&quot;", "\"" );
	text = xrxReplaceChars( text, "&amp;", "&" );
	return text;
}


/**************************  End of File  *******************************************/

 
</script>


</head>

<body onload="javascript:getDeviceInformation();">

<form name="configsheet" action="${EIP_URLForward}">

<input type="hidden" name="serial" />
<input type="hidden" name="model" />
<input type="hidden" name="displayWidth" />
<input type="hidden" name="displayHeight" />
<input type="hidden" name="cardReaderUser" />
<input type="hidden" name="cardReaderEmail" />

</form>

</body>
</html>  