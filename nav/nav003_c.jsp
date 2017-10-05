<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.bean.ctrl.*"%>
<%@ page import="com.fs.bean.misc.*"%>
<%@ page import="com.fs.bean.*" %>
<%
//#scrape & keeping say something anyway
//#(50000) programmer code begin;
//#(50000) programmer code end;
%>
<% com.fs.bean.util.PageUtility.initialPage(request,response); %>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:setProperty name="fsAccessor" property="*"/>
<% session.removeAttribute("fsGlobal"); %>
<jsp:useBean id="fsGlobal" scope="session" class="com.fs.bean.util.GlobalBean"/>
<jsp:setProperty name="fsGlobal" property="*"/>
<jsp:useBean id="fsNavigateBean" scope="page" class="com.fs.bean.NavigateBean"/>
<jsp:setProperty name="fsNavigateBean" property="*"/>
<jsp:useBean id="fsExc003Bean" scope="session" class="com.fs.bean.ExecuteBean"/>
<%
//#import and uses wherever you will go
//#(10000) programmer code begin;
StringBuffer results = new StringBuffer("{}");
//#(10000) programmer code end;
//#if the condition come to me
//#(15000) programmer code begin;
//#(15000) programmer code end;
boolean fsIsJSON = fsGlobal.isJson();
boolean fsIsXML = fsGlobal.isXml();
boolean fsIsAjax = fsGlobal.isAjax();
fsGlobal.setFsProg("nav003");
fsGlobal.isAllowable(fsAccessor);
fsGlobal.setFsSection(null);
fsGlobal.obtain(session);
try {
	//#initialize & assigned variables sitting down here
	//#(20000) programmer code begin;
	fsGlobal.setFsAction(GlobalBean.COLLECT_MODE);
	//#(20000) programmer code end;
	//#cut like a knife
	//#(22500) programmer code begin;
	Trace.debug(fsAccessor,fsNavigateBean);
	String fs_currentUserid = fsAccessor.getFsUser();
	String fs_currentUsertype = fsAccessor.getFsVar("fsUsertype");
	int pageNo = fsNavigateBean.getPageNo();
	int resultsPerpage = fsNavigateBean.getResultsPerpage();
	if(fsNavigateBean.isFetching()) {
		String so = fsNavigateBean.getSearchoption();
		if(so==null || so.trim().length()<=0) so = "P";
		String fs_usertype = PageUtility.getParameter(request,"usertype");
		String fs_userid = PageUtility.getParameter(request,"userid");
		String fs_tname = PageUtility.getParameter(request,"usertname");
		String fs_tsurname = PageUtility.getParameter(request,"usertsurname");
		String fs_ename = PageUtility.getParameter(request,"userename");
		String fs_esurname = PageUtility.getParameter(request,"useresurname");
		String fs_email = PageUtility.getParameter(request,"email");
		String fs_mobile = PageUtility.getParameter(request,"mobile");
		String filter = "where";
		KnSQL knsql = fsExc003Bean.getKnSQL();
		knsql.clear();
		knsql.append("select tuser.userid,tuser.usertname,tuser.usertsurname,tuser.userename,tuser.useresurname ");
		knsql.append("from tuser ");
		if(fs_usertype!=null && fs_usertype.length()>0) {
			knsql.append(filter+" tuser.usertype = ?usertype ");
			knsql.setParameter("usertype",fs_usertype);
			filter = "and";
		}
		if(fs_userid!=null && fs_userid.length()>0) {
			if("W".equals(so)) {
				knsql.append(filter+" tuser.userid like ?userid ");
				knsql.setParameter("userid","%"+fs_userid+"%");			
			} else if("H".equals(so)) {
				knsql.append(filter+" tuser.userid = ?userid ");
				knsql.setParameter("userid",fs_userid);
			} else if("S".equals(so)) {
				knsql.append(filter+" tuser.userid like ?userid ");
				knsql.setParameter("userid","%"+fs_userid);
			} else {
				knsql.append(filter+" tuser.userid like ?userid ");
				knsql.setParameter("userid",fs_userid+"%");
			}
			filter = "and";
		}
		if(fs_tname!=null && fs_tname.length()>0) {
			knsql.append(filter+" tuser.usertname like ?usertname ");
			knsql.setParameter("usertname",fs_tname+"%");
			filter = "and";
		}
		if(fs_tsurname!=null && fs_tsurname.length()>0) {
			knsql.append(filter+" tuser.usertsurname like ?usertsurname ");
			knsql.setParameter("usertsurname",fs_tsurname+"%");
			filter = "and";
		}
		if(fs_ename!=null && fs_ename.length()>0) {
			knsql.append(filter+" tuser.userename like ?userename ");
			knsql.setParameter("userename",fs_ename+"%");
			filter = "and";
		}
		if(fs_esurname!=null && fs_esurname.length()>0) {
			knsql.append(filter+" tuser.useresurname like ?useresurname ");
			knsql.setParameter("useresurname",fs_esurname+"%");
			filter = "and";
		}
		if(fs_email!=null && fs_email.length()>0) {
			knsql.append(filter+" tuser.email like ?email ");
			knsql.setParameter("email",fs_email+"%");
			filter = "and";
		}
		if(fs_mobile!=null && fs_mobile.length()>0) {
			knsql.append(filter+" tuser.mobile like ?mobile ");
			knsql.setParameter("mobile",fs_mobile+"%");
			filter = "and";
		}
		knsql.append(" order by userid ");
	//#(22500) programmer code end;
	fsGlobal.obtain(fsAccessor);
	BeanTransport fsTransport = TheTransportor.transport(fsGlobal,fsExc003Bean);
	//#do you remember to obtain the transporter result
	//#(25000) programmer code begin;
	//#(25000) programmer code end;
	if(!fsGlobal.isException()) {
		TheTransportor.handle(fsGlobal,fsExc003Bean);
	}
	if(fsTransport!=null) fsGlobal.setSuccess(fsTransport.isSuccess());
	//#mode handle & other values never be the same again
	//#(30000) programmer code begin;
	} else {
		if(fsNavigateBean.getSortname()!=null && fsNavigateBean.getSortname().trim().length()>0) {
			fsExc003Bean.sort(fsNavigateBean.getSortname(),fsNavigateBean.isInverse());
		}
	}
	String fs_lang = fsGlobal.getFsLanguage();
	if(fs_lang==null) fs_lang = "EN";
	results = new StringBuffer("{");
	if(fsExc003Bean.size()>0) {
		results.append("\"language\":\""+fs_lang+"\",");
		results.append(fsExc003Bean.toJSONArrayWithLimit(pageNo,resultsPerpage,"rows","cell",false,new String[]{"userid","usertname","usertsurname","userename","useresurname"}));
	}
	results.append("}");
	//#(30000) programmer code end;
} catch(Exception ex) {
	Trace.error(fsAccessor,ex);
	fsGlobal.setThrowable(ex);
	int fs_errorcode = fsGlobal.parseErrorcode();
	String fs_errormessage = fsGlobal.getFsMessage();
	//#what error found when it over
	//#(32500) programmer code begin;
	//#(32500) programmer code end;
	if(fsIsAjax) {
		response.setStatus(fs_errorcode,fs_errormessage);
		return;
	}
}
//#before handle forward page
//#(35000) programmer code begin;
//#(35000) programmer code end;
%>
<%=results.toString()%>