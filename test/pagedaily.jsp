<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:setProperty name="fsAccessor" property="*"/>
<jsp:useBean id="fsScreen" scope="request" class="com.fs.dev.library.ScreenUtility"/>
<jsp:useBean id="fsLabel" scope="request" class="com.fs.bean.util.LabelConfig"/>
<c:if test="${fsScreen.initial(pageContext.request, pageContext.response)}"></c:if>
<c:if test="${fsScreen.config('index',pageContext.request, pageContext.response)}"></c:if>
<jsp:include page="jsp/checkbrowser.jsp"/>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>MyPURSE</title>		
		<jsp:include page="jsp/meta.jsp"/>
		<link href="img/mypurse.ico" rel="shortcut icon" type="image/x-icon" />
		<c:out value="${fsScreen.createStyles('MAIN_STYLES')}" escapeXml="false"></c:out>
		<link rel="stylesheet" type="text/css" href="page_login/page_login.css" />
		<jsp:include page="jsp/stylesmain.jsp"/>
		<c:out value="${fsScreen.createScripts('MAIN_SCRIPTS',pageContext.request, pageContext.response)}" escapeXml="false"></c:out>
		<script type="text/javascript" src="js/index.js?<%=System.currentTimeMillis()%>"></script>
		<script>
			$(function() { 
				loadApplication("page_daily");
			});
		</script>
	</head>
	<body class="portalbody portalbody-off" ng-app="mainapplication" ng-controller="maincontroller">
		<nav id="navigatebar" class="navbar navigatebar-top" style="min-height: 30px;">
			<jsp:include page="main/main_header.jsp"/>
		</nav>
		<nav id="sidebarmenu" class="sidebar sidebar-menu sidebar-hide">
			<div id="sidebarlayer" class="sidebar-layer">				
			</div>
			<div id="sidebarfooter" class="sidebar-footer"><a href="#" onclick="logOut()"><i class="fa fa-sign-out fa-rotate-180"></i> &nbsp;Log Out</a></div>
		</nav>
		<div id="pagewrapper" class="wraper-container" ng-app>
			<div id="statuslayer"><h3 class="status" id="statuslabel"></h3></div>
			<div id="pagemain" class="pt-perspective ptmain-pager">
				<jsp:include page="page_login/page_login.jsp"/>
				<div id="pagecontainer" class="pt-pager">	
					
				</div> 
			</div>
		</div>
		<div id="pageremainder"></div>
		<div id="pagesubremainder"></div>
		<jsp:include page="main/main_footer.jsp"/>
		<div id="fsdialoglayer" style="display:none;"><span id="fsmsgbox"></span></div>
		<div id="fsacceptlayer" style="display:none;"><span id="fsacceptbox"></span></div>
		<div id="fswaitlayer" style="display:none; position:absolute; left:1px; top:1px; z-Index:9999;"><img id="waitImage" class="waitimgclass" src="images/waiting.gif" width="50px" height="50px"></img></div>	
		<jsp:include page="main/main_context.jsp"/>
	</body>
</html>
