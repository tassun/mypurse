<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:forEach var="idx" begin="1" end="6" varStatus="record">
	<c:set var="fsElement" value="${fsFavorMap[idx]}"/>
	<c:choose>
		<c:when test="${not empty fsElement}">
			<a href="javascript:void(0)" class="tile fa-box-title fav-app" seqno="${record.count}" pid="${fsElement.getString('programid')}"><div class="icon"><img class="fa fa-app-image" src="img/apps/${fsElement.getString('iconfile')}" /></div><span class="title">${fsElement.getString('progname')}</span></a>
		</c:when>
		<c:otherwise>
			<a href="javascript:void(0)" class="tile fa-box-title fav-blank" title="New Favorite" seqno="${record.count}"><div class="icon"><img class="fa fa-app-image" src="img/apps/fs_icon.png" /></div><span class="title">Add New</span></a>
		</c:otherwise>
	</c:choose>
</c:forEach>
