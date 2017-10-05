<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.fs.bean.*" %>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.bean.misc.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/taglibs-formcontrol.tld" prefix="fs"%>
<% 
	session.removeAttribute("fsTULBean"); 
	session.removeAttribute("fsTULJournal");
%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsScreen" scope="request" class="com.fs.dev.library.ScreenUtility"/>
<jsp:useBean id="fsLabel" scope="request" class="com.fs.bean.util.LabelConfig"/>
<jsp:useBean id="fsPager" scope="request" class="com.fs.bean.util.Pager"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<jsp:setProperty name="fsGlobal" property="*"/>
<jsp:useBean id="fsTULBean" scope="session" class="com.fs.bean.TULBean"/>
<jsp:setProperty name="fsTULBean" property="*"/>
<c:if test="${fsScreen.init('page_track',pageContext.request, pageContext.response,false)}"></c:if>
<c:if test="${fsScreen.validateUserType(fsAccessor,'A')}"></c:if>
<%
boolean fsIsAjax = fsGlobal.isAjax();
boolean fsIsJSON = fsGlobal.isJson();
boolean fsIsJSONData = fsGlobal.isJsondata();
boolean fsIsXML = fsGlobal.isXml();
boolean fsIsXMLData = fsGlobal.isXmldata();
fsGlobal.setFsProg("page_track");
fsGlobal.setFsSection(null);
fsGlobal.obtain(session);
fsGlobal.obtain(fsAccessor);
String fs_forwarder = "/page_track/page_track_m.jsp";
try { 
	fsGlobal.setFsAction(GlobalBean.COLLECT_MODE);
	fsGlobal.setFsChapter(fsPager.getChapter());
	fsGlobal.setFsLimit(fsPager.getLimit());
	fsGlobal.setFsPage("1");
	fsTULBean.obtain(session,request);
	BeanFormat formater = new BeanFormat();	
	fsTULBean.setFromdate(formater.formatDate(new java.util.Date(),"dd/MM/yyyy"));
	fsTULBean.setTodate(formater.formatDate(new java.util.Date(),"dd/MM/yyyy"));
	fsTULBean.transport(fsGlobal);
}catch(Exception ex) { 
	Trace.error(fsAccessor,ex);
	fsGlobal.setThrowable(ex);
	if(fsIsAjax) {
		fsGlobal.createResponseStatus(out, response);
		return;
	}
}
fsPager.setRows(fsTULBean.size());
fsTULBean.obtain(session,request);
if(fsIsJSONData) {
	out.print(fsTULBean.toJSONData("rows"));
	return;
}
if(fsIsJSON) {
	out.print(fsTULBean.toJSON());
	return;
}
if(fsIsXMLData) {
	out.print("<?xml version=\"1.0\" encoding=\""+GlobalVariable.getEncoding()+"\"?>");
	out.print(fsTULBean.toXMLDatas());
	return;
}
if(fsIsXML) {
	out.print("<?xml version=\"1.0\" encoding=\""+GlobalVariable.getEncoding()+"\"?>");
	out.print(fsTULBean.toXML());
	return;
}
RequestDispatcher rd = application.getRequestDispatcher(fs_forwarder);
rd.forward(request, response);
%>
