<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/taglibs-formcontrol.tld" prefix="fs"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsScreen" scope="request" class="com.fs.dev.library.ScreenUtility"/>
<jsp:useBean id="fsLabel" scope="request" class="com.fs.bean.util.LabelConfig"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<jsp:useBean id="fsTRXDBean" scope="request" class="com.fs.bean.TRXDBean"/>
<c:if test="${fsScreen.init('page_daily',pageContext.request, pageContext.response,true)}"></c:if>

<div id="page_daily_detail" class="modal fade pt-page pt-page-item" tabindex="-1" role="dialog">
	<div class="modal-dialog">
	<form id="page_daily_form" role="form" data-toggle="validator" name="page_daily_form" method="post" action="page_daily_de_c.jsp">
		<input type="hidden" name="fsAction" value="update"/>
		<input type="hidden" name="fsAjax" value="true"/>
		<input type="hidden" name="fsDatatype" value="json"/>
		<input type="hidden" id="cdseqno" name="cdseqno" value="${fsTRXDBean.cdseqno}"/>
		<input type="hidden" id="cdrefdate" name="cdrefdate" value="${fsTRXDBean.cdrefdate}"/>
		<input type="hidden" id="oldcdcode" name="oldcdcode" value="${fsTRXDBean.cdcode}"/>
		<div class="modal-content portal-area" style="margin-left:15px; padding-top: 10px; padding-left: 5px; padding-bottom:15px;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" id="modalheader">New Daily List</h4>
			</div>
			<div class="row center-block" style="padding-top:0px;">
					<label id="cdname_info" class="control-label" style="padding-left:15px;">${fsLabel.getText('cdname_info','Please select daily item, else if not found you can add the new one by press Add New Item button after select box')}</label>
			</div>
			<div class="row row-heighter center-block" style="margin-top: 15px;">
				<div class="col-md-9 col-height form-group" id="cdcode_layer">
					<div class="input-group">
						<span class="input-group-addon" title="Item"><i class="fa fa-tasks" aria-hidden="true"></i></span>
						<fs:select tagclass="form-control input-md my-input" tagid="cdcode" name="cdcode" selection="ITEMLIST_CATEGORY" onchange="codeItemChange(this)">${fsTRXDBean.cdcode}</fs:select>
						<span class="input-group-addon" id="cdcodebutton" title="${fsLabel.getText('cdcodebutton_title','Add New Item')}" onclick="return newItemList();" style="cursor:pointer;"><a href="javascript:void(0);" id="addbutton_ctrl" tabIndex="-1"><i class="fa fa-plus-square-o" aria-hidden="true"></i></a></span>
					</div>
					<span id="cdcode_alert" role="alert" class="has-error" style="display:none;">${fsLabel.getText('cdcode_alert','You can not leave this empty')}</span>
				</div>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-6 col-height form-group" id="amt_layer">
					<div class="input-group">
						<span class="input-group-addon" title="Amount"><i class="fa fa-money" aria-hidden="true"></i></span>
						<input type="number" class="form-control input-md my-input decimal-input" id="amt" name="amt" maxlength="15" placeholder="${fsLabel.getText('amt_placeholder','Amount')}" value="${fsTRXDBean.amt}"/>
						<span id="receive_span" class="input-group-addon cdtype-class" title="Receive" style="${fsScreen.getEquals(fsTRXDBean.cdtype,'1','','display:none;')}"><font color="green"><i class="fa fa-plus-square" aria-hidden="true"></i></font></span>
						<span id="payment_span" class="input-group-addon cdtype-class" title="Payment" style="${fsScreen.getEquals(fsTRXDBean.cdtype,'0','','display:none;')}"><font color="red"><i class="fa fa-minus-square" aria-hidden="true"></i></font></span>
					</div>		
					<span id="amt_alert" role="alert" class="has-error" style="display:none;">${fsLabel.getText('amt_alert','You can not leave this empty')}</span>
				</div>
			</div>
			<div class="row center-block" style="padding-top:0px;">
					<label id="amt_error" class="control-label has-error" style="padding-left:15px; display:none;">${fsLabel.getText('amt_error','Invalid input amount value')}</label>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-9 col-height form-group" id="remark_layer">
					<div class="input-group">
						<span class="input-group-addon" title="Remark"><i class="fa fa-star" aria-hidden="true"></i></span>
						<input type="text" class="form-control input-md my-input" id="remark" name="remark" maxlength="80" placeholder="${fsLabel.getText('remark_placeholder','Remark')}" value="${fsTRXDBean.remark}"/>
					</div>	
				</div>
			</div>
			<div class="row row-heighter modal-footer" >
				<div class="col-md-9 col-height pull-right">
					<input type="button" id="page_daily_savebutton" class="btn btn-dark btn-sm" value="${fsLabel.getText('page_daily_savebutton','Save')}"/>
					<input type="button" id="page_daily_cancelbutton" class="btn btn-dark btn-sm" data-dismiss="modal" value="${fsLabel.getText('page_daily_cancelbutton','Cancel')}"/>
				</div>
			</div>
		</div>
	</form>
	</div>
</div>
