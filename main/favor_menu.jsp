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
String fs_forwarder = "/main/favor_menu_view.jsp";
try { 
	String fs_userid = PageUtility.getParameter(request,"userid");
	if(fs_userid!=null && fs_userid.trim().length()>0) {
		KnSQL knsql = fsFavor.getKnSQL();
		knsql.append("select tprog.programid,tprog.progname,tprog.iconfile,tfavor.seqno ");
		knsql.append("from tprog,tfavor ");
		knsql.append("where tfavor.userid = ?userid and tfavor.programid = tprog.programid ");
		knsql.setParameter("userid",fs_userid);
		fsGlobal.setFsAction(GlobalBean.COLLECT_MODE);
		fsFavor.transport(fsGlobal);
		if(fsFavor.effectedTransactions()>0) {
			fs_forwarder = "/main/favor_menu_view.jsp";
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
java.util.Map<Integer,com.fs.bean.EntityBean> fs_favormap = new java.util.TreeMap<Integer,com.fs.bean.EntityBean>();
request.setAttribute("fsFavorMap",fs_favormap);
java.util.Enumeration en = fsFavor.elements();
if(en!=null) {
	for(;en.hasMoreElements();) {
		com.fs.bean.EntityBean fsElement = (com.fs.bean.EntityBean)en.nextElement();
		String seqno = fsElement.getString("seqno");
		fs_favormap.put(new Integer(seqno),fsElement);
	}
}
RequestDispatcher rd = application.getRequestDispatcher(fs_forwarder);
rd.forward(request, response);
%>
