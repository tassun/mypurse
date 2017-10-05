<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.dom.*"%>
<html>
<meta http-equiv="content-type" content="text/html; charset=windows-874">
<title>Global Variables</title>
<head>
<link href="../CSS/fsstyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<table border="1">
	<tr>
		<th>Key</th><th>Value</th><th>Description</th>
	</tr>
<%
	DOMReader dom = new DOMReader();
	String realpath = request.getSession().getServletContext().getRealPath("");
	String filename = realpath+java.io.File.separator+"jsp"+java.io.File.separator+"global_descriptor.xml";
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
		out.println("<form name=\"detform\" method=\"post\" action=\"variables_c.jsp\">");
		out.println("<input type=\"hidden\" name=\"key\" value=\""+key+"\"></input>");
		out.println("<input type=\"hidden\" name=\"value\" value=\""+value+"\"></input>");
		out.println("<td><a href=\"javascript:void(0)\" ondragstart=\"return false;\" onclick=\"submit()\">"+key+"</a></td>");
		out.println("<td>"+value+"&nbsp;</td>");
		out.println("<td>"+desc+"&nbsp;</td>");
		out.println("</form>");
		out.println("</tr>");
	}
%>
</table>
</body>
</html>