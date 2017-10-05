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
<jsp:useBean id="fsExc002Bean" scope="session" class="com.fs.bean.ExecuteBean"/>
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
fsGlobal.setFsProg("nav002");
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
	int pageNo = fsNavigateBean.getPageNo();
	int resultsPerpage = fsNavigateBean.getResultsPerpage();
	if(fsNavigateBean.isFetching()) {
		String filter = "where";
		String so = fsNavigateBean.getSearchoption();
		if(so==null || so.trim().length()<=0) so = "P";
		String fs_customerid = PageUtility.getParameter(request,"customerid");
		String fs_cardid = PageUtility.getParameter(request,"cardid");
		String fs_lname = PageUtility.getParameter(request,"lname");
		String fs_lsurname = PageUtility.getParameter(request,"lsurname");
		String fs_ename = PageUtility.getParameter(request,"ename");
		String fs_esurname = PageUtility.getParameter(request,"esurname");
		KnSQL knsql = fsExc002Bean.getKnSQL();
		knsql.clear();
		knsql.append("select  b.customerid,b.lname,b.lsurname,b.ename,b.esurname,b.cardid ");
		knsql.append("from tcustomer b");
		//M = Match Case , H = Whole Word , W = Wild Card, P = Match Prefix, S = Match Suffix
		if(fs_customerid!=null && fs_customerid.length()>0) {
			if("W".equals(so)) {
				knsql.append(filter+" b.customerid like ?customerid ");
				knsql.setParameter("customerid","%"+fs_customerid+"%");
			} else if("H".equals(so)) {
				knsql.append(filter+" b.customerid = ?customerid ");
				knsql.setParameter("customerid",fs_customerid);
			} else if("P".equals(so)) {
				knsql.append(filter+" b.customerid like ?customerid ");
				knsql.setParameter("customerid",fs_customerid+"%");
			} else if("S".equals(so)) {
				knsql.append(filter+" b.customerid like ?customerid" );
				knsql.setParameter("customerid","%"+fs_customerid);
			}
			filter = "and";
		}
		if(fs_cardid!=null && fs_cardid.length()>0) {
			if("W".equals(so)) {
				knsql.append(filter+" b.cardid like ?cardid ");
				knsql.setParameter("cardid","%"+fs_cardid+"%");
			} else if("H".equals(so)) {
				knsql.append(filter+" b.cardid = ?cardid ");
				knsql.setParameter("cardid",fs_cardid);
			} else if("P".equals(so)) {
				knsql.append(filter+" b.cardid like ?cardid ");
				knsql.setParameter("cardid",fs_cardid+"%");
			} else if("S".equals(so)) {
				knsql.append(filter+" b.cardid like ?cardid ");
				knsql.setParameter("cardid","%"+fs_cardid);
			}
			filter = "and";
		}
		if(fs_lname!=null && fs_lname.length()>0) {
			if("W".equals(so)) {
				knsql.append(filter+" b.lname like ?lname ");
				knsql.setParameter("lname","%"+fs_lname+"%");
			} else if("H".equals(so)) {
				knsql.append(filter+" b.lname = ?lname ");
				knsql.setParameter("lname",fs_lname);
			} else if("P".equals(so)) {
				knsql.append(filter+" b.lname like ?lname ");
				knsql.setParameter("lname",fs_lname+"%");
			} else if("S".equals(so)) {
				knsql.append(filter+" b.lname like ?lname ");
				knsql.setParameter("lname","%"+fs_lname);
			}
			filter = "and";
		}
		if(fs_lsurname!=null && fs_lsurname.length()>0) {
			if("W".equals(so)) {
				knsql.append(filter+" b.lsurname like ?lsurname ");
				knsql.setParameter("lsurname","%"+fs_lsurname+"%");
			} else if("H".equals(so)) {
				knsql.append(filter+" b.lsurname = ?lsurname ");
				knsql.setParameter("lsurname",fs_lsurname);
			} else if("P".equals(so)) {
				knsql.append(filter+" b.lsurname like ?lsurname ");
				knsql.setParameter("lsurname",fs_lsurname+"%");
			} else if("S".equals(so)) {
				knsql.append(filter+" b.lsurname like ?lsurname ");
				knsql.setParameter("lsurname","%"+fs_lsurname);
			}
			filter = "and";
		}
		if(fs_ename!=null && fs_ename.length()>0) {
			if("W".equals(so)) {
				knsql.append(filter+" b.ename like ?ename ");
				knsql.setParameter("ename",fs_ename+"%");
			} else if("H".equals(so)) {
				knsql.append(filter+" b.ename = ?ename ");
				knsql.setParameter("ename",fs_ename);
			} else if("P".equals(so)) {
				knsql.append(filter+" b.ename like ?ename ");
				knsql.setParameter("ename",fs_ename+"%");
			} else if("S".equals(so)) {
				knsql.append(filter+" b.ename like ?ename ");
				knsql.setParameter("ename","%"+fs_ename);
			}
			filter = "and";
		}
		if(fs_esurname!=null && fs_esurname.length()>0) {
			if("W".equals(so)) {
				knsql.append(filter+" b.esurname like ?esurname ");
				knsql.setParameter("esurname","%"+fs_esurname+"%");
			} else if("H".equals(so)) {
				knsql.append(filter+" b.esurname = ?esurname ");
				knsql.setParameter("esurname",fs_esurname);
			} else if("P".equals(so)) {
				knsql.append(filter+" b.esurname like ?esurname ");
				knsql.setParameter("esurname",fs_esurname+"%");
			} else if("S".equals(so)) {
				knsql.append(filter+" b.esurname like ?esurname ");
				knsql.setParameter("esurname","%"+fs_esurname);
			}
			filter = "and";
		}
		knsql.append(" order by b.customerid ");
	//#(22500) programmer code end;
	fsGlobal.obtain(fsAccessor);
	BeanTransport fsTransport = TheTransportor.transport(fsGlobal,fsExc002Bean);
	//#do you remember to obtain the transporter result
	//#(25000) programmer code begin;
	//#(25000) programmer code end;
	if(!fsGlobal.isException()) {
		TheTransportor.handle(fsGlobal,fsExc002Bean);
	}
	if(fsTransport!=null) fsGlobal.setSuccess(fsTransport.isSuccess());
	//#mode handle & other values never be the same again
	//#(30000) programmer code begin;
	} else {
		if(fsNavigateBean.getSortname()!=null && fsNavigateBean.getSortname().trim().length()>0) {
			fsExc002Bean.sort(fsNavigateBean.getSortname(),fsNavigateBean.isInverse());
		}
	}
	String fs_lang = fsGlobal.getFsLanguage();
	if(fs_lang==null) fs_lang = "EN";
	results = new StringBuffer("{");
	if(fsExc002Bean.size()>0) {
		results.append("\"language\":\""+fs_lang+"\",");
		results.append(fsExc002Bean.toJSONArrayWithLimit(pageNo,resultsPerpage,"rows","cell",false,new String[]{"customerid","lname","lsurname","ename","esurname","cardid"}));
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