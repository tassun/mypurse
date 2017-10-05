<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<ul id="menuitemlist" class="nav sidebar-nav" role="menu">
<c:forEach var="fsGroup" items="${fsSiderMap}" varStatus="record">
	<c:set var="fsGroupEntity" value="${fsGroup.value}"/>
	<c:set var="fsListEntity" value="${fsSiderList[fsGroup.key]}"/>
	<li class="dropdown">
		<a class="fa fa-tasks dropdown-toggle" data-toggle="collapse" href="javascript:void(0);#submenu_${record.count}"><span>&nbsp;${fsGroupEntity.getString('description')}</span></a>
		<c:if test="${fsListEntity.size() > 0}">
			<ul id="submenu_${record.count}" class="panel-collapse collapse" role="menu">
			<c:forEach var="fsElement" items="${fsListEntity}">
				<li><a href="javascript:void(0);" class="fa fa-desktop" onclick="open_page('${fsElement.getString('programid')}');">&nbsp;${fsElement.getString('progname')}</a></li>
			</c:forEach>
			</ul>
		</c:if>
	</li>
</c:forEach>
</ul>