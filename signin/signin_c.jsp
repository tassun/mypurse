<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.bean.ctrl.*"%>
<%@ page import="com.fs.bean.misc.*"%>
<%@ page import="com.fs.bean.*" %>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<jsp:useBean id="fsExecuteBean" scope="page" class="com.fs.bean.ExecuteBean"/>
<jsp:useBean id="fsLogonBean" scope="request" class="com.fs.dev.strok.SignonBean"/>
<jsp:setProperty name="fsLogonBean" property="*"/>
<%
String fs_deviceid = request.getParameter("deviceid");
if(fs_deviceid==null) {
	java.util.Map<String,String> map = (java.util.Map<String,String>)request.getAttribute("formParameter");
	if(map!=null) fs_deviceid = map.get("deviceid");
}
Trace.info("signin "+request.getContextPath()+" : "+request.getQueryString());
fsGlobal.setFsVar("fsAddress",request.getRemoteAddr());
StringBuffer result = new StringBuffer();
if(fs_deviceid==null || fs_deviceid.trim().length()<=0) {
	String fs_msg = "Device id not defined";
	fsGlobal.setFsMessage(fs_msg);
	out.print("{ \"type\" : \"error\", \"status\" : \"7001\", \"text\" : \""+fs_msg+"\"}");
	return;
}
fsGlobal.setFsProg("signin");
fsGlobal.setFsVar("fsUser",fs_deviceid);
String signon = (String)GlobalVariable.getVariable("VALIDATE_SIGNON");
if((signon!=null) && signon.equalsIgnoreCase("true")) {
	try {
		fsGlobal.setFsAction(GlobalBean.RETRIEVE_MODE);
		KnSQL sql = fsExecuteBean.getKnSQL();
		sql.clear();
		sql.append("select * from  tdevice ");
		sql.append("where deviceid = ?deviceid ");
		sql.setParameter("deviceid",fs_deviceid);	
		fsExecuteBean.obtain(session,request);
		fsExecuteBean.transport(fsGlobal);
		String fs_msg = "Device is incorrect";
		boolean found = false;
		if(fsExecuteBean.effectedTransactions()>0) {
			found = true;
		}
		if(!found) {
			fsGlobal.setFsMessage(fs_msg);
			Tracker.track(fsGlobal);
			out.print("{ \"type\" : \"error\", \"status\":\"7002\", \"text\" : \""+fs_msg+"\"}");
			return;
		}
	} catch(Exception ex) {
		fsGlobal.setThrowable(ex);
		String msg = ex.getMessage()==null?ex.getClass().getName():ex.getMessage();
		out.print("{ \"type\" : \"error\", \"status\":\"7003\", \"text\" : \""+JSONUtility.parseJSONString(msg)+"\"}");
		return;
	}
}
if((fsLogonBean.getLogondate()==null) || fsLogonBean.getLogondate().equals("")) {
	BeanFormat formater = new BeanFormat();
	java.util.Date date = new java.util.Date();
	fsLogonBean.setLogondate(formater.formatDate(date,"dd/MM/yyyy"));
}
fsLogonBean.setUser(fs_deviceid);
fsLogonBean.assign(fsAccessor);
fsAccessor.setFsKey(session.getId());
fsAccessor.setFsVar("fsUserName",fsExecuteBean.getString("devicename"));
fsAccessor.setFsVar("fsTokenKey",session.getId());
Trace.debug(fsLogonBean);
Trace.debug(fsAccessor);
fsGlobal.retain(request);
Tracker.trace(fsGlobal);
out.println(fsAccessor.toJSON());
%>
