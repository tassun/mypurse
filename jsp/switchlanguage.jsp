<?xml version="1.0" encoding="TIS-620" ?>
<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
String fs_defaultLang = com.fs.bean.util.PageUtility.getParameter(request,"language");
if(fs_defaultLang!=null && !fs_defaultLang.trim().equals("")) {
	session.setAttribute("default_language",fs_defaultLang);	
}
System.out.println("SWITCH Language => "+session.getAttribute("default_language"));
%>
<message type="result">
<body><%=fs_defaultLang%></body>
</message>
