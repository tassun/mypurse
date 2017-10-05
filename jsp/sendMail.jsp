<%@ page contentType="text/html; charset=windows-874"%>
<%
	System.out.println(request.getQueryString());
%>
<HTML>
<HEAD>
<TITLE>head</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
</HEAD>
<BODY >
	Send Mail  <%=com.fs.bean.util.PageUtility.getParameter(request,"moreErr")%>
</BODY>
</HTML>