<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.fs.bean.*" %>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.bean.misc.*"%>
<%@ page import="com.fs.dev.mail.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/taglibs-formcontrol.tld" prefix="fs"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsScreen" scope="request" class="com.fs.dev.library.ScreenUtility"/>
<jsp:useBean id="fsLabel" scope="request" class="com.fs.bean.util.LabelConfig"/>
<jsp:useBean id="fsPager" scope="request" class="com.fs.bean.util.Pager"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<jsp:setProperty name="fsGlobal" property="*"/>
<jsp:useBean id="fsResetPasswordBean" scope="request" class="com.fs.dev.purse.ResetPasswordBean"/>
<jsp:setProperty name="fsResetPasswordBean" property="*"/>
<c:if test="${fsScreen.config('page_forgot',pageContext.request, pageContext.response,true)}"></c:if>
<%
boolean fsIsAjax = fsGlobal.isAjax();
boolean fsIsJSON = fsGlobal.isJson();
boolean fsIsJSONData = fsGlobal.isJsondata();
boolean fsIsXML = fsGlobal.isXml();
boolean fsIsXMLData = fsGlobal.isXmldata();
fsGlobal.setFsProg("page_forgot");
fsGlobal.setFsSection(null);
fsGlobal.obtain(session);
fsGlobal.obtain(fsAccessor);
String fs_forwarder = "/page_forgot/page_forgot_de.jsp";
try { 
	int fs_action = fsGlobal.parseAction();
	String fsSecureImage = (String)session.getAttribute("fsSecureImage");
	if(!fsResetPasswordBean.getSecurecode().equals(fsSecureImage)) throw new Exception("Secure code is invalid");
	fsGlobal.setFsAction(GlobalBean.UPDATE_MODE);
	fsGlobal.obtain(fsAccessor);
	fsResetPasswordBean.obtain(session,request);
	fsResetPasswordBean.transport(fsGlobal);
	System.out.println("effected transaction : "+fsResetPasswordBean.effectedTransactions());
	if(fsResetPasswordBean.effectedTransactions()>0) {
		java.util.Map map = (java.util.Map)XMLConfig.create(request).getConfigure("FORGOTMAIL");
		Trace.info(map);
		if(map!=null) {
			String fs_email = fsResetPasswordBean.getPrivacy();
			if(fs_email==null || fs_email.trim().length()<=0) fs_email = fsResetPasswordBean.getEmail();
			if(fs_email!=null && fs_email.trim().length()>0) {
				StringBuffer msg = new StringBuffer();
				msg.append("Dear, "+fsResetPasswordBean.getUsername()+"<br>");
				msg.append("Confirm your password was changed<br>");
				msg.append("user = "+fsResetPasswordBean.getUserid()+"<br>");
				msg.append("new password = "+fsResetPasswordBean.getUserpassword()+"<br>");
				msg.append("       yours sincerely,<br>");
				Trace.info("forgot password : "+fsResetPasswordBean.getUserid()+" ("+fs_email+")");
				SendMail mailer = new SendMail();
				mailer.obtain(map);
				mailer.setTo(fs_email);
				mailer.setMessage(msg.toString());
				mailer.start();
			}
		}
	}
}catch(Exception ex) { 
	Trace.error(fsAccessor,ex);
	fsGlobal.setThrowable(ex);
	if(fsIsAjax) {
		fsGlobal.createResponseStatus(out, response);
		return;
	}
}
fsResetPasswordBean.obtain(session,request);
if(fsIsJSONData) {
	out.print(fsResetPasswordBean.toJSONData("rows"));
	return;
}
if(fsIsJSON) {
	out.print(fsResetPasswordBean.toJSON());
	return;
}
if(fsIsXMLData) {
	out.print("<?xml version=\"1.0\" encoding=\""+GlobalVariable.getEncoding()+"\"?>");
	out.print(fsResetPasswordBean.toXMLDatas());
	return;
}
if(fsIsXML) {
	out.print("<?xml version=\"1.0\" encoding=\""+GlobalVariable.getEncoding()+"\"?>");
	out.print(fsResetPasswordBean.toXML());
	return;
}
RequestDispatcher rd = application.getRequestDispatcher(fs_forwarder);
rd.forward(request, response);
%>
