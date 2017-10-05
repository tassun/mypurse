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
<jsp:useBean id="fsTRXDBean" scope="request" class="com.fs.bean.TRXDBean"/>
<c:if test="${fsScreen.init('page_daily',pageContext.request, pageContext.response,false)}"></c:if>
<link rel="stylesheet" type="text/css" href="page_daily/page_daily.css?<%=System.currentTimeMillis()%>" />
<script  type="text/javascript" src="page_daily/page_daily.js?<%=System.currentTimeMillis()%>"></script>
<jsp:include page="page_daily_ds.jsp"/>
<div id="page_daily" class="pt-page pt-page-item">
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
							<label id="changedate_label" style="margin-left: 15px;">${fsLabel.getText('changedate_label','If you want to change date please select from the calendar then press Change Date button')}</label>
					</div>
					<div class="row">
						<div class="col-md-12" style="padding-left: 0px; padding-right: 0px;">							
							<div class="col-md-2 col-height search-group">
								<div class="input-group">
									<input type="text" id="cdrefdates" name="cdrefdate" class="form-control input-md" picture="99/99/9999" value="${fsTRXDBean.cdrefdate}"/>
									<a href="javascript:void(0);" class="input-group-addon" id="LKcdrefdates" onclick="openCalendar(document.getElementById('cdrefdates'))" title="Calendar" style="margin-right: 25px;"><i class="fa fa-calendar" aria-hidden="true"></i></a>
								</div>
							</div>
							<div class="col-md-2 search-group">
									<button type="button" id="searchbutton" class="btn btn-dark btn-sm" style="margin-top:5px; width: 100px;" >${fsLabel.getText('searchbutton','Change Date')}</button>
							</div>
							<div class="pull-right">
								<button type="button" id="insertbutton" class="btn btn-dark btn-sm" style="margin-top:5px; margin-right: 25px;" data-target="#page_daily_detail" title="${fsLabel.getText('insertbutton_title','Add New Daily List')}"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;<label id="insertbutton_label" style="margin-bottom:0px;">${fsLabel.getText('insertbutton_label','Add')}</label></button>
							</div>
						</div>			
					</div>

				</form>
				<div id="listpanel" class="table-responsive" style="padding-top: 20px;">
					<jsp:include page="page_daily_d.jsp"/>
				</div>
			</div>
		</div>
		<div id="entrypanel">
				<jsp:include page="page_daily_de.jsp"/>
		</div>
		<div id="itementrypanel">
				<jsp:include page="page_daily_item_de.jsp"/>
		</div>
</div>