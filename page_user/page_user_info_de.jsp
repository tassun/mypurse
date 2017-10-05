<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/taglibs-formcontrol.tld" prefix="fs"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsScreen" scope="request" class="com.fs.dev.library.ScreenUtility"/>
<jsp:useBean id="fsLabel" scope="request" class="com.fs.bean.util.LabelConfig"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<jsp:useBean id="fsTUserReportBean" scope="request" class="com.fs.bean.TUserReportBean"/>
<c:if test="${fsScreen.init('page_user',pageContext.request, pageContext.response,true)}"></c:if>
<c:if test="${fsScreen.validateUserType(fsAccessor,'A')}"></c:if>

<div id="page_user_info" class="modal fade pt-page pt-page-info" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content portal-area" style="margin-left:15px; padding-top: 10px; padding-left: 5px; padding-bottom:15px;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" id="user_info_modalheader">${fsLabel.getText('user_info_modalheader','User Information')}</h4>
			</div>
			<div class="row row-heighter center-block" style="margin-top: 15px;">
				<div class="col-md-5 col-height form-group" id="userid_layer">
					<div class="input-group">
						<span class="input-group-addon" title="User ID"><i class="fa fa-user-secret" aria-hidden="true"></i></span>
						<input type="text" class="form-control input-md my-input" id="userid" value="${fsTUserReportBean.userid}" disabled/>
					</div>	
				</div>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-5 col-height form-group" id="usertname_layer">
					<div class="input-group">
						<span class="input-group-addon" title="User Name"><i class="fa fa-user" aria-hidden="true"></i></span>
						<input type="text" class="form-control input-md my-input" id="usertname" value="${fsTUserReportBean.usertname}" disabled />
					</div>				
				</div>
				<div class="col-md-5 col-height form-group" id="usertsurname_layer">
					<input type="text" class="form-control input-md my-input" id="usertsurname" value="${fsTUserReportBean.usertsurname}" disabled />
				</div>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-10 col-height form-group" id="address1_layer">
					<div class="input-group">
						<span class="input-group-addon address1-class" title="Address"><i class="fa fa-home" aria-hidden="true"></i></span>
						<input type="text" class="form-control input-md my-input" id="address1" value="${fsTUserReportBean.address1}" disabled />
					</div>	
				</div>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-10 col-height form-group" id="address2_layer">
					<div class="input-group">
						<span class="input-group-addon address2-class" title="Address"><i class="fa fa-home" aria-hidden="true"></i></span>
						<input type="text" class="form-control input-md my-input" id="address2" value="${fsTUserReportBean.address2}" disabled />
					</div>	
				</div>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-8 col-height form-group" id="email_layer">
					<div class="input-group">
						<span class="input-group-addon" title="Email"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>
						<input type="email" class="form-control input-md my-input" id="email" value="${fsTUserReportBean.email}" disabled />
					</div>		
				</div>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-8 col-height form-group" id="mobile_layer">
					<div class="input-group">
						<span class="input-group-addon" title="Mobile"><i class="fa fa-phone" aria-hidden="true"></i></span>
						<input type="text" class="form-control input-md my-input" id="mobile" value="${fsTUserReportBean.mobile}" disabled />
					</div>	
				</div>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-5 col-height form-group" id="birthday_layer">
					<div class="input-group">
						<span class="input-group-addon" title="Birth Day"><i class="fa fa-birthday-cake" aria-hidden="true"></i></span>
						<input type="text" class="form-control input-md my-input" id="birthday" value="${fsTUserReportBean.birthday}" disabled />
					</div>	
				</div>
			</div>			
			<div class="row row-heighter center-block">
				<div class="col-md-9 col-height">
					<div class="input-group">
						<span class="input-group-addon gender-class" title="Gender"><i class="fa fa-venus-mars" aria-hidden="true"></i></span>
						<div class="col-md-2">
							<div class="radio">
								<c:if test="${fsScreen.isEquals(fsTUserReportBean.gender,'M')}">
								<label style="margin-left:5px;" title="Male"><i class="fa fa-male" aria-hidden="true"></i></label>
								</c:if>
								<c:if test="${fsScreen.isEquals(fsTUserReportBean.gender,'F')}">
								<label for="genderfemale" style="margin-left:5px;" title="Female"><i class="fa fa-female" aria-hidden="true"></i></label>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr/>
			<div class="row row-heighter modal-footer">
				<div class="col-md-9 col-height text-center pull-right">
					<input type="button" id="page_user_cancelbutton" class="btn btn-dark btn-sm" data-dismiss="modal" value="${fsLabel.getText('page_user_cancelbutton','Cancel')}"/>
				</div>
			</div>
		</div>
	</div>
</div>
