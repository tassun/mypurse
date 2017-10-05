<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/taglibs-formcontrol.tld" prefix="fs"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsScreen" scope="request" class="com.fs.dev.library.ScreenUtility"/>
<jsp:useBean id="fsLabel" scope="request" class="com.fs.bean.util.LabelConfig"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<c:if test="${fsScreen.config('page_forgot',pageContext.request, pageContext.response,true)}"></c:if>
<link rel="stylesheet" type="text/css" href="page_forgot/page_forgot.css?<%=System.currentTimeMillis()%>" />
<script  type="text/javascript" src="page_forgot/page_forgot.js?<%=System.currentTimeMillis()%>"></script>

<div id="page_forgot" class="pt-page pt-page-change">
	<form id="page_forgot_form" role="form" data-toggle="validator" name="page_forgot_form" method="post" action="page_forgot_de_c.jsp">
		<input type="hidden" name="fsAction" value="update"/>
		<input type="hidden" name="fsAjax" value="true"/>
		<input type="hidden" name="fsDatatype" value="json"/>
		<div class="portal-area" style="margin-left:15px; padding-top: 10px; padding-left: 5px; padding-bottom:15px;">
			<div class="row row-heighter center-block">
					<label id="forgotpassword_info" style="padding-left:15px;">${fsLabel.getText('forgotpassword_info','Please identify your id and email address with secure code from image')}</label>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-3 col-height form-group" id="userid_layer">
					<div class="input-group">
						<span class="input-group-addon" title="User ID"><i class="fa fa-user-secret" aria-hidden="true"></i></span>
						<input type="text" class="form-control input-md my-input" id="userid" name="userid" placeholder="${fsLabel.getText('userid_placeholder','User ID')}" />
					</div>	
					<span id="userid_alert" role="alert" class="has-error" style="display:none;">${fsLabel.getText('userid_alert','You can not leave this empty')}</span>
				</div>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-4 col-height form-group" id="email_layer">
					<div class="input-group">
						<span class="input-group-addon" title="Email"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>
						<input type="email" class="form-control input-md my-input" id="email" name="privacy" placeholder="${fsLabel.getText('email_placeholder','Email')}" />
					</div>		
					<span id="email_alert" role="alert" class="has-error" style="display:none;">${fsLabel.getText('email_alert','You can not leave this empty')}</span>
				</div>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-4 col-height form-group" id="secureimage_layer">
					<div class="btn-group mr-2" role="group">
						<img id="secureimage" style="border: 1px solid gray;" src="jsp/secureimage.jsp?<%=System.currentTimeMillis()%>"/>
					</div>
					<div class="btn-group mr-2" role="group" style="vertical-align: bottom;">
						<button id="secureimage_ctrl" title="Refresh" class="btn btn-sm btn-base" style="min-width:30px; " tabIndex="-1"><i class="fa fa-refresh" aria-hidden="true"></i></button>
					</div>
				</div>
			</div>
			<div class="row row-heighter center-block">
					<label id="securecode_info" style="padding-left:15px;">${fsLabel.getText('securecode_info','Please specify the result of two value plus from image')}</label>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-4 col-height form-group" id="securecode_layer">
					<div class="input-group">
						<span class="input-group-addon" title="Answer Code"><i class="fa fa-unlock-alt" aria-hidden="true"></i></span>
						<input type="text" class="form-control input-md my-input" id="securecode" name="securecode" placeholder="${fsLabel.getText('securecode_placeholder','Answer Code')}"  />
					</div>	
					<span id="securecode_alert" role="alert" class="has-error" style="display:none;">${fsLabel.getText('securecode_alert','You can not leave this empty')}</span>
				</div>
			</div>
			<hr/>
			<div class="row row-heighter">
				<div class="col-md-9 col-height text-center">
					<input type="button" id="page_forgot_savebutton" class="btn btn-dark btn-sm" value="${fsLabel.getText('page_forgot_savebutton','Send')}"/>
				</div>
			</div>
		</div>
	</form>
</div>
