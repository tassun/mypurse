<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/taglibs-formcontrol.tld" prefix="fs"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
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
			<c:if test="${fsFavorite.size() > 0}">
				<c:forEach var="fsElement" items="${fsFavorite.elements()}" varStatus="record">	
					<a href="javascript:void(0);" class="tile fa-box-title fav-app" pid="${fsElement.getString('programid')}" onclick="open_page('${fsElement.getString('programid')}')"><div class="icon"><img class="fa fa-app-image" src="img/apps/${fsElement.getString('iconfile')}" /></div><span class="title">${fsElement.getString('progname')}</span></a>		
				</c:forEach>
			</c:if>
		</div>
	</div>
</div>
