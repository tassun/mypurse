<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/taglibs-formcontrol.tld" prefix="fs"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsScreen" scope="request" class="com.fs.dev.library.ScreenUtility"/>
<jsp:useBean id="fsLabel" scope="request" class="com.fs.bean.util.LabelConfig"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<c:if test="${fsScreen.config('page_regist',pageContext.request, pageContext.response,true)}"></c:if>
<link rel="stylesheet" type="text/css" href="page_regist/page_regist.css?<%=System.currentTimeMillis()%>" />
<script  type="text/javascript" src="page_regist/page_regist.js?<%=System.currentTimeMillis()%>"></script>

<div id="page_regist" class="pt-page pt-page-regist">
	<form id="page_regist_form" role="form" data-toggle="validator" name="page_regist_form" method="post" action="page_regist_de_c.jsp">
		<input type="hidden" name="fsAction" value="enter"/>
		<input type="hidden" name="fsAjax" value="true"/>
		<input type="hidden" name="fsDatatype" value="json"/>
		<div class="portal-area" style="margin-left:15px; padding-top: 10px; padding-left: 5px; padding-bottom:15px;">
			<div class="row row-heighter center-block">
				<div class="col-md-3 col-height form-group" id="usertname_layer">
					<div class="input-group">
						<span class="input-group-addon" title="User Name"><i class="fa fa-user" aria-hidden="true"></i></span>
						<input type="text" class="form-control input-md my-input" id="usertname" name="usertname" maxlength="40" placeholder="${fsLabel.getText('usertname_placeholder','First Name')}" />
					</div>				
					<span id="usertname_alert" role="alert" class="has-error" style="display:none;">${fsLabel.getText('usertname_alert','You can not leave this empty')}</span>
				</div>
				<div class="col-md-3 col-height form-group" id="usertsurname_layer">
					<input type="text" class="form-control input-md my-input" id="usertsurname" name="usertsurname" maxlength="40" placeholder="${fsLabel.getText('usertsurname_placeholder','Last Name')}" />
					<span id="usertsurname_alert" role="alert" class="has-error" style="display:none;">${fsLabel.getText('usertsurname_alert','You can not leave this empty')}</span>
				</div>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-3 col-height form-group" id="userid_layer">
					<div class="input-group">
						<span class="input-group-addon" title="User ID"><i class="fa fa-user-secret" aria-hidden="true"></i></span>
						<input type="text" class="form-control input-md my-input" id="userid" name="userid" maxlength="15" placeholder="${fsLabel.getText('userid_placeholder','User ID')}" />
					</div>	
					<span id="userid_alert" role="alert" class="has-error" style="display:none;">${fsLabel.getText('userid_alert','You can not leave this empty')}</span>
				</div>
			</div>
			<div class="row center-block" style="padding-top:0px;">
					<label id="userid_error" class="control-label has-error" style="padding-left:55px; display:none;">${fsLabel.getText('userid_error','User ID is already existed')}</label>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-3 col-height form-group" id="userpassword_layer">
					<div class="input-group">
						<span class="input-group-addon" title="Password"><i class="fa fa-key" aria-hidden="true"></i></span>
						<input type="password" class="form-control input-md my-input" id="userpassword" name="userpassword" maxlength="8" placeholder="${fsLabel.getText('userpassword_placeholder','Password')}" />
					</div>	
					<span id="userpassword_alert" role="alert" class="has-error" style="display:none;">${fsLabel.getText('userpassword_alert','You can not leave this empty')}</span>
				</div>
				<div class="col-md-3 col-height form-group" id="confirmpassword_layer">
					<input type="password" class="form-control input-md my-input" id="confirmpassword" name="confirmpassword" maxlength="8" placeholder="${fsLabel.getText('confirmpassword_placeholder','Confirm Password')}"  />
					<span id="confirmpassword_alert" role="alert" class="has-error" style="display:none;">${fsLabel.getText('confirmpassword_alert','You can not leave this empty')}</span>
				</div>
			</div>
			<div class="row center-block" style="padding-top:0px;">
					<label id="confirmpassword_error" class="control-label has-error" style="padding-left:55px; display:none;">${fsLabel.getText('confirmpassword_error','Confirm Password Mismatch')}</label>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-6 col-height form-group" id="email_layer">
					<div class="input-group">
						<span class="input-group-addon" title="Email"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>
						<input type="email" class="form-control input-md my-input" id="email" name="email" maxlength="50" placeholder="${fsLabel.getText('email_placeholder','Email')}" />
					</div>		
					<span id="email_alert" role="alert" class="has-error" style="display:none;">${fsLabel.getText('email_alert','You can not leave this empty')}</span>
				</div>
			</div>
			<div class="row center-block" style="padding-top:0px;">
					<label id="email_error" class="control-label has-error" style="padding-left:55px; display:none;">${fsLabel.getText('email_error','Invalid email input')}</label>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-6 col-height form-group" id="mobile_layer">
					<div class="input-group">
						<span class="input-group-addon" title="Mobile"><i class="fa fa-phone" aria-hidden="true"></i></span>
						<input type="text" class="form-control input-md my-input" id="mobile" name="mobile" maxlength="20" placeholder="${fsLabel.getText('mobile_placeholder','Mobile')}" />
					</div>	
				</div>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-2 col-height form-group" id="birthday_layer">
					<div class="input-group">
						<span class="input-group-addon" title="Birth Day"><i class="fa fa-birthday-cake" aria-hidden="true"></i></span>
						<select class="form-control input-md" id="birthday" name="birthday"></select>
					</div>	
					<!--<label style="padding-left:50px;">(dd/mm/yyyy)</label>-->
				</div>
				<div class="col-md-2 col-height form-group" id="birthmonth_layer">
					<select class="form-control input-md" id="birthmonth" name="birthmonth"></select>
				</div>
				<div class="col-md-2 col-height form-group" id="birthyear_layer">
					<select class="form-control input-md" id="birthyear" name="birthyear"></select>
				</div>
			</div>			
			<div class="row row-heighter center-block">
				<div class="col-md-9 col-height">
					<div class="input-group">
						<span class="input-group-addon gender-class" title="Gender"><i class="fa fa-venus-mars" aria-hidden="true"></i></span>
						<div class="col-md-2">
							<div class="radio">
								<input type="radio" style="margin-left: 5px;" class="input-md my-radio" id="gendermale" name="gender" checked="true" placeholder="${fsLabel.getText('gendermale','Male')}" title="Male" value="M"/>
								<label for="gendermale" style="margin-left:5px; font-size: 20px;" title="Male"><i class="fa fa-male" aria-hidden="true"></i></label>
							</div>
						</div>
						<div class="col-md-2">
							<div class="radio">
								<input type="radio" style="margin-left: 5px;" class="input-md my-radio" id="genderfemale" name="gender" placeholder="${fsLabel.getText('genderfemale','Female')}" title="Female" value="F"/>
								<label for="genderfemale" style="margin-left:5px; font-size: 20px;" title="Female"><i class="fa fa-female" aria-hidden="true"></i></label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr/>
			<div class="row row-heighter center-block">
				<div class="col-md-9 col-height text-center" id="confirmbox_layer">
					<div class="radio">
						<input type="checkbox" id="confirmbox" class="input-md my-radio"/>
						<label style="padding-left:5px;" for="confirmbox" id="confirmbox_label">${fsLabel.getText('confirmbox_label','I accept in terms of service with privacy and conditions')}</label>
					</div>
					<label id="confirmbox_error" class="control-label has-error" style="display:none;">${fsLabel.getText('confirmbox_error','Please accept terms of service')}</label>
				</div>
			</div>
			<div class="row row-heighter">
				<div class="col-md-9 col-height text-center">
					<input type="button" id="page_regist_savebutton" class="btn btn-dark btn-sm" value="${fsLabel.getText('page_regist_savebutton','Register')}"/>
				</div>
			</div>
		</div>
	</form>
</div>
