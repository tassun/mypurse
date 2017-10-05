<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.fs.bean.*" %>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.bean.misc.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/taglibs-formcontrol.tld" prefix="fs"%>
<%session.removeAttribute("fsTUserReportBean");%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsScreen" scope="request" class="com.fs.dev.library.ScreenUtility"/>
<jsp:useBean id="fsLabel" scope="request" class="com.fs.bean.util.LabelConfig"/>
<jsp:useBean id="fsPager" scope="request" class="com.fs.bean.util.Pager"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<jsp:setProperty name="fsGlobal" property="*"/>
<jsp:useBean id="fsTUserReportBean" scope="request" class="com.fs.bean.TUserReportBean"/>
<jsp:setProperty name="fsTUserReportBean" property="*"/>
<c:if test="${fsScreen.init('page_user',pageContext.request, pageContext.response,true)}"></c:if>
<c:if test="${fsScreen.validateUserType(fsAccessor,'A')}"></c:if>
<%
boolean fsIsAjax = fsGlobal.isAjax();
boolean fsIsJSON = fsGlobal.isJson();
boolean fsIsJSONData = fsGlobal.isJsondata();
boolean fsIsXML = fsGlobal.isXml();
boolean fsIsXMLData = fsGlobal.isXmldata();
fsGlobal.setFsProg("page_user");
fsGlobal.setFsSection(null);
fsGlobal.obtain(session);
fsGlobal.obtain(fsAccessor);
String fs_forwarder = "/page_user/page_user_info_de.jsp";
System.out.println("page_user_info_c.jsp > "+fs_forwarder);
int fs_action = fsGlobal.parseAction();
try { 
	fsGlobal.setFsAction(GlobalBean.RETRIEVE_MODE);
	fsTUserReportBean.obtain(session,request);
	fsTUserReportBean.transport(fsGlobal);
}catch(Exception ex) { 
	Trace.error(fsAccessor,ex);
	fsGlobal.setThrowable(ex);
	if(fsIsAjax) {
		fsGlobal.createResponseStatus(out, response);
		return;
	}
}
fsTUserReportBean.obtain(session,request);
if(fsIsJSONData) {
	out.print(fsTUserReportBean.toJSONData("rows"));
	return;
}
if(fsIsJSON) {
	out.print(fsTUserReportBean.toJSON());
	return;
}
if(fsIsXMLData) {
	out.print("<?xml version=\"1.0\" encoding=\""+GlobalVariable.getEncoding()+"\"?>");
	out.print(fsTUserReportBean.toXMLDatas());
	return;
}
if(fsIsXML) {
	out.print("<?xml version=\"1.0\" encoding=\""+GlobalVariable.getEncoding()+"\"?>");
	out.print(fsTUserReportBean.toXML());
	return;
}
RequestDispatcher rd = application.getRequestDispatcher(fs_forwarder);
rd.forward(request, response);
%>
