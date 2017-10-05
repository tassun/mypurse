<?xml version="1.0" encoding="UTF-8"?>
<%@ page info="SCCS id: $Id$" %>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.bean.ctrl.*"%>
<%@ page import="com.fs.bean.misc.*" %>
<%@ page import="com.fs.bean.lookup.*" %>
<%@ page contentType="text/xml; charset=UTF-8"%>
<% com.fs.bean.util.PageUtility.initialPage(request,response); %>
<jsp:useBean id="fsGlobal" scope="session" class="com.fs.bean.util.GlobalBean"/>
<%
	String section = PageUtility.getParameter(request,"section");
	String param = PageUtility.getParameter(request,"param");
	String lang = PageUtility.getParameter(request,"lang");
	//lang = "EN";
	long time1 = System.currentTimeMillis();
	System.out.println("section = "+section+"|| param = "+param+"|| lang = "+lang);
	String xml = (String)ResultManager.get(section);
	if(xml==null) {
		System.out.println("xml==null");
	} else {
		if(param!=null && !param.trim().equals("")) {
			String value = param;
			String fs_forwarder = (String)GlobalVariable.getVariable("LOOKUP_SERVLET");
			if(fs_forwarder==null || fs_forwarder.equals("")) fs_forwarder = "/servlet/collector";
			Trace.debug("forward to "+fs_forwarder+" with section "+section+" for value "+value);
			request.setAttribute("section",section);
			request.setAttribute("value",value);
			if(lang==null) lang ="EN";
			request.setAttribute("language",lang);
			RequestDispatcher rd = application.getRequestDispatcher(fs_forwarder);
			rd.forward(request,response);			
			return;
		}
	}
	long time2 = System.currentTimeMillis();
	Trace.info("= lookup.jsp = response time == "+(time2-time1)+" ==");
%>
<root>
	<%=xml%>
</root>
