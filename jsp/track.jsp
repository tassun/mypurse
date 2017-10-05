<?xml version="1.0" encoding="TIS-620" ?>
<%@ page contentType="text/html; charset=UTF-8"%>
<%System.out.println("session : "+request.getSession().getId());%>
<message type="result">
<body>
<%=request.getSession().getId()%>
</body>
</message>