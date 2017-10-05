<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.fs.bean.*" %>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.bean.misc.*"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<jsp:setProperty name="fsGlobal" property="*"/>
<%
StringBuffer results = new StringBuffer("{}");
boolean fsIsAjax = fsGlobal.isAjax();
boolean fsIsJSON = fsGlobal.isJson();
boolean fsIsJSONData = fsGlobal.isJsondata();
boolean fsIsXML = fsGlobal.isXml();
boolean fsIsXMLData = fsGlobal.isXmldata();
fsGlobal.setFsProg("favor_prog");
fsGlobal.setFsSection(null);
fsGlobal.obtain(session);
fsGlobal.obtain(fsAccessor);
try { 
	String fs_userid = PageUtility.getParameter(request,"userid");
	if(fs_userid!=null && fs_userid.trim().length()>0) {
		com.fs.dev.purse.PurseUtility smutil = new com.fs.dev.purse.PurseUtility("PURSE","favor_prog");
		java.util.Map fs_prgmap = smutil.createProgramByUser(fs_userid,fsAccessor,smutil.getSection(),smutil.getProgid());
		java.util.Map jsmap = new java.util.HashMap();
		if(fs_prgmap!=null) jsmap.put("progcategory",fs_prgmap);
		if(fsIsXML) {
			results = new StringBuffer("<?xml version=\"1.0\" encoding=\""+GlobalVariable.getEncoding()+"\"?>\n");
			results.append(XMLUtility.parseXML(jsmap,"root"));
		} else {
			results = new StringBuffer(JSONUtility.parseJSON(jsmap,null,true));
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
%>
<%=results.toString()%>