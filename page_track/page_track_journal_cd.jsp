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
<jsp:useBean id="fsTULJournal" scope="session" class="com.fs.bean.TULBean"/>
<c:if test="${fsScreen.init('page_track',pageContext.request, pageContext.response,true)}"></c:if>
<c:if test="${fsScreen.validateUserType(fsAccessor,'A')}"></c:if>
<%
boolean fsIsAjax = fsGlobal.isAjax();
fsGlobal.setFsProg("page_track");
fsGlobal.setFsSection(null);
fsGlobal.obtain(session);
fsGlobal.obtain(fsAccessor);
String fs_forwarder = "/page_track/page_track_journal_d.jsp";
try { 
	String fsSorter = request.getParameter("fsSorter");
	if(fsSorter!=null) {
		fsTULJournal.sort(fsSorter);
		fsGlobal.obtainPage(request);
	}
}catch(Exception ex) { 
	Trace.error(fsAccessor,ex);
	fsGlobal.setThrowable(ex);
	if(fsIsAjax) {
		fsGlobal.createResponseStatus(out, response);
		return;
	}
}
fsPager.setRows(fsTULJournal.size());
fsTULJournal.obtain(session,request);
RequestDispatcher rd = application.getRequestDispatcher(fs_forwarder);
rd.forward(request, response);
%>
