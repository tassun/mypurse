<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.fs.bean.*" %>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.bean.misc.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/taglibs-formcontrol.tld" prefix="fs"%>
<% session.removeAttribute("fsTXRPBean"); %>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsScreen" scope="request" class="com.fs.dev.library.ScreenUtility"/>
<jsp:useBean id="fsLabel" scope="request" class="com.fs.bean.util.LabelConfig"/>
<jsp:useBean id="fsPager" scope="request" class="com.fs.bean.util.Pager"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<jsp:setProperty name="fsGlobal" property="*"/>
<jsp:useBean id="fsTRXPBean" scope="session" class="com.fs.bean.TRXPBean"/>
<jsp:setProperty name="fsTRXPBean" property="*"/>
<c:if test="${fsScreen.init('page_item',pageContext.request, pageContext.response,true)}"></c:if>
<%
System.out.println(fsAccessor);
boolean fsIsAjax = fsGlobal.isAjax();
boolean fsIsJSON = fsGlobal.isJson();
boolean fsIsJSONData = fsGlobal.isJsondata();
boolean fsIsXML = fsGlobal.isXml();
boolean fsIsXMLData = fsGlobal.isXmldata();
fsGlobal.setFsProg("page_item");
fsGlobal.setFsSection(null);
fsGlobal.obtain(session);
fsGlobal.obtain(fsAccessor);
String fs_forwarder = "/page_item/page_item_m.jsp";
try { 
	fsGlobal.setFsAction(GlobalBean.COLLECT_MODE);
	fsGlobal.setFsChapter(fsPager.getChapter());
	fsGlobal.setFsLimit(fsPager.getLimit());
	fsGlobal.setFsPage("1");
	fsTRXPBean.obtain(session,request);
	if(fsTRXPBean.getUserid()==null || fsTRXPBean.getUserid().trim().length()<=0) {
		fsTRXPBean.setUserid(fsAccessor.getFsUser());
	}
	fsTRXPBean.transport(fsGlobal);
}catch(Exception ex) { 
	Trace.error(fsAccessor,ex);
	fsGlobal.setThrowable(ex);
	if(fsIsAjax) {
		fsGlobal.createResponseStatus(out, response);
		return;
	}
}
fsPager.setRows(fsTRXPBean.size());
fsTRXPBean.obtain(session,request);
if(fsIsJSONData) {
	out.print(fsTRXPBean.toJSONData("rows"));
	return;
}
if(fsIsJSON) {
	out.print(fsTRXPBean.toJSON());
	return;
}
if(fsIsXMLData) {
	out.print("<?xml version=\"1.0\" encoding=\""+GlobalVariable.getEncoding()+"\"?>");
	out.print(fsTRXPBean.toXMLDatas());
	return;
}
if(fsIsXML) {
	out.print("<?xml version=\"1.0\" encoding=\""+GlobalVariable.getEncoding()+"\"?>");
	out.print(fsTRXPBean.toXML());
	return;
}
RequestDispatcher rd = application.getRequestDispatcher(fs_forwarder);
rd.forward(request, response);
%>
