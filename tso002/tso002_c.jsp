<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.bean.ctrl.*"%>
<%@ page import="com.fs.bean.misc.*"%>
<%@ page import="com.fs.bean.*" %>
<%!
//#it's strong enough to break into another control here
//#(60000) programmer code begin;
//#(60000) programmer code end;
%>
<%
//#scrape & keeping say something anyway
//#(50000) programmer code begin;
//#(50000) programmer code end;
%>
<% com.fs.bean.util.PageUtility.initialPage(request,response); %>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:setProperty name="fsAccessor" property="*"/>
<% //fsAccessor.validate(); %>
<% session.removeAttribute("fsGlobal"); %>
<jsp:useBean id="fsGlobal" scope="session" class="com.fs.bean.util.GlobalBean"/>
<jsp:setProperty name="fsGlobal" property="*"/>
<%
//#import and uses wherever you will go
//#(10000) programmer code begin;
System.out.println("======== parameters in tso002_c.jsp =========");
java.util.Enumeration params = request.getParameterNames();
for(;params.hasMoreElements();) {
	String paramName = (String)params.nextElement();
	System.out.println(paramName + " = " + request.getParameter(paramName));
}
System.out.println("========================");
//#(10000) programmer code end;
//#if the condition come to me
//#(15000) programmer code begin;
//#(15000) programmer code end;
boolean fsIsJSON = fsGlobal.isJson();
boolean fsIsXML = fsGlobal.isXml();
boolean fsIsAjax = fsGlobal.isAjax();
boolean fsIsXMLData = fsGlobal.isXmldata();
boolean fsIsJSONData = fsGlobal.isJsondata();
fsGlobal.setFsProg("tso002");
fsGlobal.isAllowable(fsAccessor);
fsGlobal.setFsSection(null);
fsGlobal.obtain(session);
String fs_forwarder = "/TSO002/tso002_cd.jsp";
try {
	//#initialize & assigned variables sitting down here
	//#(20000) programmer code begin;
	Trace.debug("++++++++++++++++ tso002_c.jsp ("+session.getId()+")++++++++++++++++++");
	//#(20000) programmer code end;
	//#cut like a knife
	//#(22500) programmer code begin;

	//#(30000) programmer code end;
} catch(Throwable ex) {
	Trace.error(fsAccessor,ex);
	fsGlobal.setThrowable(ex);
	int fs_errorcode = fsGlobal.parseErrorcode();
	String fs_errormessage = fsGlobal.getFsMessage();
	//#what error found when it over
	//#(32500) programmer code begin;
	//#(32500) programmer code end;
	if(fsIsAjax) {
		fsGlobal.createResponseStatus(out, response, fs_errorcode, fs_errormessage);
		return;
	}
}
//#before handle forward page
//#(35000) programmer code begin;
//#(35000) programmer code end;
//#born to try handle forward page
//#(40000) programmer code begin;
//#(40000) programmer code end;
%>
{"tso002":"hello new world"}