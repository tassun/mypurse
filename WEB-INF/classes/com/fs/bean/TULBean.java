package com.fs.bean;

/*
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: TULBean.java
 * Description: TULBean class implements for handle  schema bean.
 * Version: $Revision$
 * Creation date: Thu Sep 07 17:10:54 ICT 2017
 */
/**
 * TULBean class implements for handle schema bean.
 */
import com.fs.bean.gener.*;
import com.fs.bean.util.*;
import com.fs.bean.misc.*;
public class TULBean extends BeanSchema {

	public TULBean() {
		super();
	}
	protected void initialize() {
		super.initialize();
		addSchema("fromdate",java.sql.Types.DATE,"fromdate");
		addSchema("todate",java.sql.Types.DATE,"todate");
		addSchema("curdate",java.sql.Types.DATE,"curdate");
		addSchema("seqno",java.sql.Types.BIGINT,"seqno");
		addSchema("curtime",java.sql.Types.TIMESTAMP,"curtime");
		addSchema("userid",java.sql.Types.VARCHAR,"userid");
		addSchema("site",java.sql.Types.VARCHAR,"site");
		addSchema("progid",java.sql.Types.VARCHAR,"progid");
		addSchema("action",java.sql.Types.VARCHAR,"action");
		addSchema("remark",java.sql.Types.VARCHAR,"remark");
		addSchema("usertname",java.sql.Types.CHAR,"usertname");
		addSchema("usertsurname",java.sql.Types.CHAR,"usertsurname");
		addSchema("email",java.sql.Types.VARCHAR,"email");
		addSchema("mobile",java.sql.Types.VARCHAR,"mobile");
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
	public String getCurdate() {
		return getMember("curdate");
	}
	public void setCurdate(String newCurdate) {
		setMember("curdate",newCurdate);
	}
	public String getSeqno() {
		return getMember("seqno");
	}
	public void setSeqno(String newSeqno) {
		setMember("seqno",newSeqno);
	}
	public String getCurtime() {
		return getMember("curtime");
	}
	public void setCurtime(String newCurtime) {
		setMember("curtime",newCurtime);
	}
	public String getUserid() {
		return getMember("userid");
	}
	public void setUserid(String newUserid) {
		setMember("userid",newUserid);
	}
	public String getSite() {
		return getMember("site");
	}
	public void setSite(String newSite) {
		setMember("site",newSite);
	}
	public String getProgid() {
		return getMember("progid");
	}
	public void setProgid(String newProgid) {
		setMember("progid",newProgid);
	}
	public String getAction() {
		return getMember("action");
	}
	public void setAction(String newAction) {
		setMember("action",newAction);
	}
	public String getRemark() {
		return getMember("remark");
	}
	public void setRemark(String newRemark) {
		setMember("remark",newRemark);
	}
	public String getUsertname() {
		return getMember("usertname");
	}
	public void setUsertname(String newUsertname) {
		setMember("usertname",newUsertname);
	}
	public String getUsertsurname() {
		return getMember("usertsurname");
	}
	public void setUsertsurname(String newUsertsurname) {
		setMember("usertsurname",newUsertsurname);
	}
	public String getEmail() {
		return getMember("email");
	}
	public void setEmail(String newEmail) {
		setMember("email",newEmail);
	}
	public String getMobile() {
		return getMember("mobile");
	}
	public void setMobile(String newMobile) {
		setMember("mobile",newMobile);
	}
}
