<?xml version="1.0" encoding="UTF-8" ?>
<%@ page info="SCCS id: $Id$" %>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.dev.servlet.*"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<%
	String msgType = "result";
	StringBuffer result = new StringBuffer();
	String type = PageUtility.getParameter(request,"type");
	String key = PageUtility.getParameter(request,"key");
	String value = PageUtility.getParameter(request,"value");
	if(type!=null) {
		result.append("<type>"+type+"</type>\n");
		if(type.equalsIgnoreCase("set")) {
			if((key!=null) && (value!=null)) {
				result.append("<key>"+key+"</key>\n");
				result.append("<value>"+value+"</value>\n");
				fsAccessor.setFsVar(key,value);
			}
		} else if(type.equalsIgnoreCase("get")) {
			if(key!=null) {
				result.append("<key>"+key+"</key>\n");
				result.append("<value>"+fsAccessor.getFsVar(key)+"</value>\n");				
			}
		} else if(type.equalsIgnoreCase("xml")) {
			if(key!=null) {
				AccessorBean bean = TheSession.getAccessorByKey(key);
				if(bean!=null) {
					out.print(bean.toXML());
					return;
				}
				result.append("<value>Accessor not found</value>");
				msgType = "none";
			} else {
				out.print(fsAccessor.toXML());
				return;
			}
		}
	} else {
		msgType = "error";
		result.append("Type is undefined");
	}
%>
<message type="<%=msgType%>">
	<%=result.toString()%>
</message>
