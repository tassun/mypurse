<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.fs.dev.strok.service.*" %>
<%
	String result = "";
	String pid = request.getParameter("pid");
	if(pid!=null) {
		ThePatient pt = new ThePatient();
		Patient p = pt.getPatientByID(pid);
		result = p.toJSONObject().toString();
	}
%>
<%=result%>