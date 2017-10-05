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
<jsp:useBean id="fsTRXMDailyBean" scope="session" class="com.fs.bean.TRXMReportBean"/>
<jsp:useBean id="fsFormat" scope="page" class="com.fs.bean.util.BeanFormat"/>

<c:set var="fs_sum_payamt" scope="page" value="0"/>
<c:set var="fs_sum_recamt" scope="page" value="0"/>
<c:set var="fs_sum_amt" scope="page" value="0"/>
<div class="row">
	<div class="col-md-12" style="padding-left: 0px; padding-right: 0px;">
		<div class="col-md-9 col-height">
			<label style="padding-left: 5px;">${fsTRXMDailyBean.fromdate} - ${fsTRXMDailyBean.todate}</label>
		</div>
		<div class="pull-right">
			<button type="button" id="dailyexportexcelbutton" onclick="return exportReportDailyToExcel();" class="btn btn-dark btn-sm" style="margin-bottom:5px; margin-right: 17px;" title="Export Excel"><i class="fa fa-file-excel-o" aria-hidden="true"></i>&nbsp;<label id="exportdailyexcelbutton"   style="margin-bottom:0px;">${fsLabel.getText('exportdailyexcelbutton','Excel')}</label></button>
			<button type="button" id="dailyexportpdfbutton" onclick="return exportReportDailyToPDF();" class="btn btn-dark btn-sm" style="margin-bottom:5px; margin-right: 17px;" title="Export PDF"><i class="fa fa-file-pdf-o" aria-hidden="true"></i>&nbsp;<label id="exportdailypdfbutton"   style="margin-bottom:0px;">${fsLabel.getText('exportdailypdfbutton','PDF')}</label></button>
		</div>
	</div>			
