<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/taglibs-formcontrol.tld" prefix="fs"%>

<%@ page import="com.fs.bean.*" %>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.bean.misc.*"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsScreen" scope="request" class="com.fs.dev.library.ScreenUtility"/>
<jsp:useBean id="fsLabel" scope="request" class="com.fs.bean.util.LabelConfig"/>
<jsp:useBean id="fsPager" scope="request" class="com.fs.bean.util.Pager"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<jsp:setProperty name="fsGlobal" property="*"/>
<jsp:useBean id="fsTRXMMonthlyBean" scope="session" class="com.fs.bean.TRXMReportBean"/>
<jsp:useBean id="fsTUserReportBean" scope="request" class="com.fs.bean.TUserReportBean"/>
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
String fs_forwarder = "/page_report/page_report_monthly_export_excel.jsp";
String fs_reporttype = request.getParameter("reporttype");
if("pdf".equalsIgnoreCase(fs_reporttype)) fs_forwarder = "/page_report/page_report_monthly_export_pdf.jsp";
System.out.println("page_report_monthly_export.jsp > "+fs_forwarder);
try { 
	fsGlobal.setFsAction(GlobalBean.RETRIEVE_MODE);
	fsTUserReportBean.obtain(fsGlobal);
	fsTUserReportBean.obtain(session,request);
	if(fsTUserReportBean.getUserid()==null || fsTUserReportBean.getUserid().trim().length()<=0) {
		fsTUserReportBean.setUserid(fsTRXMMonthlyBean.getUserid());
	}
	fsTUserReportBean.transport(fsGlobal);
}catch(Exception ex) { 
	Trace.error(fsAccessor,ex);
	fsGlobal.setThrowable(ex);
	if(fsIsAjax) {
		fsGlobal.createResponseStatus(out, response);
		return;
	}
}
RequestDispatcher rd = application.getRequestDispatcher(fs_forwarder);
rd.forward(request, response);
%>
