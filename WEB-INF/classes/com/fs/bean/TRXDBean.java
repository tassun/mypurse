package com.fs.bean;

/*
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: TRXDBean.java
 * Description: TRXDBean class implements for handle  schema bean.
 * Version: $Revision$
 * Creation date: Sun Sep 03 09:41:32 ICT 2017
 */
/**
 * TRXDBean class implements for handle schema bean.
 */
import com.fs.bean.gener.*;
import com.fs.bean.util.*;
import com.fs.bean.misc.*;
public class TRXDBean extends BeanSchema {

	public TRXDBean() {
		super();
	}
	protected void initialize() {
		super.initialize();
		addSchema("fromdate",java.sql.Types.DATE,"fromdate");
		addSchema("todate",java.sql.Types.DATE,"todate");
		addSchema("cdrefdate",java.sql.Types.DATE,"cdrefdate");
		addSchema("cdcode",java.sql.Types.VARCHAR,"cdcode");
		addSchema("userid",java.sql.Types.VARCHAR,"userid");
		addSchema("cdseqno",java.sql.Types.INTEGER,"cdseqno");
		addSchema("amt",java.sql.Types.DECIMAL,"amt");
		addSchema("remark",java.sql.Types.VARCHAR,"remark");
		addSchema("editdate",java.sql.Types.DATE,"editdate");
		addSchema("edittime",java.sql.Types.TIME,"edittime");
		addSchema("cdtype",java.sql.Types.VARCHAR,"cdtype");
		addSchema("cdname",java.sql.Types.VARCHAR,"cdname");
		addSchema("oldcdcode",java.sql.Types.VARCHAR,"oldcdcode");
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
	public String getCdseqno() {
		return getMember("cdseqno");
	}
	public void setCdseqno(String newCdseqno) {
		setMember("cdseqno",newCdseqno);
	}
	public String getAmt() {
		return getMember("amt");
	}
	public void setAmt(String newAmt) {
		setMember("amt",newAmt);
	}
	public String getRemark() {
		return getMember("remark");
	}
	public void setRemark(String newRemark) {
		setMember("remark",newRemark);
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
	public String getOldcdcode() {
		return getMember("oldcdcode");
	}
	public void setOldcdcode(String newOldcdcode) {
		setMember("oldcdcode",newOldcdcode);
	}
}
