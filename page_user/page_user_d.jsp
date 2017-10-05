<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/taglibs-formcontrol.tld" prefix="fs"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsScreen" scope="request" class="com.fs.dev.library.ScreenUtility"/>
<jsp:useBean id="fsLabel" scope="request" class="com.fs.bean.util.LabelConfig"/>
<jsp:useBean id="fsPager" scope="request" class="com.fs.bean.util.Pager"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<jsp:useBean id="fsTUserReportBean" scope="session" class="com.fs.bean.TUserReportBean"/>

<div id="fseffectedtransactions" style="display:none;">${fsTUserReportBean.effectedTransactions()}</div>
<form name="fslistform" id="fslistform" method="post" autocomplete="off">
	<input type="hidden" name="fsAction" value="retrieve"/>
	<input type="hidden" name="fsAjax" value="true"/>
	<input type="hidden" name="fsDatatype" value="text"/>
	<input type="hidden" name="fsChapter" value="${fsPager.chapter}"/>
	<input type="hidden" name="fsLimit" value="${fsPager.limit}"/>
	<input type="hidden" name="fsPage" value="${fsGlobal.fsPage}"/>
	<input type="hidden" name="userid" />
	<input type="hidden" name="fromdate" value="${fsTUserReportBean.fromdate}"/>
	<input type="hidden" name="todate" value="${fsTUserReportBean.todate}"/>
