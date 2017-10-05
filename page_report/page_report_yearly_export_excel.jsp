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
<jsp:useBean id="fsTRXMYearlyBean" scope="session" class="com.fs.bean.TRXMReportBean"/>
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
	fs_writer.addHeader("yearly",fsLabel.getText("yearly_column","Year"));
	fs_writer.addHeader("excnamt",fsLabel.getText("cnamt_column","Receive"));
	fs_writer.addHeader("exdnamt",fsLabel.getText("dnamt_column","Payment"));
	fs_writer.addHeader("examt",fsLabel.getText("amt_column","Amount"));
	fs_writer.addonRowHeader(new TbField(0,fsTUserReportBean.getUsertname()+" "+fsTUserReportBean.getUsertsurname()+" ("+fsTUserReportBean.getUserid()+")"));
	fs_writer.addonRowHeader(new TbField(0,fsLabel.getText("asat_column","As At")+" : "+fsTRXMYearlyBean.getFromdate()+" - "+fsTRXMYearlyBean.getTodate()));
	if(fsTRXMYearlyBean.size()>0) {
		java.math.BigDecimal fs_sum_recamt = java.math.BigDecimal.ZERO;
		java.math.BigDecimal fs_sum_payamt = java.math.BigDecimal.ZERO;
		java.util.Enumeration ens = fsTRXMYearlyBean.elements();
		if(ens!=null) {
			for(;ens.hasMoreElements();) {
				TRXMReportBean bean = (TRXMReportBean)ens.nextElement();
				if(bean!=null) {
					java.math.BigDecimal fs_amt = bean.getFieldByName("amt").asBigDecimal();
					java.math.BigDecimal fs_cnamt = bean.getFieldByName("cnamt").asBigDecimal();
					java.math.BigDecimal fs_dnamt = bean.getFieldByName("dnamt").asBigDecimal();
					fs_sum_recamt = fs_sum_recamt.add(fs_dnamt);
					fs_sum_payamt = fs_sum_payamt.add(fs_dnamt);					
					bean.setExamt(fs_amt.toString());
					bean.setExcnamt(fs_cnamt.toString());
					bean.setExdnamt(fs_dnamt.toString());
				}
			}
		}
		java.math.BigDecimal fs_sum_amt = fs_sum_recamt.subtract(fs_sum_payamt);
		fs_writer.addonRowFooter(new TbField(0,fsLabel.getText("total_column","Total Amount")),new TbField(1,fs_sum_recamt.toString()),new TbField(2,fs_sum_payamt.toString()),new TbField(3,fs_sum_amt.toString()));
		out.clear();
		fs_writer.execute(request,response,"report_yearly",fsTRXMYearlyBean.iteratorElements());		
	} else {
		out.clear();
		fs_writer.process(request,response,"report_yearly",fsLabel.getText("recordnotfound","Records not found"));		
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
