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
<jsp:useBean id="fsTXRPBean" scope="session" class="com.fs.bean.TRXPBean"/>

<form name="fslistform" id="fslistform" method="post" autocomplete="off" action="page_item_c.jsp">
	<input type="hidden" name="fsAction" value="view"/>
	<input type="hidden" name="fsAjax" value="true"/>
	<input type="hidden" name="fsDatatype" value="text"/>
	<input type="hidden" name="fsRowid" value=""/>
	<input type="hidden" name="fsChapter" value="${fsPager.chapter}"/>
	<input type="hidden" name="fsLimit" value="${fsPager.limit}"/>
	<input type="hidden" name="fsPage" value="${fsGlobal.fsPage}"/>
	<input type="hidden" name="cdcode" />
</form>
<div id="fseffectedtransactions" style="display:none;">${fsTRXPBean.effectedTransactions()}</div>
<table id="datatable" class="table table-bordered table-hover table-striped tablesorter">
	<thead>
		<tr>
			<th class="text-center" style="cursor: default;"><fs:label tagid="seqno_headerlabel" >No.</fs:label></th>
			<th class="text-center"><a href="javascript:void(0)" class="alink-sorter" onclick="submitOrder('fsAjax=true&fsSorter=cdname&fsChapter=${fsPager.chapter}&fsPage=${fsGlobal.fsPage}')"><fs:label id="cdname_headerlabel">Title</fs:label></a></th>
			<th class="text-center"><a href="javascript:void(0)" class="alink-sorter" onclick="submitOrder('fsAjax=true&fsSorter=amt&fsChapter=${fsPager.chapter}&fsPage=${fsGlobal.fsPage}')"><fs:label id="amt_headerlabel">Amount</fs:label></a></th>
			<th class="text-center"><a href="javascript:void(0)" class="alink-sorter" onclick="submitOrder('fsAjax=true&fsSorter=cdtype&fsChapter=${fsPager.chapter}&fsPage=${fsGlobal.fsPage}')"><fs:label id="cdtype_headerlabel">Type</fs:label></a></th>
			<th class="text-center" style="cursor: default;"><i class="fa fa-bolt" aria-hidden="true"></i></th>
		</tr>
	</thead>
	<tbody id="datatablebody">							
		<c:choose>
			<c:when test="${fsTRXPBean.size() > 0}">
				<c:forEach var="fsElement" items="${fsTRXPBean.elements()}" varStatus="records">
					<c:if test="${!fsGlobal.nextChapter(records.count)}">
						<tr title="${fsElement.cdcode}">
							<td class="text-center"><c:out value="${records.count}"></c:out></td>
							<c:choose>
								<c:when test="${fsScreen.isEquals(fsAccessor.getFsVar('fsUsertype'),'A')}">
									<td><a href="javascript:void(0)" class="alink-data" onclick="submitRetrieve(${records.count},['${fsElement.cdcode}']);"><c:out value="${fsElement.cdname}"></c:out></a></td>
									<td align="right"><a href="javascript:void(0)" class="alink-data" onclick="submitRetrieve(${records.count},['${fsElement.cdcode}']);"><c:out value="${fsElement.amt}"></c:out></a></td>
									<td align="center"><a href="javascript:void(0)" class="alink-data cdtype-alink" onclick="submitRetrieve(${records.count},['${fsElement.cdcode}']);">
									${fsScreen.getEquals(fsElement.cdtype,'1','<font color="green" title="Receive"><i class="fa fa-plus-square" aria-hidden="true"></i></font>','<font color="red" title="Payment"><i class="fa fa-minus-square" aria-hidden="true"></i></font>')}
									</a></td>
									<td class="text-center">
										<button name="btn-edit" type="button" class="btn-edit" title="${fsLabel.getLabel('btnedit_tooltip')}"
												onclick="submitRetrieve(${records.count},['${fsElement.cdcode}']);"></button>
										<button type="button" class="btn-delete" title="${fsLabel.getLabel('btndelete_tooltip')}" 
												onclick="submitDelete(['${fsElement.cdcode}'],${records.count});"></button>
									</td>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${fsScreen.isEquals(fsAccessor.getFsUser(),fsElement.userid)}">
											<td><a href="javascript:void(0)" class="alink-data" onclick="submitRetrieve(${records.count},['${fsElement.cdcode}']);"><c:out value="${fsElement.cdname}"></c:out></a></td>
											<td align="right"><a href="javascript:void(0)" class="alink-data" onclick="submitRetrieve(${records.count},['${fsElement.cdcode}']);"><c:out value="${fsElement.amt}"></c:out></a></td>
											<td align="center"><a href="javascript:void(0)" class="alink-data cdtype-alink" onclick="submitRetrieve(${records.count},['${fsElement.cdcode}']);">
											${fsScreen.getEquals(fsElement.cdtype,'1','<font color="green" title="Receive"><i class="fa fa-plus-square" aria-hidden="true"></i></font>','<font color="red" title="Payment"><i class="fa fa-minus-square" aria-hidden="true"></i></font>')}
											</a></td>
											<td class="text-center">
												<button name="btn-edit" type="button" class="btn-edit" title="${fsLabel.getLabel('btnedit_tooltip')}"
														onclick="submitRetrieve(${records.count},['${fsElement.cdcode}']);"></button>
												<button type="button" class="btn-delete" title="${fsLabel.getLabel('btndelete_tooltip')}" 
														onclick="submitDelete(['${fsElement.cdcode}'],${records.count});"></button>
											</td>
										</c:when>
										<c:otherwise>
											<td><a href="javascript:void(0)" class="alink-data" onclick="submitView(${records.count},['${fsElement.cdcode}']);"><c:out value="${fsElement.cdname}"></c:out></a></td>
											<td align="right"><a href="javascript:void(0)" class="alink-data" onclick="submitView(${records.count},['${fsElement.cdcode}']);"><c:out value="${fsElement.amt}"></c:out></a></td>
											<td align="center"><a href="javascript:void(0)" class="alink-data cdtype-alink" onclick="submitView(${records.count},['${fsElement.cdcode}']);">
											${fsScreen.getEquals(fsElement.cdtype,'1','<font color="green" title="Receive"><i class="fa fa-plus-square" aria-hidden="true"></i></font>','<font color="red" title="Payment"><i class="fa fa-minus-square" aria-hidden="true"></i></font>')}
											</a></td>
											<td class="text-center">
												<button name="btn-view" type="button" class="btn-view" title="${fsLabel.getLabel('btnview_tooltip')}"
														onclick="submitView(${records.count},['${fsElement.cdcode}']);"></button>
											</td>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:if>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:if test="${!fsScreen.isViewState()}">
					<tr>
						<td class="text-center" colspan="5">
								<label id="recordnotfound">${fsLabel.getLabel("recordnotfound")}</label>
						</td>
					</tr>
				</c:if>
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
