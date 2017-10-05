<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.fs.bean.*" %>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.bean.misc.*"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<jsp:setProperty name="fsGlobal" property="*"/>
<jsp:useBean id="fsFavor" scope="request" class="com.fs.bean.ExecuteBean"/>
<%
boolean fsIsAjax = fsGlobal.isAjax();
boolean fsIsJSON = fsGlobal.isJson();
boolean fsIsJSONData = fsGlobal.isJsondata();
boolean fsIsXML = fsGlobal.isXml();
boolean fsIsXMLData = fsGlobal.isXmldata();
fsGlobal.setFsProg("favor_menu");
fsGlobal.setFsSection(null);
fsGlobal.obtain(session);
fsGlobal.obtain(fsAccessor);
try { 
	String fs_userid = PageUtility.getParameter(request,"userid");
	String fs_progid = PageUtility.getParameter(request,"progid");
	String fs_seqno = PageUtility.getParameter(request,"seqno");
	if((fs_userid!=null && fs_userid.trim().length()>0) && (fs_progid!=null && fs_progid.trim().length()>0)){
		KnSQL knsql = fsFavor.getKnSQL();
		if(fsGlobal.isDeleteAction()) {
			knsql.append("delete from tfavor ");
			knsql.append("where userid = ?userid and programid = ?programid and seqno=?seqno ");
			knsql.setParameter("userid",fs_userid);
			knsql.setParameter("programid",fs_progid);
			knsql.setParameter("seqno",fs_seqno);
			fsGlobal.setFsAction(GlobalBean.DELETE_MODE);
			fsFavor.transport(fsGlobal);
		} else if(fsGlobal.isCreateAction()) {
			knsql.append("insert into tfavor (userid,programid,seqno) values(?userid,?programid,?seqno) ");
			knsql.setParameter("userid",fs_userid);
			knsql.setParameter("programid",fs_progid);
			knsql.setParameter("seqno",fs_seqno);
			fsGlobal.setFsAction(GlobalBean.INSERT_MODE);
			fsFavor.transport(fsGlobal);
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
fsFavor.obtain(session,request);
if(fsIsJSONData) {
	out.print(fsFavor.toJSONData("rows"));
	return;
}
if(fsIsJSON) {
	out.print(fsFavor.toJSON());
	return;
}
if(fsIsXMLData) {
	out.print("<?xml version=\"1.0\" encoding=\""+GlobalVariable.getEncoding()+"\"?>");
	out.print(fsFavor.toXMLDatas());
	return;
}
if(fsIsXML) {
	out.print("<?xml version=\"1.0\" encoding=\""+GlobalVariable.getEncoding()+"\"?>");
	out.print(fsFavor.toXML());
	return;
}
%>
