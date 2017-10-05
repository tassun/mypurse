<?xml version="1.0" encoding="UTF-8" ?>
<%@ page errorPage="/jsp/xmlerrorpage.jsp"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.bean.ctrl.*"%>
<%@ page import="com.fs.bean.misc.*"%>
<%@ page import="com.fs.bean.*" %>
<%@ page import="com.fs.dev.security.*"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<jsp:useBean id="fsLogonBean" scope="request" class="com.fs.dev.purse.SignonBean"/>
<jsp:setProperty name="fsLogonBean" property="*"/>
<%
Trace.info("signin "+request.getContextPath()+" : "+request.getQueryString());
session.setAttribute("fsLogonBean.user",fsLogonBean.getUser());
session.setAttribute("fsLogonBean.password",fsLogonBean.getPassword());
fsGlobal.setFsVar("fsAddress",request.getRemoteAddr());
StringBuffer result = new StringBuffer();
if(fsLogonBean.getUser().trim().equals("")) {
	String fs_msg = "User or Password is undefined";
	fs_msg = ErrorConfig.getError("5001",fs_msg);
	fsGlobal.setFsMessage(fs_msg);
	result.setLength(0);
	result.append("<root type=\"error\">");
	result.append("<body>").append(fs_msg).append("</body>");
	result.append("</root>");
	out.println(result.toString());
	return;
}
fsGlobal.setFsProg("signin");
fsGlobal.setFsVar("fsUser",fsLogonBean.getUser());
fsGlobal.setFsVar("fsBranch",fsLogonBean.getBranch());
ActiveUser fsActiveUser = null;
String signon = (String)GlobalVariable.getVariable("VALIDATE_SIGNON");
if((signon!=null) && signon.equalsIgnoreCase("true")) {
	int maxfailure = 3;
	String maxfail = (String)GlobalVariable.getVariable("MAXFAIL_SIGNON");
	if((maxfail!=null) && !maxfail.trim().equals("")) {
		try {
			maxfailure = Integer.parseInt(maxfail);
		} catch(Exception ex) { maxfailure = 3; }
	}
	Integer counter = (Integer)session.getAttribute(fsLogonBean.getUser()+"_signoncounter");
	if(counter==null) counter = new Integer(0);
	if(counter.intValue()>=maxfailure) {
		String fs_msg = "Signon failure over "+maxfailure+" times.";
		fs_msg = ErrorConfig.getError("5003",fs_msg,new String[] { ""+maxfailure });
		fsGlobal.setFsMessage(fs_msg);
		result.setLength(0);
		result.append("<root type=\"error\">");
		result.append("<body>").append(fs_msg).append("</body>");
		result.append("</root>");
		out.println(result.toString());
		return;		
	}
	try {
		String fs_user = fsLogonBean.getUser();
		String fs_password = fsLogonBean.getPassword();
		ActiveAuthen authen = new ActiveAuthen();
		fsActiveUser = authen.authenticate(fs_user,fs_password);
		System.out.println("active user : "+fsActiveUser);
		session.removeAttribute(fsLogonBean.getUser()+"_signoncounter"); 
	} catch(Exception ex) {
		fsGlobal.setThrowable(ex);	
		if((counter.intValue()+1)>=maxfailure) {
				com.fs.dev.strok.LockBean fsLockBean = new com.fs.dev.strok.LockBean();
				fsLockBean.setUser(fsLogonBean.getUser());
				fsLockBean.setLock("1");
				GlobalBean fsHandler = (GlobalBean)fsGlobal;
				fsHandler.setFsAction(GlobalBean.UPDATE_MODE);
				TheTransportor.transport(fsHandler,fsLockBean);
		}
		session.setAttribute(fsLogonBean.getUser()+"_signoncounter",new Integer(counter.intValue()+1));	
		Tracker.track(fsGlobal);
		
		result.setLength(0);
		result.append("<root type=\"error\">");
		result.append("<body>").append(fsGlobal.getFsMessage()).append("</body>");
		result.append("</root>");
		out.println(result.toString());
		return;
	}
}
if((fsLogonBean.getLogondate()==null) || fsLogonBean.getLogondate().equals("")) {
	BeanFormat formater = new BeanFormat();
	java.util.Date date = new java.util.Date();
	fsLogonBean.setLogondate(formater.formatDate(date,"dd/MM/yyyy"));
}
fsAccessor.setFsKey(session.getId());
fsLogonBean.assign(fsAccessor);
if(fsActiveUser!=null) {
	fsAccessor.setFsVar("fsUserName",fsActiveUser.getCommonName());
}
Trace.debug(fsLogonBean);
Trace.debug(fsAccessor);
fsGlobal.retain(request);
Tracker.trace(fsGlobal);
final GlobalBean fsAccessHandler = (GlobalBean)fsGlobal;
final com.fs.dev.strok.AccessBean access = new com.fs.dev.strok.AccessBean();
access.setAccessor(fsLogonBean.getUser());
new Thread() {
	public void run() {
		try { access.update(fsAccessHandler); }catch(Exception ex) { }
		this.stop();
	}
}.start();
session.setAttribute("fsLogonBean.securepassword",fsLogonBean.getPassword());
result.append("<root type=\"result\">");
result.append("<body>Signon</body>");
result.append("<branch>"+fsLogonBean.getBranch()+"</branch>");
result.append("<fskey>"+fsAccessor.getFsKey()+"</fskey>");
String fs_defaultLang = PageUtility.getParameter(request,"language");
if(fs_defaultLang!=null && !fs_defaultLang.trim().equals("")) {
	session.setAttribute("default_language",fs_defaultLang);	
	result.append("<language>").append(fs_defaultLang).append("</language>");
}
result.append(fsAccessor.toXML());
result.append("</root>");
out.println(result.toString());
%>