</div>
<table id="dailydatatable" class="table table-bordered table-hover table-striped tablesorter">
	<thead>
		<tr>
			<th class="text-center" style="width: 5%"><fs:label tagid="daily_seqno_headerlabel" >No.</fs:label></th>
			<th class="text-center"><a href="javascript:void(0)" class="alink-sorter" onclick="submitDailyOrder('fsAjax=true&fsSorter=cdrefdate&fsChapter=${fsPager.chapter}&fsPage=${fsGlobal.fsPage}')"><fs:label tagid="daily_cddate_headerlabel">Date</fs:label></a></th>
			<th class="text-center" style="width: 15%;"><a href="javascript:void(0)" class="alink-sorter" onclick="submitDailyOrder('fsAjax=true&fsSorter=cnamt&fsChapter=${fsPager.chapter}&fsPage=${fsGlobal.fsPage}')"><font color="green" title="Receive"><i class="fa fa-plus-square" aria-hidden="true"></i></font>&nbsp;<fs:label tagid="daily_receiveamt_headerlabel">Receive</fs:label></a></th>
			<th class="text-center" style="width: 15%;"><a href="javascript:void(0)" class="alink-sorter" onclick="submitDailyOrder('fsAjax=true&fsSorter=dnamt&fsChapter=${fsPager.chapter}&fsPage=${fsGlobal.fsPage}')"><font color="red" title="Payment"><i class="fa fa-minus-square" aria-hidden="true"></i></font>&nbsp;<fs:label tagid="daily_paymentamt_headerlabel">Payment</fs:label></a></th>
			<th class="text-center"><a href="javascript:void(0)" class="alink-sorter" onclick="submitDailyOrder('fsAjax=true&fsSorter=amt&fsChapter=${fsPager.chapter}&fsPage=${fsGlobal.fsPage}')"><font color="green" title="Amount"></font>&nbsp;<fs:label tagid="daily_amt_headerlabel">Amount</fs:label></a></th>
			<th class="text-center" style="width: 10%;"><i class="fa fa-bolt" aria-hidden="true"></i></th>
		</tr>
	</thead>
	<tbody id="dailydatatablebody">							
		<c:choose>
			<c:when test="${fsTRXMDailyBean.size() > 0}">
				<c:forEach var="fsElement" items="${fsTRXMDailyBean.elements()}" varStatus="records">
					<c:set var="fs_cnamt" value="${fsElement.getFieldByName('cnamt').asBigDecimal()}"/>
					<c:set var="fs_dnamt" value="${fsElement.getFieldByName('dnamt').asBigDecimal()}"/>
					<c:set var="fs_sum_recamt" value="${fs_sum_recamt + fs_cnamt}"/>
					<c:set var="fs_sum_payamt" value="${fs_sum_payamt + fs_dnamt}"/>
					<c:if test="${!fsGlobal.nextChapter(records.count)}">
						<tr class="data-row" title="${fsElement.cdrefdate}">
							<td class="text-center" style="vertical-align: middle;"><c:out value="${records.count}"></c:out></td>
							<td class="text-center" style="vertical-align: middle;"><a href="javascript:void(0)" class="alink-data" onclick="submitViewDaily(${records.count},['${fsElement.cdrefdate}','${fsTRXMDailyBean.fromdate}','${fsTRXMDailyBean.todate}']);"><c:out value="${fsElement.cdrefdate}"></c:out></a></td>							
							<td class="text-right" style="vertical-align: middle;">
									<a href="javascript:void(0)" class="alink-data" onclick="submitViewDaily(${records.count},['${fsElement.cdrefdate}','${fsTRXMDailyBean.fromdate}','${fsTRXMDailyBean.todate}']);"><c:out value="${fsElement.cnamt}"></c:out></a>
							</td>
							<td class="text-right" style="vertical-align: middle;">
									<a href="javascript:void(0)" class="alink-data" onclick="submitViewDaily(${records.count},['${fsElement.cdrefdate}','${fsTRXMDailyBean.fromdate}','${fsTRXMDailyBean.todate}']);"><c:out value="${fsElement.dnamt}"></c:out></a>
							</td>
							<td class="text-right" style="vertical-align: middle;">
								<c:if test="${fs_cnamt >= fs_dnamt}">
									<a href="javascript:void(0)" class="alink-data" onclick="submitViewDaily(${records.count},['${fsElement.cdrefdate}','${fsTRXMDailyBean.fromdate}','${fsTRXMDailyBean.todate}']);" style="color:green;"><c:out value="${fsElement.amt}"></c:out></a>
								</c:if>
								<c:if test="${fs_cnamt < fs_dnamt}">
									<a href="javascript:void(0)" class="alink-data" onclick="submitViewDaily(${records.count},['${fsElement.cdrefdate}','${fsTRXMDailyBean.fromdate}','${fsTRXMDailyBean.todate}']);" style="color:red;"><c:out value="${fsElement.amt}"></c:out></a>
								</c:if>
							</td>
							<td class="text-center">
									<button name="btn-view" type="button" class="btn-view" title="${fsLabel.getLabel('btnview_tooltip')}"
									onclick="submitViewDaily(${records.count},['${fsElement.cdrefdate}','${fsTRXMDailyBean.fromdate}','${fsTRXMDailyBean.todate}']);"></button>
							</td>
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
	<c:set var="fs_sum_amt" value="${fs_sum_recamt - fs_sum_payamt}"/>
	<tfoot>
		<tr>
			<td colspan="2" align="left" style="vertical-align: middle;"><label style="padding-left: 5%;">${fsTRXMDailyBean.fromdate} - ${fsTRXMDailyBean.todate}</label> <fs:label tagid="daily_totalamt_label" tagclass="pull-right">Total Amount</fs:label></td>
			<td align="right" style="color:green; vertical-align: middle;"><fmt:formatNumber type="number" value="${fs_sum_recamt}" pattern="#,##0.00"/></td>
			<td align="right" style="color:red; vertical-align: middle;"><fmt:formatNumber type="number" value="${fs_sum_payamt}" pattern="#,##0.00"/></td>
			<c:if test="${fs_sum_amt >= 0}">
			<td align="right" style="color:green; vertical-align: middle;">
					<fmt:formatNumber type="number" value="${fs_sum_amt}" pattern="#,##0.00"/>
			</td>
			</c:if>			
			<c:if test="${fs_sum_amt < 0}">
			<td align="right" style="color:red; vertical-align: middle;">
					<fmt:formatNumber type="number" value="${fs_sum_amt}" pattern="#,##0.00"/>
			</td>
			</c:if>
			<td>&nbsp;</td>
		</tr>
	</tfoot>
</table>	
<center>
<table cellspacing="0" cellpadding="0" class="fschaptertable">
	<tr class="fschapterrow"><td class="fschaptercolumn">
	<form name="fsdailychapterform" id="fsdailychapterform" method="post" autocomplete="off">
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
	${fsGlobal.createPaging('submitDailyChapter','fsdailychapterform',fsPager.rows)}
</c:if>
	</div>
	</td>
	</tr>
</table>
</center>	
