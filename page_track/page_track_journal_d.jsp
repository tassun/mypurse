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
<jsp:useBean id="fsTULJournal" scope="session" class="com.fs.bean.TULBean"/>

<div class="row">
	<div class="col-md-12" style="padding-left: 0px; padding-right: 0px;">
		<div class="col-md-9 col-height">
			<a href="javascript:void(0);" onclick="return backToListing();" title="Backward"><i class="fa fa-backward" aria-hidden="true"></i>&nbsp;<label style="padding-left: 5px; cursor:pointer;">${fsTULJournal.usertname}&nbsp; ${fsTULJournal.usertsurname} (${fsTULJournal.userid}) &nbsp; ${fsTULJournal.mobile} &nbsp; ${fsTULJournal.email} </label></a>
		</div>
		<div class="pull-right">
			<button type="button" id="backbutton" onclick="return backToListing();" class="btn btn-dark btn-sm" style="margin-top:5px; margin-right: 17px;" title="Backward"><i class="fa fa-backward" aria-hidden="true"></i>&nbsp; ${fsLabel.getText('backbutton','Back')}</button>
		</div>
	</div>			
</div>
<table id="journaldatatable" class="table table-bordered table-hover table-striped tablesorter">
	<thead>
		<tr>
			<th class="text-center" style="width: 5%"><fs:label tagid="journal_seqno_headerlabel" >No.</fs:label></th>
			<th class="text-center"><a href="javascript:void(0)" class="alink-sorter" onclick="submitJournalOrder('fsAjax=true&fsSorter=curtime&fsChapter=${fsPager.chapter}&fsPage=${fsGlobal.fsPage}')"><fs:label id="journal_curtime_headerlabel">Date/Time</fs:label></a></th>
			<th class="text-center"><fs:label id="journal_progid_headerlabel">Program</fs:label></a></th>
			<th class="text-center"><fs:label id="journal_action_headerlabel">Action</fs:label></a></th>
			<th class="text-center"><fs:label tagid="journal_remark_headerlabel">Remark</fs:label></th>
			<th class="text-center" style="width: 10%;"><i class="fa fa-bolt" aria-hidden="true"></i></th>
		</tr>
	</thead>
	<tbody id="journaldatatablebody">							
		<c:choose>
			<c:when test="${fsTULJournal.size() > 0}">
				<c:forEach var="fsElement" items="${fsTULJournal.elements()}" varStatus="records">
					<c:if test="${!fsGlobal.nextChapter(records.count)}">
						<tr>
							<td class="text-center"><c:out value="${records.count}"></c:out></td>
							<td class="text-center"><a href="javascript:void(0)" class="alink-data" onclick="submitView(${records.count},['${fsElement.curdate}']);"><c:out value="${fsElement.curtime}"></c:out></a></td>
							<td><a href="javascript:void(0)" class="alink-data" onclick="submitView(${records.count},['${fsElement.curdate}']);"><c:out value="${fsElement.progid}"></c:out></a></td>
							<td style="vertical-align: middle;"><a href="javascript:void(0)" class="alink-data" onclick="submitView(${records.count},['${fsElement.curdate}']);"><c:out value="${fsElement.action}"></c:out></a></td>
							<td style="vertical-align: middle;"><a href="javascript:void(0)" class="alink-data" onclick="submitView(${records.count},['${fsElement.curdate}']);"><c:out value="${fsElement.remark}"></c:out></a></td>
							<td class="text-center">
									<button name="btn-view" type="button" class="btn-view" title="${fsLabel.getLabel('btnview_tooltip')}"
									onclick="submitView(${records.count},['${fsElement.curdate}']);"></button>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:when>
			<c:otherwise>
					<tr>
						<td class="text-center" colspan="6">
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
	<form name="fsjournalchapterform" id="fsjournalchapterform" method="post" autocomplete="off">
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
	${fsGlobal.createPaging('submitJournalChapter','fsjournalchapterform',fsPager.rows)}
</c:if>
	</div>
	</td>
	</tr>
</table>
</center>	
