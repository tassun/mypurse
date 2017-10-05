<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/taglibs-formcontrol.tld" prefix="fs"%>

<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsScreen" scope="request" class="com.fs.dev.library.ScreenUtility"/>
<jsp:useBean id="fsLabel" scope="request" class="com.fs.bean.util.LabelConfig"/>
<jsp:useBean id="fsPager" scope="request" class="com.fs.bean.util.Pager"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<jsp:useBean id="fsTULBean" scope="session" class="com.fs.bean.TULBean"/>
<c:if test="${fsScreen.init('page_track',pageContext.request, pageContext.response,false)}"></c:if>
<c:if test="${fsScreen.validateUserType(fsAccessor,'A')}"></c:if>
<link rel="stylesheet" type="text/css" href="page_track/page_track.css?<%=System.currentTimeMillis()%>" />
<script  type="text/javascript" src="page_track/page_track.js?<%=System.currentTimeMillis()%>"></script>

<div id="page_track" class="pt-page pt-page-item">
		<div id="ptsearchpager" class="pt-page pt-page-current pt-page-controller search-pager">
			<div id="searchpanel" class="panel-body">
				<form id="fssearchform" name="fssearchform" method="post">
					<input type="hidden" name="fsAction" value="collect"/>
					<input type="hidden" name="fsAjax" value="true"/>
					<input type="hidden" name="fsDatatype" value="text"/>
					<input type="hidden" name="fsChapter" value="${fsPager.chapter}"/>
					<input type="hidden" name="fsLimit" value="${fsPager.limit}"/>
					<input type="hidden" name="fsPage" value="1"/>

					<div class="row">
						<div class="col-md-12" style="padding-left: 0px; padding-right: 0px;">
							<div class="col-md-2 col-height search-group">
								<label id="fromdates_label">${fsLabel.getText('fromdates_label','From Date')}</label>
								<div class="input-group">
									<input type="text" id="fromdates" name="fromdate" class="form-control input-md" picture="99/99/9999" value="${fsTULBean.fromdate}"/>
									<a href="javascript:void(0);" class="input-group-addon" id="LKfromdates" onclick="openCalendar(document.getElementById('fromdates'))" title="Calendar" style="margin-right: 25px;"><i class="fa fa-calendar" aria-hidden="true"></i></a>
								</div>
							</div>
							<div class="col-md-2 col-height search-group">
								<label id="todates_label">${fsLabel.getText('todates_label','To Date')}</label>
								<div class="input-group">
									<input type="text" id="todates" name="todate" class="form-control input-md" picture="99/99/9999" value="${fsTULBean.todate}"/>
									<a href="javascript:void(0);" class="input-group-addon" id="LKtodates" onclick="openCalendar(document.getElementById('todates'))" title="Calendar" style="margin-right: 25px;"><i class="fa fa-calendar" aria-hidden="true"></i></a>
								</div>
							</div>
							<div class="col-md-2 col-height search-group">
								<label id="userids_label">&nbsp;</label>
									<input type="text" class="form-control input-md my-input" id="userids" name="userid" maxlength="15" placeholder="${fsLabel.getText('userids_placeholder','User ID')}" />
							</div>
							<div class="col-md-2 search-group">
									<button type="button" id="searchbutton" class="btn btn-dark btn-sm" style="margin-top:30px;" >${fsLabel.getText('searchbutton','Search')}</button>
							</div>
						</div>			
					</div>

				</form>
				<div id="listpanel" class="table-responsive" style="padding-top: 20px;">
					<jsp:include page="page_track_d.jsp"/>
				</div>
				<div id="journallistpanel" class="table-responsive" style="padding-top: 20px;">
				</div>
				<div id="itemlistpanel" class="table-responsive" style="padding-top: 20px;">
				</div>
			</div>
		</div>
</div>