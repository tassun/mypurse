<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%System.out.println("tracking session : "+request.getSession().getId());%>
<message type="result">
<body>
<%=request.getSession().getId()%>
</body>
</message>