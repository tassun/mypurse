<%@ page info="SCCS id: $Id$" %>
<%@ page import="com.fs.bean.util.*"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<jsp:useBean id="fsLogonBean" scope="request" class="com.fs.dev.purse.SignonBean"/>
<jsp:setProperty name="fsLogonBean" property="*"/>
<%
	String fs_forwarder = "/logon/logon_sc.jsp"; 
	Object active_authen = GlobalVariable.getVariable("ACTIVE_AUTHENTICATE");
	if(active_authen!=null && "true".equalsIgnoreCase(active_authen.toString())) {
		fs_forwarder = "/logon/logon_ac.jsp"; 
	}
	RequestDispatcher rd = application.getRequestDispatcher(fs_forwarder);
	rd.forward(request,response);
	return;
%>