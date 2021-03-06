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
<jsp:useBean id="fsTRXPBean" scope="request" class="com.fs.bean.TRXPBean"/>
<jsp:setProperty name="fsTRXPBean" property="*"/>
<c:if test="${fsScreen.init('page_item',pageContext.request, pageContext.response,true)}"></c:if>
<%
boolean fsIsAjax = fsGlobal.isAjax();
boolean fsIsJSON = fsGlobal.isJson();
boolean fsIsJSONData = fsGlobal.isJsondata();
boolean fsIsXML = fsGlobal.isXml();
boolean fsIsXMLData = fsGlobal.isXmldata();
fsGlobal.setFsProg("page_item");
fsGlobal.setFsSection(null);
fsGlobal.obtain(session);
fsGlobal.obtain(fsAccessor);
String fs_forwarder = "/page_item/page_item_de.jsp";
int fs_action = fsGlobal.parseAction();
try { 
	fsTRXPBean.obtain(session,request);
	if(fsTRXPBean.getUserid()==null || fsTRXPBean.getUserid().trim().length()<=0) {
		fsTRXPBean.setUserid(fsAccessor.getFsUser());
	}
	if(GlobalBean.insertMode(fs_action)) {
		if(fsTRXPBean.getCdname()==null || fsTRXPBean.getCdname().trim().length()<=0) {
			throw new BeanException("Title or name is not specified",-8701);
		}
	}
	if(GlobalBean.insertMode(fs_action)) {
		fsTRXPBean.setCdcode("I"+BeanUtility.createID());
		if(!("A".equals(fsAccessor.getFsVar("fsUsertype")))) {
			fsTRXPBean.setOwnflag("1");
		}
	}
	fsTRXPBean.transport(fsGlobal);
	fsTRXPBean.getReformAdapter().setRemoveDecimalSeparator(true);
	if(GlobalBean.insertMode(fs_action)) {
		com.fs.dev.purse.PurseUtility smutil = new com.fs.dev.purse.PurseUtility("");
		java.util.Map fs_items = new java.util.LinkedHashMap();
		fs_items.put("","");
		com.fs.bean.EntityBean fsEntity = smutil.getItemList(fsAccessor,"","page_item");
		java.util.Map fs_itemmap = smutil.createItemList(fsEntity);
		if(fs_itemmap!=null) {
			fs_items.putAll(fs_itemmap);
		}	
		session.setAttribute("ITEMLIST_CATEGORY",fs_items);
	}
}catch(Exception ex) { 
	Trace.error(fsAccessor,ex);
	fsGlobal.setThrowable(ex);
	if(fsIsAjax) {
		fsGlobal.createResponseStatus(out, response);
		return;
	}
}
fsTRXPBean.obtain(session,request);
if(fsIsJSONData) {
	out.print(fsTRXPBean.toJSONData("rows"));
	return;
}
if(fsIsJSON) {
	out.print(fsTRXPBean.toJSON());
	return;
}
if(fsIsXMLData) {
	out.print("<?xml version=\"1.0\" encoding=\""+GlobalVariable.getEncoding()+"\"?>");
	out.print(fsTRXPBean.toXMLDatas());
	return;
}
if(fsIsXML) {
	out.print("<?xml version=\"1.0\" encoding=\""+GlobalVariable.getEncoding()+"\"?>");
	out.print(fsTRXPBean.toXML());
	return;
}
RequestDispatcher rd = application.getRequestDispatcher(fs_forwarder);
rd.forward(request, response);
%>
