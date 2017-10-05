<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/taglibs-formcontrol.tld" prefix="fs"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsScreen" scope="request" class="com.fs.dev.library.ScreenUtility"/>
<jsp:useBean id="fsLabel" scope="request" class="com.fs.bean.util.LabelConfig"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<jsp:useBean id="fsTRXPBean" scope="request" class="com.fs.bean.TRXPBean"/>
<c:if test="${fsScreen.init('page_item',pageContext.request, pageContext.response,true)}"></c:if>

<div id="page_item_detail" class="modal fade pt-page pt-page-item" tabindex="-1" role="dialog">
	<div class="modal-dialog">
	<form id="page_item_form" role="form" data-toggle="validator" name="page_item_form" method="post" action="page_item_de_c.jsp">
		<input type="hidden" name="fsAction" value="update"/>
		<input type="hidden" name="fsAjax" value="true"/>
		<input type="hidden" name="fsDatatype" value="json"/>
		<input type="hidden" id="cdcode" name="cdcode" value="${fsTRXPBean.cdcode}"/>
		<div class="modal-content portal-area" style="margin-left:15px; padding-top: 10px; padding-left: 5px; padding-bottom:15px;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" id="modalheader">View Item List</h4>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-9 col-height">
					<div class="input-group">
						<span class="input-group-addon cdtype-class" title="Type"><i class="fa fa-tag" aria-hidden="true"></i></span>
						<div class="col-md-2">
							<div class="radio">
								<input type="radio" style="margin-left:5px;" class="input-md my-radio" id="cdtypereceive" name="cdtype" checked="true" placeholder="${fsLabel.getText('cdtypereceive','Receive')}" title="Receive" value="1" disabled/>
								<c:if test="${fsScreen.isEquals(fsTRXPBean.cdtype,'1')}">
									<label for="cdtypereceive" style="margin-left:5px;" title="Receive"><font color="green"><i class="fa fa-plus-square" aria-hidden="true"></i></font></label>
								</c:if>
								<c:if test="${fsScreen.isEquals(fsTRXPBean.cdtype,'0')}">
									<label for="cdtypepayment" style="margin-left:5px;" title="Payment"><font color="red"><i class="fa fa-minus-square" aria-hidden="true"></i></font></label>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-9 col-height form-group" id="cdname_layer">
					<div class="input-group">
						<span class="input-group-addon" title="Item Name"><i class="fa fa-tasks" aria-hidden="true"></i></span>
						<input type="text" class="form-control input-md my-input" id="cdname" name="cdname" maxlength="80" placeholder="${fsLabel.getText('cdname_placeholder','Title')}" value="${fsTRXPBean.cdname}" disabled/>
					</div>				
				</div>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-6 col-height form-group" id="amt_layer">
					<div class="input-group">
						<span class="input-group-addon" title="Estimate Amount"><i class="fa fa-money" aria-hidden="true"></i></span>
						<input type="number" class="form-control input-md my-input decimal-input" id="amt" name="amt" maxlength="15" placeholder="${fsLabel.getText('amt_placeholder','Estimate Amount')}" value="${fsTRXPBean.amt}" disabled/>
					</div>		
				</div>
			</div>
			<div class="row row-heighter modal-footer" >
				<div class="col-md-9 col-height pull-right">
					<input type="button" id="page_item_cancelbutton" class="btn btn-dark btn-sm" data-dismiss="modal" value="${fsLabel.getText('page_item_cancelbutton','Cancel')}"/>
				</div>
			</div>
		</div>
	</form>
	</div>
</div>
