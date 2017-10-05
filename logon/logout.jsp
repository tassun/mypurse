<?xml version="1.0" encoding="UTF-8" ?>
<%@ page info="SCCS id: $Id$" %>
<%@ page import="com.fs.dev.auth.*"%>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.bean.ctrl.*"%>
<%@ page import="com.fs.bean.misc.*"%>
<%@ page import="com.fs.bean.*" %>
<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<% com.fs.bean.util.PageUtility.initialPage(request,response); %>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsGlobal" scope="page" class="com.fs.bean.util.GlobalBean"/>
<%
fsGlobal.setFsVar("fsUser",fsAccessor.getFsUser());
fsGlobal.setFsVar("fsBranch",fsAccessor.getFsBranch());
fsGlobal.setFsVar("fsSite",fsAccessor.getFsSite());
fsGlobal.setFsProg("logout");
Tracker.track(fsGlobal,Logger.ACTION_STYLE+Logger.INOUT_STYLE);
fsAccessor.wrap(new AccessorBean());
StringBuffer result = new StringBuffer();
result.append("<body>Signout</body>");
session.removeAttribute("signoncounter"); 
session.removeAttribute("fsAccessor");
request.getSession().invalidate();
%>
<message type="result">
	<%=result.toString()%>
</message>
