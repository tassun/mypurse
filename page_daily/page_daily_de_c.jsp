<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.fs.bean.*" %>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.bean.misc.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/taglibs-formcontrol.tld" prefix="fs"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsScreen" scope="request" class="com.fs.dev.library.ScreenUtility"/>
<jsp:useBean id="fsLabel" scope="request" class="com.fs.bean.util.LabelConfig"/>
<jsp:useBean id="fsPager" scope="request" class="com.fs.bean.util.Pager"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<jsp:setProperty name="fsGlobal" property="*"/>
<jsp:useBean id="fsTRXDBean" scope="request" class="com.fs.bean.TRXDBean"/>
<jsp:setProperty name="fsTRXDBean" property="*"/>
<c:if test="${fsScreen.init('page_daily',pageContext.request, pageContext.response,true)}"></c:if>
<%
System.out.println(fsAccessor);
boolean fsIsAjax = fsGlobal.isAjax();
boolean fsIsJSON = fsGlobal.isJson();
boolean fsIsJSONData = fsGlobal.isJsondata();
boolean fsIsXML = fsGlobal.isXml();
boolean fsIsXMLData = fsGlobal.isXmldata();
fsGlobal.setFsProg("page_daily");
fsGlobal.setFsSection(null);
fsGlobal.obtain(session);
fsGlobal.obtain(fsAccessor);
String fs_forwarder = "/page_daily/page_daily_de.jsp";
int fs_action = fsGlobal.parseAction();
try { 
	fsTRXDBean.obtain(session,request);
	if(fsTRXDBean.getUserid()==null || fsTRXDBean.getUserid().trim().length()<=0) {
		fsTRXDBean.setUserid(fsAccessor.getFsUser());
	}
	if(fsTRXDBean.getCdrefdate()==null || fsTRXDBean.getCdrefdate().trim().length()<=0) {
		throw new BeanException("Date is not specified",-8700);
	}
	fsTRXDBean.transport(fsGlobal);
	fsTRXDBean.getReformAdapter().setRemoveDecimalSeparator(true);
}catch(Exception ex) { 
	Trace.error(fsAccessor,ex);
	fsGlobal.setThrowable(ex);
	if(fsIsAjax) {
		fsGlobal.createResponseStatus(out, response);
		return;
	}
}
fsTRXDBean.obtain(session,request);
if(fsIsJSONData) {
	out.print(fsTRXDBean.toJSONData("rows"));
	return;
}
if(fsIsJSON) {
	out.print(fsTRXDBean.toJSON());
	return;
}
if(fsIsXMLData) {
	out.print("<?xml version=\"1.0\" encoding=\""+GlobalVariable.getEncoding()+"\"?>");
	out.print(fsTRXDBean.toXMLDatas());
	return;
}
if(fsIsXML) {
	out.print("<?xml version=\"1.0\" encoding=\""+GlobalVariable.getEncoding()+"\"?>");
	out.print(fsTRXDBean.toXML());
	return;
}
com.fs.dev.purse.PurseUtility smutil = new com.fs.dev.purse.PurseUtility("");
java.util.Map fs_items = (java.util.Map)session.getAttribute("ITEMLIST_CATEGORY");
if(fs_items==null) {
	fs_items = new java.util.LinkedHashMap();
	fs_items.put("","");
	com.fs.bean.EntityBean fsEntity = smutil.getItemList(fsAccessor,"","page_daily");
	java.util.Map fs_itemmap = smutil.createItemList(fsEntity);
	if(fs_itemmap!=null) {
		fs_items.putAll(fs_itemmap);
	}	
	session.setAttribute("ITEMLIST_CATEGORY",fs_items);
}
RequestDispatcher rd = application.getRequestDispatcher(fs_forwarder);
rd.forward(request, response);
%>
