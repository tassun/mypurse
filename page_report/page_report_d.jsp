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
<jsp:useBean id="fsTXRDReportBean" scope="request" class="com.fs.bean.TRXDReportBean"/>
<jsp:useBean id="fsFormat" scope="page" class="com.fs.bean.util.BeanFormat"/>

<c:set var="fs_sum_payamt" scope="page" value="0"/>
<c:set var="fs_sum_recamt" scope="page" value="0"/>
<c:set var="fs_sum_amt" scope="page" value="0"/>
<div id="fseffectedtransactions" style="display:none;">${fsTRXDReportBean.effectedTransactions()}</div>
<div class="row">
	<div class="col-md-12" style="padding-left: 0px; padding-right: 0px;">
		<div class="col-md-9 col-height">
			<label style="padding-left: 5px;">${fsTRXDReportBean.fromdate} - ${fsTRXDReportBean.todate}</label>
		</div>
		<div class="pull-right">
			<button type="button" id="journalexportexcelbutton" onclick="return exportReportJournalToExcel();" class="btn btn-dark btn-sm" style="margin-bottom:5px; margin-right: 17px;" title="Export Excel"><i class="fa fa-file-excel-o" aria-hidden="true"></i>&nbsp;<label id="exportjournalexcelbutton"  style="margin-bottom:0px;">${fsLabel.getText('exportjournalexcelbutton','Excel')}</label></button>
			<button type="button" id="journalexportpdfbutton" onclick="return exportReportJournalToPDF();" class="btn btn-dark btn-sm" style="margin-bottom:5px; margin-right: 17px;" title="Export PDF"><i class="fa fa-file-pdf-o" aria-hidden="true"></i>&nbsp;<label id="exportjournalpdfbutton"   style="margin-bottom:0px;">${fsLabel.getText('exportjournalpdfbutton','PDF')}</label></button>
		</div>
	</div>			
</div>
<form name="fslistform" id="fslistform" method="post" autocomplete="off">
	<input type="hidden" name="fsAction" value="retrieve"/>
	<input type="hidden" name="fsAjax" value="true"/>
	<input type="hidden" name="fsDatatype" value="text"/>
	<input type="hidden" name="fsChapter" value="${fsPager.chapter}"/>
	<input type="hidden" name="fsLimit" value="${fsPager.limit}"/>
	<input type="hidden" name="fsPage" value="${fsGlobal.fsPage}"/>
	<input type="hidden" name="cdcode" />
	<input type="hidden" name="fromdate" value="${fsTRXDReportBean.fromdate}"/>
	<input type="hidden" name="todate" value="${fsTRXDReportBean.todate}"/>
</form>
<table id="datatable" class="table table-bordered table-hover table-striped tablesorter">
	<thead>
		<tr>
			<th class="text-center" style="width: 5%;"><fs:label tagid="seqno_headerlabel" >No.</fs:label></th>
			<th class="text-center" style="width: 25%;"><fs:label tagid="cdname_headerlabel">Title</fs:label></th>
			<th class="text-center" style="width: 15%;"><font color="green" title="Receive"><i class="fa fa-plus-square" aria-hidden="true"></i></font>&nbsp;<fs:label tagid="receiveamt_headerlabel">Receive</fs:label></th>
			<th class="text-center" style="width: 15%;"><font color="red" title="Payment"><i class="fa fa-minus-square" aria-hidden="true"></i></font>&nbsp;<fs:label tagid="paymentamt_headerlabel">Payment</fs:label></th>
			<th class="text-center" style="width: 10%;"><i class="fa fa-bolt" aria-hidden="true"></i></th>
		</tr>
	</thead>
	<tbody id="datatablebody">							
		<c:choose>
			<c:when test="${fsTRXDReportBean.size() > 0}">
				<c:forEach var="fsElement" items="${fsTRXDReportBean.elements()}" varStatus="records">
						<tr class="data-row" title="${fsElement.cdcode}">
							<td class="text-center" style="vertical-align: middle;"><c:out value="${records.count}"></c:out></td>
							<td style="vertical-align: middle;"><a href="javascript:void(0)" class="alink-data" onclick="submitRetrieve(${records.count},['${fsElement.cdcode}','${fsTRXDReportBean.fromdate}','${fsTRXDReportBean.todate}']);"><c:out value="${fsElement.cdname}"></c:out></a></td>							
							<td class="text-right" style="vertical-align: middle;">
								<c:if test="${fsScreen.isEquals(fsElement.cdtype,'1')}">
									<c:set var="fs_sum_recamt" value="${fs_sum_recamt + fsElement.getFieldByName('amt').asBigDecimal()}"/>
									<a href="javascript:void(0)" class="alink-data alink-receive" onclick="submitRetrieve(${records.count},['${fsElement.cdcode}','${fsTRXDReportBean.fromdate}','${fsTRXDReportBean.todate}']);"><c:out value="${fsElement.amt}"></c:out></a>
								</c:if>
							</td>
							<td class="text-right" style="vertical-align: middle;">
								<c:if test="${fsScreen.isEquals(fsElement.cdtype,'0')}">
									<c:set var="fs_sum_payamt" value="${fs_sum_payamt + fsElement.getFieldByName('amt').asBigDecimal()}"/>
									<a href="javascript:void(0)" class="alink-data alink-payment" onclick="submitRetrieve(${records.count},['${fsElement.cdcode}','${fsTRXDReportBean.fromdate}','${fsTRXDReportBean.todate}']);"><c:out value="${fsElement.amt}"></c:out></a>
								</c:if>
							</td>
							<td class="text-center" style="vertical-align: middle;">
								<button name="btn-view" type="button" class="btn-view" title="${fsLabel.getLabel('btnview_tooltip')}"
										onclick="submitRetrieve(${records.count},['${fsElement.cdcode}','${fsTRXDReportBean.fromdate}','${fsTRXDReportBean.todate}']);"></button>
							</td>
						</tr>
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
	<c:set var="fs_sum_amt" value="${fs_sum_recamt - fs_sum_payamt}"/>
	<tfoot>
		<tr>
			<td colspan="2" align="left" style="vertical-align: middle;"><label style="padding-left: 5%;">${fsTRXDReportBean.fromdate} - ${fsTRXDReportBean.todate}</label><fs:label tagid="totalamt_label" tagclass="pull-right">Total Amount</fs:label></td>
			<td align="right" style="color:green; vertical-align: middle;"><fmt:formatNumber type="number" value="${fs_sum_recamt}" pattern="#,##0.00"/></td>
			<td align="right" style="color:red; vertical-align: middle;"><fmt:formatNumber type="number" value="${fs_sum_payamt}" pattern="#,##0.00"/></td>
			<td colspan="3">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2" align="right" style="vertical-align: middle;"><fs:label tagid="balanceamt_label">Balance Amount</fs:label></td>
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
			<td colspan="2" style="vertical-align: middle;">&nbsp;</td>
		</tr>
	</tfoot>
</table>	
