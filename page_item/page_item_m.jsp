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
<jsp:useBean id="fsTRXPBean" scope="session" class="com.fs.bean.TRXPBean"/>
<c:if test="${fsScreen.init('page_item',pageContext.request, pageContext.response,true)}"></c:if>
<link rel="stylesheet" type="text/css" href="page_item/page_item.css?<%=System.currentTimeMillis()%>" />
<script  type="text/javascript" src="page_item/page_item.js?<%=System.currentTimeMillis()%>"></script>

<div id="page_item" class="pt-page pt-page-item">
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
						<div class="col-md-2" style="padding-left: 0px; padding-left: 15px;">
							<div class="pull-left">
								<button type="button" id="refreshbutton" class="btn btn-dark btn-sm" style="margin-left: 2px;"><i class="fa fa-refresh" aria-hidden="true"></i>&nbsp;<label id="refreshbutton_label" style="margin-bottom:0px;">${fsLabel.getText('refreshbutton_label','Refresh')}</label></button>
							</div>
						</div>
						<div class="col-md-10" style="padding-left: 0px; padding-right: 15px;">
							<div class="pull-right">
								<button type="button" id="insertbutton" class="btn btn-dark btn-sm" style="" data-target="#page_item_detail" title="${fsLabel.getText('insertbutton_title','Add New Journal List')}"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;<label id="insertbutton_label" style="margin-bottom:0px;">${fsLabel.getText('insertbutton_label','Add')}</label></button>
							</div>
						</div>
					</div>

				</form>
				<div id="listpanel" class="table-responsive" style="padding-top: 20px;">
					<jsp:include page="page_item_d.jsp"/>
				</div>
			</div>
		</div>
		<div id="entrypanel">
				<jsp:include page="page_item_de.jsp"/>
		</div>
</div>