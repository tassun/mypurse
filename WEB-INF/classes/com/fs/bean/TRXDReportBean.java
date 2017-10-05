package com.fs.bean;

/*
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: TRXDReportBean.java
 * Description: TRXDReportBean class implements for handle  schema bean.
 * Version: $Revision$
 * Creation date: Sun Sep 03 09:41:32 ICT 2017
 */
/**
 * TRXDReportBean class implements for handle schema bean.
 */
import com.fs.bean.gener.*;
import com.fs.bean.util.*;
import com.fs.bean.misc.*;
public class TRXDReportBean extends BeanSchema {

	public TRXDReportBean() {
		super();
	}
	protected void initialize() {
		super.initialize();
		addSchema("fromdate",java.sql.Types.DATE,"fromdate");
		addSchema("todate",java.sql.Types.DATE,"todate");
		addSchema("cdrefdate",java.sql.Types.DATE,"cdrefdate");
		addSchema("cdcode",java.sql.Types.VARCHAR,"cdcode");
		addSchema("userid",java.sql.Types.VARCHAR,"userid");
		addSchema("amt",java.sql.Types.DECIMAL,"amt");
		addSchema("cnamt",java.sql.Types.DECIMAL,"cnamt");
		addSchema("dnamt",java.sql.Types.DECIMAL,"dnamt");
		addSchema("remark",java.sql.Types.VARCHAR,"remark");
		addSchema("cdtype",java.sql.Types.VARCHAR,"cdtype");
		addSchema("cdname",java.sql.Types.VARCHAR,"cdname");
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
	public String getCdcode() {
		return getMember("cdcode");
	}
	public void setCdcode(String newCdcode) {
		setMember("cdcode",newCdcode);
	}
	public String getUserid() {
		return getMember("userid");
	}
	public void setUserid(String newUserid) {
		setMember("userid",newUserid);
	}
	public String getAmt() {
		return getMember("amt");
	}
	public void setAmt(String newAmt) {
		setMember("amt",newAmt);
	}
	public String getCnamt() {
		return getMember("cnamt");
	}
	public void setCnamt(String newAmt) {
		setMember("cnamt",newAmt);
	}
	public String getDnamt() {
		return getMember("dnamt");
	}
	public void setDnamt(String newAmt) {
		setMember("dnamt",newAmt);
	}
	public String getRemark() {
		return getMember("remark");
	}
	public void setRemark(String newRemark) {
		setMember("remark",newRemark);
	}
	public String getCdtype() {
		return getMember("cdtype");
	}
	public void setCdtype(String newCdtype) {
		setMember("cdtype",newCdtype);
	}
	public String getCdname() {
		return getMember("cdname");
	}
	public void setCdname(String newCdname) {
		setMember("cdname",newCdname);
	}
}
