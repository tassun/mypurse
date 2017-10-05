<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.fs.bean.*" %>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.bean.misc.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/taglibs-formcontrol.tld" prefix="fs"%>
<%
	session.removeAttribute("fsTRXMDailyBean");
	session.removeAttribute("fsTRXDJournal");	
	session.removeAttribute("fsTRXMMonthlyBean");
	session.removeAttribute("fsTRXMYearlyBean");			
%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsScreen" scope="request" class="com.fs.dev.library.ScreenUtility"/>
<jsp:useBean id="fsLabel" scope="request" class="com.fs.bean.util.LabelConfig"/>
<jsp:useBean id="fsPager" scope="request" class="com.fs.bean.util.Pager"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<jsp:setProperty name="fsGlobal" property="*"/>
<jsp:useBean id="fsTRXDReportBean" scope="request" class="com.fs.bean.TRXDReportBean"/>
<jsp:setProperty name="fsTRXDReportBean" property="*"/>
<c:if test="${fsScreen.init('page_report',pageContext.request, pageContext.response,false)}"></c:if>
<%
boolean fsIsAjax = fsGlobal.isAjax();
boolean fsIsJSON = fsGlobal.isJson();
boolean fsIsJSONData = fsGlobal.isJsondata();
boolean fsIsXML = fsGlobal.isXml();
boolean fsIsXMLData = fsGlobal.isXmldata();
fsGlobal.setFsProg("page_report");
fsGlobal.setFsSection(null);
fsGlobal.obtain(session);
fsGlobal.obtain(fsAccessor);
String fs_forwarder = "/page_report/page_report_m.jsp";
try { 
	fsGlobal.setFsAction(GlobalBean.COLLECT_MODE);
	fsGlobal.setFsChapter(fsPager.getChapter());
	fsGlobal.setFsLimit(fsPager.getLimit());
	fsGlobal.setFsPage("1");
	fsTRXDReportBean.obtain(session,request);
	if(fsTRXDReportBean.getUserid()==null || fsTRXDReportBean.getUserid().trim().length()<=0) {
		fsTRXDReportBean.setUserid(fsAccessor.getFsUser());
	}
	BeanFormat formater = new BeanFormat();	
	//fsTRXDReportBean.setFromdate(formater.formatDate(butil.getFirstDateOfMonth(new java.util.Date()),"dd/MM/yyyy"));
	//fsTRXDReportBean.setTodate(formater.formatDate(new java.util.Date(),"dd/MM/yyyy"));
	if(fsTRXDReportBean.getFromdate()==null || fsTRXDReportBean.getFromdate().trim().length()<=0) {
		BeanUtility butil = new BeanUtility();
		fsTRXDReportBean.setFromdate(formater.formatDate(butil.getFirstDateOfMonth(new java.util.Date()),"dd/MM/yyyy"));
	}
	if(fsTRXDReportBean.getTodate()==null || fsTRXDReportBean.getTodate().trim().length()<=0) {
		fsTRXDReportBean.setTodate(formater.formatDate(new java.util.Date(),"dd/MM/yyyy"));
	}
	fsTRXDReportBean.transport(fsGlobal);
}catch(Exception ex) { 
	Trace.error(fsAccessor,ex);
	fsGlobal.setThrowable(ex);
	if(fsIsAjax) {
		fsGlobal.createResponseStatus(out, response);
		return;
	}
}
fsPager.setRows(fsTRXDReportBean.size());
fsTRXDReportBean.obtain(session,request);
if(fsIsJSONData) {
	out.print(fsTRXDReportBean.toJSONData("rows"));
	return;
}
if(fsIsJSON) {
	out.print(fsTRXDReportBean.toJSON());
	return;
}
if(fsIsXMLData) {
	out.print("<?xml version=\"1.0\" encoding=\""+GlobalVariable.getEncoding()+"\"?>");
	out.print(fsTRXDReportBean.toXMLDatas());
	return;
}
if(fsIsXML) {
	out.print("<?xml version=\"1.0\" encoding=\""+GlobalVariable.getEncoding()+"\"?>");
	out.print(fsTRXDReportBean.toXML());
	return;
}
RequestDispatcher rd = application.getRequestDispatcher(fs_forwarder);
rd.forward(request, response);
%>
