<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<%
com.fs.dev.purse.PurseUtility smutil = new com.fs.dev.purse.PurseUtility("");
java.util.Map fs_items = new java.util.LinkedHashMap();
fs_items.put("","");
com.fs.bean.EntityBean fsEntity = smutil.getItemList(fsAccessor,"","page_daily");
java.util.Map fs_itemmap = smutil.createItemList(fsEntity);
if(fs_itemmap!=null) {
	fs_items.putAll(fs_itemmap);
	//fs_items.put("+1+","Other");
}	
session.setAttribute("ITEMLIST_CATEGORY",fs_items);
%>
<script>var fs_itemlist = <%=fsEntity.toJSONData("rows")%>;</script>