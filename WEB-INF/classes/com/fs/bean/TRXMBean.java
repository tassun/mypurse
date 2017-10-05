package com.fs.bean;

/*
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: TRXMBean.java
 * Description: TRXMBean class implements for handle  schema bean.
 * Version: $Revision$
 * Creation date: Sun Sep 03 09:41:26 ICT 2017
 */
/**
 * TRXMBean class implements for handle schema bean.
 */
import com.fs.bean.gener.*;
import com.fs.bean.util.*;
import com.fs.bean.misc.*;
public class TRXMBean extends BeanSchema {

	public TRXMBean() {
		super();
	}
	protected void initialize() {
		super.initialize();
		addSchema("cdrefdate",java.sql.Types.DATE,"cdrefdate");
		addSchema("userid",java.sql.Types.VARCHAR,"userid");
		addSchema("account",java.sql.Types.VARCHAR,"account");
		addSchema("amt",java.sql.Types.DECIMAL,"amt");
		addSchema("dnamt",java.sql.Types.DECIMAL,"dnamt");
		addSchema("cnamt",java.sql.Types.DECIMAL,"cnamt");
		addSchema("editdate",java.sql.Types.DATE,"editdate");
		addSchema("edittime",java.sql.Types.TIME,"edittime");
		addSchema("remark",java.sql.Types.VARCHAR,"remark");
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
	public String getEditdate() {
		return getMember("editdate");
	}
	public void setEditdate(String newEditdate) {
		setMember("editdate",newEditdate);
	}
	public String getEdittime() {
		return getMember("edittime");
	}
	public void setEdittime(String newEdittime) {
		setMember("edittime",newEdittime);
	}
	public String getRemark() {
		return getMember("remark");
	}
	public void setRemark(String newRemark) {
		setMember("remark",newRemark);
	}
}
