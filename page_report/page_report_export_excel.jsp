<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page language="java" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page contentType="application/vnd.ms-excel"%>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.bean.ctrl.*"%>
<%@ page import="com.fs.bean.misc.*"%>
<%@ page import="com.fs.bean.*" %>
<%@ page import="com.fs.dev.exim.*"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsLabel" scope="request" class="com.fs.bean.util.LabelConfig"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<jsp:setProperty name="fsGlobal" property="*"/>
<jsp:useBean id="fsTRXDReportBean" scope="request" class="com.fs.bean.TRXDReportBean"/>
<jsp:useBean id="fsTUserReportBean" scope="request" class="com.fs.bean.TUserReportBean"/>
<c:if test="${fsScreen.init('page_report',pageContext.request, pageContext.response,false)}"></c:if>
<%
String fs_type = "result";
String fs_code = "";
StringBuffer fs_result = new StringBuffer();
fsGlobal.setFsProg("page_report");
fsGlobal.setFsSection(null);
fsGlobal.obtain(session);
fsGlobal.obtain(fsAccessor);
try {
	int fs_action = fsGlobal.parseAction();
	fsGlobal.obtain(fsAccessor);
	ExcelWriter fs_writer = new ExcelWriter();
	fs_writer.addHeader("cdname",fsLabel.getText("cdname_column","Title"));
	fs_writer.addHeader("cnamt",fsLabel.getText("cnamt_column","Receive"));
	fs_writer.addHeader("dnamt",fsLabel.getText("dnamt_column","Payment"));
	fs_writer.addonRowHeader(new TbField(0,fsTUserReportBean.getUsertname()+" "+fsTUserReportBean.getUsertsurname()+" ("+fsTUserReportBean.getUserid()+")"));
	fs_writer.addonRowHeader(new TbField(0,fsLabel.getText("asat_column","As At")+" : "+fsTRXDReportBean.getFromdate()+" - "+fsTRXDReportBean.getTodate()));
	if(fsTRXDReportBean.size()>0) {
		java.math.BigDecimal fs_sum_recamt = java.math.BigDecimal.ZERO;
		java.math.BigDecimal fs_sum_payamt = java.math.BigDecimal.ZERO;
		java.util.Enumeration ens = fsTRXDReportBean.elements();
		if(ens!=null) {
			for(;ens.hasMoreElements();) {
				TRXDReportBean bean = (TRXDReportBean)ens.nextElement();
				if(bean!=null) {
					java.math.BigDecimal amt = bean.getFieldByName("amt").asBigDecimal();
					if("1".equals(bean.getCdtype())) {
						bean.setCnamt(amt.toString());
						fs_sum_recamt = fs_sum_recamt.add(amt);
					} else {
						bean.setDnamt(amt.toString());
						fs_sum_payamt = fs_sum_payamt.add(amt);					
					}
				}
			}
		}
		java.math.BigDecimal fs_sum_amt = fs_sum_recamt.subtract(fs_sum_payamt);
		fs_writer.addonRowFooter(new TbField(0,fsLabel.getText("total_column","Total")),new TbField(1,fs_sum_recamt.toString()),new TbField(2,fs_sum_payamt.toString()));
		if(fs_sum_amt.compareTo(java.math.BigDecimal.ZERO)>=0) {
			fs_writer.addonRowFooter(new TbField(0,fsLabel.getText("balance_column","Balance")),new TbField(1,fs_sum_amt.toString()));
		} else {
			fs_writer.addonRowFooter(new TbField(0,fsLabel.getText("balance_column","Balance")),new TbField(2,fs_sum_amt.toString()));
		}
		out.clear();
		fs_writer.execute(request,response,"report_journal",fsTRXDReportBean.iteratorElements());
	} else {
		out.clear();
		fs_writer.process(request,response,"report_journal",fsLabel.getText("recordnotfound","Records not found"));		
	}
	return;
} catch(Throwable ex) {
	fsGlobal.setThrowable(ex);
	Trace.error(fsAccessor,ex);
}
if(fsGlobal.isException()) {
	fs_type = "error";
	fs_result.append("<body>");
	fs_result.append(fsGlobal.getFsMessage());
	fs_result.append("</body>");
}
%>
<message type="<%=fs_type%>" code="<%=fs_code%>">
<%=fs_result.toString()%>
</message>
