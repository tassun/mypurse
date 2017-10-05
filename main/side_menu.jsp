<%@ page info="SCCS id: $Id$"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsScreen" scope="request" class="com.fs.dev.library.ScreenUtility"/>
<ul id="menuitemlist" class="nav sidebar-nav" role="menu">
		<c:if test="${fsScreen.isUserType(fsAccessor,'A')}">
		<li class="dropdown"><a class="fa fa-globe dropdown-toggle" data-toggle="expand" href="#submenu_1"><span> My Task</span></a>
				<ul id="submenu_1" class="panel-expand expand" role="menu">
					<li><a href="javascript:void(0);" class="fa fa-desktop" onclick="load_page('page_user');"> My Users</a></li>
					<li><a href="javascript:void(0);" class="fa fa-desktop" onclick="load_page('page_track');"> My Trace</a></li>
					<li><a href="javascript:void(0);" class="fa fa-desktop" onclick="load_page('page_log');"> My Log</a></li>
				</ul>
		</li>					
		</c:if>
		<li class="dropdown">
			<a class="fa fa-cubes dropdown-toggle" data-toggle="expand" href="#submenu_2"><span> My List</span></a>
				<ul id="submenu_2" class="panel-expand expand" role="menu">
					<li><a href="javascript:void(0);" class="fa fa-desktop" onclick="load_page('page_daily');"> My Daily</a></li>
					<li><a href="javascript:void(0);" class="fa fa-desktop" onclick="load_page('page_item');"> My Journal</a></li>
					<li><a href="javascript:void(0);" class="fa fa-desktop" onclick="load_page('page_report');"> My Report</a></li>
				</ul>
		</li>					
</ul>
