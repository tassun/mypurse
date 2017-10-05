<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.dom.*"%>
<%session.putValue("progname","Global Variable Information");%>
<%session.putValue("progid","global");%>
<%session.putValue("progversion","$Revision$");%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<html>
<meta http-equiv="content-type" content="text/html; charset=windows-874">
<title>Global Variables</title>
<head>
<link href="../css/fsstyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file = "/jsp/header.jsp"%>
<table border="1" width="100%">
	<tr>
		<form name="newform" method="post" action="global_c.jsp">
		<td colspan="3">
			<input type="submit" value="Add New Key"></input><input type="hidden" name="action" value="add"></input>
		</td>
		</form>
	</tr>
	<tr>
		<th>Key</th><th>Value</th><th>Description</th>
	</tr>
<%
	DOMReader dom = new DOMReader();
	String realpath = request.getSession().getServletContext().getRealPath("");
	String filename = realpath+java.io.File.separator+"global"+java.io.File.separator+"global_descriptor.xml";
	java.io.FileInputStream fin = new java.io.FileInputStream(filename);
	dom.loadXML(fin);
	java.util.Hashtable hat = dom.getRootAttributes();
	java.util.Enumeration en = GlobalVariable.variables();
	for(;en.hasMoreElements();) {
		String key = (String)en.nextElement();	      
		if(key.equals("CONFIG")) continue; //ignore root tag
		String value = "";
		Object object = GlobalVariable.getVariable(key);
		if(object!=null) value = object.toString();
		String desc = (String)hat.get(key);
		if(desc==null) desc = "";
		desc = BeanUtility.nativeToUnicode(desc);
		out.println("<tr>");
		out.println("<form name=\"detform\" method=\"post\" action=\"global_c.jsp\">");
		out.println("<input type=\"hidden\" name=\"key\" value=\""+key+"\"></input>");
		out.println("<input type=\"hidden\" name=\"value\" value=\""+value+"\"></input>");
		out.println("<td><a href=\"#0\" ondragstart=\"return false;\" onclick=\"submit()\">"+key+"</a></td>");
		out.println("<td>"+value+"&nbsp;</td>");
		out.println("<td>"+desc+"&nbsp;</td>");
		out.println("</form>");
		out.println("</tr>");
	}
%>
</table>
</body>
</html>