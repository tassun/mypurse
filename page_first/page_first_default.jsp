<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsScreen" scope="request" class="com.fs.dev.library.ScreenUtility"/>
<jsp:useBean id="fsLabel" scope="request" class="com.fs.bean.util.LabelConfig"/>
<c:if test="${fsScreen.config('index',pageContext.request, pageContext.response,false)}"></c:if>
<link rel="stylesheet" type="text/css" href="page_first/page_first.css?<%=System.currentTimeMillis()%>" />
<script type="text/javascript">
var page_first = $.extend({},base,{
	init: function(setting) { 
	}
});
launchApplication(page_first);
</script>
<div id="page_first" class="pt-page">
	<div id="page_first_sub" class="panel-body pt-page-body" align="center">
		<div class="favor-navbox-tiles" style="width: 500px; height: 500px; ">
			<a href="javascript:void(0);" class="tile fa-box-title fav-app" pid="page_daily" onclick="open_page('page_daily')"><div class="icon"><img class="fa fa-app-image" src="img/apps/page_daily.png" /></div><span class="title" id="pagedaily_label">${fsLabel.getText('pagedaily_label','My Daily')}</span></a>
			<a href="javascript:void(0);" class="tile fa-box-title fav-app" pid="page_item" onclick="open_page('page_item')"><div class="icon"><img class="fa fa-app-image" src="img/apps/page_item.png" /></div><span class="title" id="pageitem_label">${fsLabel.getText('pageitem_label','My Journal')}</span></a>
			<a href="javascript:void(0);" class="tile fa-box-title fav-app" pid="page_report" onclick="open_page('page_report')"><div class="icon"><img class="fa fa-app-image" src="img/apps/page_report.png" /></div><span class="title" id="pagereport_label">${fsLabel.getText('pagereport_label','My Report')}</span></a>
			<c:if test="${fsScreen.isUserType(fsAccessor,'A')}">
			<a href="javascript:void(0);" class="tile fa-box-title fav-app" pid="page_user" onclick="open_page('page_user')"><div class="icon"><img class="fa fa-app-image" src="img/apps/page_user.png" /></div><span class="title" id="pageuser_label">${fsLabel.getText('pageuser_label','My User')}</span></a>
			<a href="javascript:void(0);" class="tile fa-box-title fav-app" pid="page_track" onclick="open_page('page_track')"><div class="icon"><img class="fa fa-app-image" src="img/apps/page_track.png" /></div><span class="title" id="pagetrack_label">${fsLabel.getText('pagetrack_label','My Trace')}</span></a>
			<a href="javascript:void(0);" class="tile fa-box-title fav-app" pid="page_log" onclick="open_page('page_log')"><div class="icon"><img class="fa fa-app-image" src="img/apps/page_log.png" /></div><span class="title" id="pagelog_label">${fsLabel.getText('pagelog_label','My Log')}</span></a>				
			</c:if>
		</div>
	</div>
</div>
