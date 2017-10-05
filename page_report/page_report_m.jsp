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
<jsp:useBean id="fsTRXDReportBean" scope="request" class="com.fs.bean.TRXDReportBean"/>
<c:if test="${fsScreen.init('page_report',pageContext.request, pageContext.response,false)}"></c:if>
<link rel="stylesheet" type="text/css" href="page_report/page_report.css?<%=System.currentTimeMillis()%>" />
<script  type="text/javascript" src="page_report/page_report.js?<%=System.currentTimeMillis()%>"></script>

<div id="page_report" class="pt-page pt-page-item">
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
									<input type="text" id="fromdates" name="fromdate" class="form-control input-md" picture="99/99/9999" value="${fsTRXDReportBean.fromdate}"/>
									<a href="javascript:void(0);" class="input-group-addon" id="LKfromdates" onclick="openCalendar(document.getElementById('fromdates'))" title="Calendar" style="margin-right: 25px;"><i class="fa fa-calendar" aria-hidden="true"></i></a>
								</div>
							</div>
							<div class="col-md-2 col-height search-group">
								<label id="todates_label">${fsLabel.getText('todates_label','To Date')}</label>
								<div class="input-group">
									<input type="text" id="todates" name="todate" class="form-control input-md" picture="99/99/9999" value="${fsTRXDReportBean.todate}"/>
									<a href="javascript:void(0);" class="input-group-addon" id="LKtodates" onclick="openCalendar(document.getElementById('todates'))" title="Calendar" style="margin-right: 25px;"><i class="fa fa-calendar" aria-hidden="true"></i></a>
								</div>
							</div>
							<div class="col-md-8 search-group">
									<button type="button" id="journalbutton" class="btn btn-dark btn-sm" style="margin-top:30px;" >${fsLabel.getText('journalbutton','Journal')}</button>&nbsp;&nbsp;&nbsp;
									<button type="button" id="dailybutton" class="btn btn-dark btn-sm" style="margin-top:30px;" >${fsLabel.getText('dailybutton','Daily')}</button>&nbsp;&nbsp;&nbsp;
									<button type="button" id="monthlybutton" class="btn btn-dark btn-sm" style="margin-top:30px;" >${fsLabel.getText('monthlybutton','Monthly')}</button>&nbsp;&nbsp;&nbsp;
									<button type="button" id="yearlybutton" class="btn btn-dark btn-sm" style="margin-top:30px;" >${fsLabel.getText('yearlybutton','Yearly')}</button>
							</div>
						</div>			
					</div>

				</form>
				<div id="listpanel" class="table-responsive" style="padding-top: 20px;">
					<jsp:include page="page_report_d.jsp"/>
				</div>
				<div id="journallistpanel" class="table-responsive" style="padding-top: 20px;">
				</div>
				<div id="itemlistpanel" class="table-responsive" style="padding-top: 20px;">
				</div>
				<div id="reportframelayer" style="display:none;"><iframe id="exportreportframe" name="exportreportframe"></iframe></div>
			</div>
		</div>
</div>