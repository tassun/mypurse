<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.fs.dev.strok.service.*" %>
<%
	String result = "";
	String hn = request.getParameter("hn");
	if(hn!=null) {
		ThePatient pt = new ThePatient();
		Patient p = pt.getPatientByHN(hn);
		result = p.toJSONObject().toString();
	}
%>
<%=result%>