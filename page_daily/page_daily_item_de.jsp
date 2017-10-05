<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/taglibs-formcontrol.tld" prefix="fs"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsScreen" scope="request" class="com.fs.dev.library.ScreenUtility"/>
<jsp:useBean id="fsLabel" scope="request" class="com.fs.bean.util.LabelConfig"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<c:if test="${fsScreen.init('page_daily',pageContext.request, pageContext.response,true)}"></c:if>

<div id="page_item_detail" class="modal fade pt-page pt-page-item" tabindex="-1" role="dialog">
	<div class="modal-dialog">
	<form id="page_item_form" role="form" data-toggle="validator" name="page_item_form" method="post" action="page_item_de_c.jsp">
		<input type="hidden" name="fsAction" value="enter"/>
		<input type="hidden" name="fsAjax" value="true"/>
		<input type="hidden" name="fsDatatype" value="json"/>
		<input type="hidden" id="newcdcode" name="cdcode"/>
		<div class="modal-content portal-area" style="margin-left:15px; padding-top: 10px; padding-left: 5px; padding-bottom:15px;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" id="item_modalheader">New Item List</h4>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-9 col-height">
					<div class="input-group">
						<span class="input-group-addon newcdtype-class" title="Type"><i class="fa fa-tag" aria-hidden="true"></i></span>
						<div class="col-md-3">
							<div class="radio">
								<input type="radio" style="margin-left:5px;" class="input-md my-radio" id="newcdtypereceive" name="cdtype" checked="true" title="${fsLabel.getText('newcdtypereceive','Receive')}" value="1" />
								<label for="newcdtypereceive" style="margin-left:5px;" title="Receive"><font color="green"><i class="fa fa-plus-square" aria-hidden="true"></i></font></label>
							</div>
						</div>
						<div class="col-md-3">
							<div class="radio">
								<input type="radio" style="margin-left: 5px;" class="input-md my-radio" id="newcdtypepayment" name="cdtype" title="${fsLabel.getText('newcdtypepayment','Payment')}" value="0" />
								<label for="newcdtypepayment" style="margin-left:5px;" title="Payment"><font color="red"><i class="fa fa-minus-square" aria-hidden="true"></i></font></label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-9 col-height form-group" id="newcdname_layer">
					<div class="input-group">
						<span class="input-group-addon" title="Item Name"><i class="fa fa-tasks" aria-hidden="true"></i></span>
						<input type="text" class="form-control input-md my-input" id="newcdname" name="cdname" maxlength="80" placeholder="${fsLabel.getText('newcdname_placeholder','Title')}" />
					</div>				
					<span id="newcdname_alert" role="alert" class="has-error" style="display:none;">${fsLabel.getText('newcdname_alert','You can not leave this empty')}</span>
				</div>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-6 col-height form-group" id="newamt_layer">
					<div class="input-group">
						<span class="input-group-addon" title="Estimate Amount"><i class="fa fa-money" aria-hidden="true"></i></span>
						<input type="number" class="form-control input-md my-input decimal-input" id="newamt" name="amt" maxlength="15" placeholder="${fsLabel.getText('newamt_placeholder','Estimate Amount')}" />
					</div>		
					<span id="newamt_alert" role="alert" class="has-error" style="display:none;">${fsLabel.getText('newamt_alert','You can not leave this empty')}</span>
				</div>
			</div>
			<div class="row center-block" style="padding-top:0px;">
					<label id="newamt_error" class="control-label has-error" style="padding-left:15px; display:none;">${fsLabel.getText('newamt_error','Invalid input amout value')}</label>
			</div>
			<div class="row row-heighter modal-footer" >
				<div class="col-md-9 col-height pull-right">
					<input type="button" id="page_item_savebutton" class="btn btn-dark btn-sm" value="${fsLabel.getText('page_item_savebutton','Save')}"/>
					<input type="button" id="page_item_cancelbutton" class="btn btn-dark btn-sm" data-dismiss="modal" value="${fsLabel.getText('page_item_cancelbutton','Cancel')}"/>
				</div>
			</div>
		</div>
	</form>
	</div>
</div>
