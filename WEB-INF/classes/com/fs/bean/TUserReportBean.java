package com.fs.bean;

/*
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: TUserReportBean.java
 * Description: TUserReportBean class implements for handle  schema bean.
 * Version: $Revision$
 * Creation date: Thu Aug 31 10:03:27 ICT 2017
 */
/**
 * TUserReportBean class implements for handle schema bean.
 */
import com.fs.bean.gener.*;
import com.fs.bean.util.*;
import com.fs.bean.misc.*;
public class TUserReportBean extends BeanSchema {

	public TUserReportBean() {
		super();
	}
	protected void initialize() {
		super.initialize();
		addSchema("fromdate",java.sql.Types.DATE,"fromdate");
		addSchema("todate",java.sql.Types.DATE,"todate");
		addSchema("userid",java.sql.Types.CHAR,"userid");
		addSchema("usertname",java.sql.Types.CHAR,"usertname");
		addSchema("usertsurname",java.sql.Types.CHAR,"usertsurname");
		addSchema("status",java.sql.Types.CHAR,"status");
		addSchema("usertype",java.sql.Types.CHAR,"usertype");
		addSchema("iconfile",java.sql.Types.VARCHAR,"iconfile");
		addSchema("accessdate",java.sql.Types.DATE,"accessdate");
		addSchema("accesstime",java.sql.Types.TIME,"accesstime");
		addSchema("accesshits",java.sql.Types.BIGINT,"accesshits");
		addSchema("email",java.sql.Types.VARCHAR,"email");
		addSchema("cardid",java.sql.Types.VARCHAR,"cardid");
		addSchema("gender",java.sql.Types.CHAR,"gender");
		addSchema("birthday",java.sql.Types.DATE,"birthday");
		addSchema("mobile",java.sql.Types.VARCHAR,"mobile");
		addSchema("address1",java.sql.Types.VARCHAR,"address1");
		addSchema("address2",java.sql.Types.VARCHAR,"address2");
		addSchema("address3",java.sql.Types.VARCHAR,"address3");
		addSchema("startdate",java.sql.Types.DATE,"startdate");
		addSchema("starttime",java.sql.Types.TIME,"starttime");
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
	public String getUserid() {
		return getMember("userid");
	}
	public void setUserid(String newUserid) {
		setMember("userid",newUserid);
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
	public String getStatus() {
		return getMember("status");
	}
	public void setStatus(String newStatus) {
		setMember("status",newStatus);
	}
	public String getUsertype() {
		return getMember("usertype");
	}
	public void setUsertype(String newUsertype) {
		setMember("usertype",newUsertype);
	}
	public String getIconfile() {
		return getMember("iconfile");
	}
	public void setIconfile(String newIconfile) {
		setMember("iconfile",newIconfile);
	}
	public String getAccessdate() {
		return getMember("accessdate");
	}
	public void setAccessdate(String newAccessdate) {
		setMember("accessdate",newAccessdate);
	}
	public String getAccesstime() {
		return getMember("accesstime");
	}
	public void setAccesstime(String newAccesstime) {
		setMember("accesstime",newAccesstime);
	}
	public String getAccesshits() {
		return getMember("accesshits");
	}
	public void setAccesshits(String newAccesshits) {
		setMember("accesshits",newAccesshits);
	}
	public String getFailtime() {
		return getMember("failtime");
	}
	public void setFailtime(String newFailtime) {
		setMember("failtime",newFailtime);
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
	public String getEmail() {
		return getMember("email");
	}
	public void setEmail(String newEmail) {
		setMember("email",newEmail);
	}
	public String getCardid() {
		return getMember("cardid");
	}
	public void setCardid(String newCardid) {
		setMember("cardid",newCardid);
	}
	public String getGender() {
		return getMember("gender");
	}
	public void setGender(String newGender) {
		setMember("gender",newGender);
	}
	public String getBirthday() {
		return getMember("birthday");
	}
	public void setBirthday(String newBirthday) {
		setMember("birthday",newBirthday);
	}
	public String getMobile() {
		return getMember("mobile");
	}
	public void setMobile(String newMobile) {
		setMember("mobile",newMobile);
	}
	public String getAddress1() {
		return getMember("address1");
	}
	public void setAddress1(String newAddress1) {
		setMember("address1",newAddress1);
	}
	public String getAddress2() {
		return getMember("address2");
	}
	public void setAddress2(String newAddress2) {
		setMember("address2",newAddress2);
	}
	public String getAddress3() {
		return getMember("address3");
	}
	public void setAddress3(String newAddress3) {
		setMember("address3",newAddress3);
	}
	public String getStartdate() {
		return getMember("startdate");
	}
	public void setStartdate(String newStartdate) {
		setMember("startdate",newStartdate);
	}
	public String getStarttime() {
		return getMember("starttime");
	}
	public void setStarttime(String newStarttime) {
		setMember("starttime",newStarttime);
	}
}
