<%--
/**
 * ObjectProps.jsp
 * This page displays the DSPropDescs for a DSClass.
 * 
 * @authors Diane Fraser, Collin Lee
 */
--%>


<%@ page import="com.xerox.docushare.*" %>
<%@ page import="com.xerox.docushare.object.*" %>
<%@ page import="com.xerox.docushare.config.*" %>
<%@ page import="com.xerox.docushare.monitor.*" %>
<%@ page import="com.xerox.docushare.impl.*" %>

<html>


<head>
<title>
DocuShare
</title>
</head>
<body>
<% 
    try
    {
    	DSSession dssession = (DSSession)request.getAttribute("DSSession");
    	DSUser dsUser = (DSUser)dssession.getLoginPrincipal();

    	DSHandle handle = new DSHandle(request.getParameter("Collection"));
    	DSCollection collection = (DSCollection) dssession.getObject(handle);
   
    	DSObjectIterator iter = collection.children(null);

    	String tofindtype  = request.getParameter("Type");
    	String tofindtitle = request.getParameter("Title");
    	boolean t=true;
    	int i=0;

	for (i=0; i<iter.size(); i++)
    	{
    	   DSObject child = iter.nextObject();

           if (tofindtype.equals(child.getDSClass().getName()) && tofindtitle.equals(child.getTitle()))
	   {
%>
	      <input type="hidden" id="<%= child.getHandle() %>" name="dsfind">
	      <%= child.getTitle() %> <%= request.getParameter("Date") %>
	      </input>
<%	
	      i = iter.size();
	   }
	
       }
    } catch (Exception e) {
%>
	      <input type="hidden" id="Failed: Operation Aborted" name="dsfind">
	      Failed: Operation Aborted
	      </input>
<%
    }
%>


</body>
</html>

 