</form>
<table id="datatable" class="table table-bordered table-hover table-striped tablesorter">
	<thead>
		<tr>
			<th class="text-center" style="width: 5%;"><fs:label tagid="seqno_headerlabel" >No.</fs:label></th>
			<th class="text-center" style="width: 10%;"><a href="javascript:void(0)" class="alink-sorter" onclick="submitOrder('fsAjax=true&fsSorter=userid&fsChapter=${fsPager.chapter}&fsPage=${fsGlobal.fsPage}')"><fs:label tagid="userid_headerlabel">User</fs:label></a></th>
			<th class="text-center" ><a href="javascript:void(0)" class="alink-sorter" onclick="submitOrder('fsAjax=true&fsSorter=usertname&fsChapter=${fsPager.chapter}&fsPage=${fsGlobal.fsPage}')"><fs:label tagid="usertname_headerlabel">First Name</fs:label></a></th>
			<th class="text-center" ><a href="javascript:void(0)" class="alink-sorter" onclick="submitOrder('fsAjax=true&fsSorter=usertsurname&fsChapter=${fsPager.chapter}&fsPage=${fsGlobal.fsPage}')"><fs:label tagid="usertsurname_headerlabel">Last Name</fs:label></a></th>
			<th class="text-center" ><a href="javascript:void(0)" class="alink-sorter" onclick="submitOrder('fsAjax=true&fsSorter=email&fsChapter=${fsPager.chapter}&fsPage=${fsGlobal.fsPage}')"><fs:label tagid="email_headerlabel">Email</fs:label></a></th>
			<th class="text-center" ><a href="javascript:void(0)" class="alink-sorter" onclick="submitOrder('fsAjax=true&fsSorter=mobile&fsChapter=${fsPager.chapter}&fsPage=${fsGlobal.fsPage}')"><fs:label tagid="mobile_headerlabel">Mobile</fs:label></a></th>
			<th class="text-center" ><a href="javascript:void(0)" class="alink-sorter" onclick="submitOrder('fsAjax=true&fsSorter=startdate&fsChapter=${fsPager.chapter}&fsPage=${fsGlobal.fsPage}')"><fs:label tagid="startdate_headerlabel">Register Date</fs:label></a></th>
			<th class="text-center" ><a href="javascript:void(0)" class="alink-sorter" onclick="submitOrder('fsAjax=true&fsSorter=starttime&fsChapter=${fsPager.chapter}&fsPage=${fsGlobal.fsPage}')"><fs:label tagid="starttime_headerlabel">Register Time</fs:label></a></th>
			<th class="text-center" ><a href="javascript:void(0)" class="alink-sorter" onclick="submitOrder('fsAjax=true&fsSorter=accessdate&fsChapter=${fsPager.chapter}&fsPage=${fsGlobal.fsPage}')"><fs:label tagid="accessdate_headerlabel">Last Access Date</fs:label></a></th>
			<th class="text-center" ><a href="javascript:void(0)" class="alink-sorter" onclick="submitOrder('fsAjax=true&fsSorter=accesstime&fsChapter=${fsPager.chapter}&fsPage=${fsGlobal.fsPage}')"><fs:label tagid="accesstime_headerlabel">Last Access Time</fs:label></a></th>
			<th class="text-center" style="width: 10%;"><i class="fa fa-bolt" aria-hidden="true"></i></th>
		</tr>
	</thead>
	<tbody id="datatablebody">							
		<c:choose>
			<c:when test="${fsTUserReportBean.size() > 0}">
				<c:forEach var="fsElement" items="${fsTUserReportBean.elements()}" varStatus="records">
					<c:if test="${!fsGlobal.nextChapter(records.count)}">
						<tr class="data-row">
							<td class="text-center" style="vertical-align: middle;"><c:out value="${records.count}"></c:out></td>
							<td style="vertical-align: middle;"><a href="javascript:void(0)" class="alink-data" onclick="submitView(${records.count},['${fsElement.userid}']);"><c:out value="${fsElement.userid}"></c:out></a></td>							
							<td style="vertical-align: middle;">
								<a href="javascript:void(0)" class="alink-data" onclick="submitView(${records.count},['${fsElement.userid}']);"><c:out value="${fsElement.usertname}"></c:out></a>
							</td>
							<td style="vertical-align: middle;">
								<a href="javascript:void(0)" class="alink-data" onclick="submitView(${records.count},['${fsElement.userid}']);"><c:out value="${fsElement.usertsurname}"></c:out></a>
							</td>
							<td style="vertical-align: middle;">
								<a href="javascript:void(0)" class="alink-data" onclick="submitView(${records.count},['${fsElement.userid}']);"><c:out value="${fsElement.email}"></c:out></a>
							</td>
							<td style="vertical-align: middle;">
								<a href="javascript:void(0)" class="alink-data" onclick="submitView(${records.count},['${fsElement.userid}']);"><c:out value="${fsElement.mobile}"></c:out></a>
							</td>
							<td class="text-center" style="vertical-align: middle;">
								<a href="javascript:void(0)" class="alink-data" onclick="submitRetrieve(${records.count},['${fsElement.userid}','${fsElement.startdate}']);"><c:out value="${fsElement.startdate}"></c:out></a>
							</td>
							<td class="text-center" style="vertical-align: middle;">
								<a href="javascript:void(0)" class="alink-data" onclick="submitRetrieve(${records.count},['${fsElement.userid}','${fsElement.startdate}']);"><c:out value="${fsElement.starttime}"></c:out></a>
							</td>
							<td class="text-center" style="vertical-align: middle;">
								<a href="javascript:void(0)" class="alink-data" onclick="submitRetrieve(${records.count},['${fsElement.userid}','${fsElement.accessdate}']);"><c:out value="${fsElement.accessdate}"></c:out></a>
							</td>
							<td class="text-center" style="vertical-align: middle;">
								<a href="javascript:void(0)" class="alink-data" onclick="submitRetrieve(${records.count},['${fsElement.userid}','${fsElement.accessdate}']);"><c:out value="${fsElement.accesstime}"></c:out></a>
							</td>
							<td class="text-center" style="vertical-align: middle;">
								<button name="btn-view" type="button" class="btn-view" title="${fsLabel.getLabel('btnview_tooltip')}"
										onclick="submitView(${records.count},['${fsElement.userid}']);"></button>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:when>
			<c:otherwise>
					<tr>
						<td class="text-center" colspan="11">
								<label id="recordnotfound">${fsLabel.getLabel("recordnotfound")}</label>
						</td>
					</tr>
			</c:otherwise>
		</c:choose>		
	</tbody>
</table>	
<center>
<table cellspacing="0" cellpadding="0" class="fschaptertable">
	<tr class="fschapterrow"><td class="fschaptercolumn">
	<form name="fschapterform" id="fschapterform" method="post" autocomplete="off">
		<input type="hidden" name="fsAction" value="chapter"/>
		<input type="hidden" name="fsAjax" value="true"/>
		<input type="hidden" name="fsDatatype" value="text"/>
		<input type="hidden" name="fsChapter" value="${fsPager.chapter}"/>
		<input type="hidden" name="fsLimit" value="${fsPager.limit}"/>
		<input type="hidden" name="fsPage" value="${fsGlobal.fsPage}"/>
		<input type="hidden" name="fsSorter" value=""/>
	</form>
	<div id="fschapterlayer">
<c:if test="${fsGlobal.hasPaging(fsPager.rows)}">
	${fsGlobal.createPaging(fsPager.rows)}
</c:if>
	</div>
	</td>
	</tr>
</table>
</center>	
