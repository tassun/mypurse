package com.fs.bean;

/*
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: TRXMReportBean.java
 * Description: TRXMReportBean class implements for handle  schema bean.
 * Version: $Revision$
 * Creation date: Sun Sep 03 09:41:26 ICT 2017
 */
/**
 * TRXMReportBean class implements for handle schema bean.
 */
import com.fs.bean.gener.*;
import com.fs.bean.util.*;
import com.fs.bean.misc.*;
public class TRXMReportBean extends BeanSchema {

	public TRXMReportBean() {
		super();
	}
	protected void initialize() {
		super.initialize();
		addSchema("fromdate",java.sql.Types.DATE,"fromdate");
		addSchema("todate",java.sql.Types.DATE,"todate");
		addSchema("cdrefdate",java.sql.Types.DATE,"cdrefdate");
		addSchema("userid",java.sql.Types.VARCHAR,"userid");
		addSchema("account",java.sql.Types.VARCHAR,"account");
		addSchema("amt",java.sql.Types.DECIMAL,"amt");
		addSchema("dnamt",java.sql.Types.DECIMAL,"dnamt");
		addSchema("cnamt",java.sql.Types.DECIMAL,"cnamt");
		addSchema("remark",java.sql.Types.VARCHAR,"remark");
		addSchema("monthly",java.sql.Types.VARCHAR,"monthly");
		addSchema("yearly",java.sql.Types.VARCHAR,"yearly");
		addSchema("monthyear",java.sql.Types.VARCHAR,"monthyear");
		addSchema("examt",java.sql.Types.DECIMAL,"examt");
		addSchema("exdnamt",java.sql.Types.DECIMAL,"exdnamt");
		addSchema("excnamt",java.sql.Types.DECIMAL,"excnamt");
	}
	public String getFromdate() {
		return getMember("fromdate");
	}
	public void setFromdate(String newFromdate) {
		setMember("fromdate",newFromdate);
	}
	public String getTodate() {
		return getMember("todate");
	}
	public void setTodate(String newTodate) {
		setMember("todate",newTodate);
	}
	public String getCdrefdate() {
		return getMember("cdrefdate");
	}
	public void setCdrefdate(String newCdrefdate) {
		setMember("cdrefdate",newCdrefdate);
	}
	public String getUserid() {
		return getMember("userid");
	}
	public void setUserid(String newUserid) {
		setMember("userid",newUserid);
	}
	public String getAccount() {
		return getMember("account");
	}
	public void setAccount(String newAccount) {
		setMember("account",newAccount);
	}
	public String getAmt() {
		return getMember("amt");
	}
	public void setAmt(String newAmt) {
		setMember("amt",newAmt);
	}
	public String getDnamt() {
		return getMember("dnamt");
	}
	public void setDnamt(String newDnamt) {
		setMember("dnamt",newDnamt);
	}
	public String getCnamt() {
		return getMember("cnamt");
	}
	public void setCnamt(String newCnamt) {
		setMember("cnamt",newCnamt);
	}
	public String getRemark() {
		return getMember("remark");
	}
	public void setRemark(String newRemark) {
		setMember("remark",newRemark);
	}
	public String getMonthly() {
		return getMember("monthly");
	}
	public void setMonthly(String newMonthly) {
		setMember("monthly",newMonthly);
	}
	public String getYearly() {
		return getMember("yearly");
	}
	public void setYearly(String newYearly) {
		setMember("yearly",newYearly);
	}
	public String getMonthyear() {
		return getMember("monthyear");
	}
	public void setMonthyear(String newMonthyear) {
		setMember("monthyear",newMonthyear);
	}
	public String getExamt() {
		return getMember("examt");
	}
	public void setExamt(String newAmt) {
		setMember("examt",newAmt);
	}
	public String getExdnamt() {
		return getMember("exdnamt");
	}
	public void setExdnamt(String newDnamt) {
		setMember("exdnamt",newDnamt);
	}
	public String getExcnamt() {
		return getMember("excnamt");
	}
	public void setExcnamt(String newCnamt) {
		setMember("excnamt",newCnamt);
	}
}
