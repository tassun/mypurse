<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/taglibs-formcontrol.tld" prefix="fs"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsScreen" scope="request" class="com.fs.dev.library.ScreenUtility"/>
<jsp:useBean id="fsLabel" scope="request" class="com.fs.bean.util.LabelConfig"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<c:if test="${fsScreen.init('page_change',pageContext.request, pageContext.response,true)}"></c:if>
<link rel="stylesheet" type="text/css" href="page_change/page_change.css?<%=System.currentTimeMillis()%>" />
<script  type="text/javascript" src="page_change/page_change.js?<%=System.currentTimeMillis()%>"></script>

<div id="page_change" class="pt-page pt-page-change">
	<form id="page_change_form" role="form" data-toggle="validator" name="page_change_form" method="post" action="page_change_c.jsp">
		<input type="hidden" name="fsAction" value="update"/>
		<input type="hidden" name="fsAjax" value="true"/>
		<input type="hidden" name="fsDatatype" value="json"/>
		<div class="portal-area" style="margin-left:15px; padding-top: 10px; padding-left: 5px; padding-bottom:15px;">
			<div class="row row-heighter center-block">
				<div class="col-md-3 col-height form-group " id="oldpassword_layer">
					<div class="input-group">
						<span class="input-group-addon" title="Old Password"><i class="fa fa-unlock" aria-hidden="true"></i></span>
						<input type="password" class="form-control input-md my-input" id="oldpassword" name="oldpassword" placeholder="${fsLabel.getText('oldpassword_placeholder','Old Password')}" />
					</div>	
					<span id="oldpassword_alert" role="alert" class="has-error" style="display:none;">${fsLabel.getText('oldpassword_alert','You can not leave this empty')}</span>
				</div>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-3 col-height form-group " id="userpassword_layer">
					<div class="input-group">
						<span class="input-group-addon" title="New Password"><i class="fa fa-key" aria-hidden="true"></i></span>
						<input type="password" class="form-control input-md my-input" id="userpassword" name="userpassword" placeholder="${fsLabel.getText('userpassword_placeholder','New Password')}"  />
					</div>		
					<span id="userpassword_alert" role="alert" class="has-error" style="display:none;">${fsLabel.getText('userpassword_alert','You can not leave this empty')}</span>
				</div>
			</div>
			<div class="row row-heighter center-block">
				<div class="col-md-3 col-height form-group " id="confirmpassword_layer">
					<div class="input-group">
						<span class="input-group-addon" title="Confirm Password"><i class="fa fa-key" aria-hidden="true"></i></span>
						<input type="password" class="form-control input-md my-input" id="confirmpassword" name="confirmpassword" placeholder="${fsLabel.getText('confirmpassword_placeholder','Confirm Password')}"  />
					</div>	
					<span id="confirmpassword_alert" role="alert" class="has-error" style="display:none;">${fsLabel.getText('confirmpassword_alert','You can not leave this empty')}</span>
				</div>
			</div>
			<div class="row" style="padding-top:0px;">
					<label id="confirmpassword_error" class="control-label has-error" style="padding-left:55px; display:none;">${fsLabel.getText('confirmpassword_error','Confirm Password Mismatch')}</label>
			</div>
			<hr/>
			<div class="row row-heighter">
				<div class="col-md-9 col-height text-center">
					<input type="button" id="page_change_savebutton" class="btn btn-dark btn-sm" value="${fsLabel.getText('page_change_savebutton','Save')}"/>
				</div>
			</div>
		</div>
	</form>
</div>
