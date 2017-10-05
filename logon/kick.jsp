<?xml version="1.0" encoding="UTF-8" ?>
<%@ page info="SCCS id: $Id$" %>
<%@ page import="com.fs.dev.servlet.*" %>
<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
String fs_user = request.getParameter("fsUser");
if(fs_user!=null && fs_user.trim().length()>0) {
	TheSession.invalidate(fs_user);
}
StringBuffer result = new StringBuffer();
result.append("<body>Kick Out</body>");
%>
<message type="result">
	<%=result.toString()%>
</message>
