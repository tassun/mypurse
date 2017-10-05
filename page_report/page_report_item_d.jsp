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
<jsp:useBean id="fsTRXDItem" scope="request" class="com.fs.bean.TRXDBean"/>
<jsp:useBean id="fsFormat" scope="page" class="com.fs.bean.util.BeanFormat"/>

<div class="row">
	<div class="col-md-12" style="padding-left: 0px; padding-right: 0px;">
		<div class="col-md-9 col-height">
			<a href="javascript:void(0);" onclick="return backToJournal();" title="Backward"><i class="fa fa-backward" aria-hidden="true"></i>&nbsp;<label style="padding-left: 5px; cursor:pointer;">${fsTRXDItem.cdrefdate}</label></a>
		</div>
		<div class="pull-right">
			<button type="button" id="backwardbutton" onclick="return backToJournal();" class="btn btn-dark btn-sm" style="margin-top:5px; margin-right: 17px;" title="Backward"><i class="fa fa-backward" aria-hidden="true"></i>&nbsp; ${fsLabel.getText('backwardbutton','Back')}</button>
		</div>
	</div>			
</div>

<c:set var="fs_sum_payamt" scope="page" value="0"/>
<c:set var="fs_sum_recamt" scope="page" value="0"/>
<c:set var="fs_sum_amt" scope="page" value="0"/>
<table id="itemdatatable" class="table table-bordered table-hover table-striped tablesorter">
	<thead>
		<tr>
			<th class="text-center" style="width: 5%"><fs:label tagid="item_seqno_headerlabel" >No.</fs:label></th>
			<th class="text-center" style="width: 25%;"><fs:label tagid="item_cdname_headerlabel">Title</fs:label></th>
			<th class="text-center" style="width: 15%;"><font color="green" title="Receive"><i class="fa fa-plus-square" aria-hidden="true"></i></font>&nbsp;<fs:label tagid="item_receiveamt_headerlabel">Receive</fs:label></th>
			<th class="text-center" style="width: 15%;"><font color="red" title="Payment"><i class="fa fa-minus-square" aria-hidden="true"></i></font>&nbsp;<fs:label tagid="item_paymentamt_headerlabel">Payment</fs:label></th>
			<th class="text-center"><fs:label tagid="item_remark_headerlabel">Remark</fs:label></th>
			<th class="text-center" style="width: 10%;"><i class="fa fa-bolt" aria-hidden="true"></i></th>
		</tr>
	</thead>
	<tbody id="itemdatatablebody">							
		<c:choose>
			<c:when test="${fsTRXDItem.size() > 0}">
				<c:forEach var="fsElement" items="${fsTRXDItem.elements()}" varStatus="records">
						<tr class="data-row" title="${fsElement.cdcode}">
							<td class="text-center" style="vertical-align: middle;"><c:out value="${records.count}"></c:out></td>
							<td style="vertical-align: middle;"><a href="javascript:void(0)" class="alink-data" onclick="submitRetrieve(${records.count},['${fsElement.cdcode}','${fsTRXDItem.fromdate}','${fsTRXDItem.todate}']);"><c:out value="${fsElement.cdname}"></c:out></a></td>							
							<td class="text-right" style="vertical-align: middle;">
								<c:if test="${fsScreen.isEquals(fsElement.cdtype,'1')}">
									<c:set var="fs_sum_recamt" value="${fs_sum_recamt + fsElement.getFieldByName('amt').asBigDecimal()}"/>
									<a href="javascript:void(0)" class="alink-data" onclick="submitRetrieve(${records.count},['${fsElement.cdcode}','${fsTRXDItem.fromdate}','${fsTRXDItem.todate}']);"><c:out value="${fsElement.amt}"></c:out></a>
								</c:if>
							</td>
							<td class="text-right" style="vertical-align: middle;">
								<c:if test="${fsScreen.isEquals(fsElement.cdtype,'0')}">
									<c:set var="fs_sum_payamt" value="${fs_sum_payamt + fsElement.getFieldByName('amt').asBigDecimal()}"/>
									<a href="javascript:void(0)" class="alink-data" onclick="submitRetrieve(${records.count},['${fsElement.cdcode}','${fsTRXDItem.fromdate}','${fsTRXDItem.todate}']);"><c:out value="${fsElement.amt}"></c:out></a>
								</c:if>
							</td>
							<td style="vertical-align: middle;"><a href="javascript:void(0)" class="alink-data" onclick="submitRetrieve(${records.count},['${fsElement.cdcode}','${fsTRXDItem.fromdate}','${fsTRXDItem.todate}']);"><c:out value="${fsElement.remark}"></c:out></a></td>
							<td class="text-center">
									<button name="btn-view" type="button" class="btn-view" title="${fsLabel.getLabel('btnview_tooltip')}"
									onclick="submitRetrieve(${records.count},['${fsElement.cdcode}','${fsTRXDItem.fromdate}','${fsTRXDItem.todate}']);"></button>
							</td>
						</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
					<tr>
						<td class="text-center" colspan="5">
								<label id="recordnotfound">${fsLabel.getLabel("recordnotfound")}</label>
						</td>
					</tr>
			</c:otherwise>
		</c:choose>		
	</tbody>
	<c:set var="fs_sum_amt" value="${fs_sum_recamt - fs_sum_payamt}"/>
	<tfoot>
		<tr>
			<td colspan="2" align="left" style="vertical-align: middle;"><label style="padding-left: 5%;">${fsTRXDItem.cdrefdate}</label><fs:label tagid="item_totalamt_label" tagclass="pull-right">Total Amount</fs:label></td>
			<td align="right" style="color:green; vertical-align: middle;"><fmt:formatNumber type="number" value="${fs_sum_recamt}" pattern="#,##0.00"/></td>
			<td align="right" style="color:red; vertical-align: middle;"><fmt:formatNumber type="number" value="${fs_sum_payamt}" pattern="#,##0.00"/></td>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2" align="right" style="vertical-align: middle;"><fs:label tagid="item_balanceamt_label">Balance Amount</fs:label></td>
			<td align="right" style="color:green; vertical-align: middle;">
				<c:if test="${fs_sum_amt >= 0}">
					<fmt:formatNumber type="number" value="${fs_sum_amt}" pattern="#,##0.00"/>
				</c:if>
			</td>
			<td align="right" style="color:red; vertical-align: middle;">
				<c:if test="${fs_sum_amt < 0}">
					<fmt:formatNumber type="number" value="${fs_sum_amt}" pattern="#,##0.00"/>
				</c:if>
			</td>
			<td colspan="2" style="vertical-align: middle;">&nbsp;	</td>
		</tr>
	</tfoot>
</table>	
