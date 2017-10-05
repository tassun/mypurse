package com.fs.bean;

/*
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: TRegisterBean.java
 * Description: TRegisterBean class implements for handle  schema bean.
 * Version: $Revision$
 * Creation date: Thu Aug 31 10:04:12 ICT 2017
 */
/**
 * TRegisterBean class implements for handle schema bean.
 */
import com.fs.bean.gener.*;
import com.fs.bean.util.*;
import com.fs.bean.misc.*;
public class TRegisterBean extends BeanSchema {

	public TRegisterBean() {
		super();
	}
	protected void initialize() {
		super.initialize();
		addSchema("userid",java.sql.Types.CHAR,"userid");
		addSchema("usertname",java.sql.Types.CHAR,"usertname");
		addSchema("usertsurname",java.sql.Types.CHAR,"usertsurname");
		addSchema("userpassword",java.sql.Types.CHAR,"userpassword");
		addSchema("confirmpassword",java.sql.Types.CHAR,"confirmpassword");
		addSchema("status",java.sql.Types.CHAR,"status");
		addSchema("usertype",java.sql.Types.CHAR,"usertype");
		addSchema("iconfile",java.sql.Types.VARCHAR,"iconfile");
		addSchema("email",java.sql.Types.VARCHAR,"email");
		addSchema("cardid",java.sql.Types.VARCHAR,"cardid");
		addSchema("gender",java.sql.Types.CHAR,"gender");
		addSchema("birthday",java.sql.Types.INTEGER,"birthday");
		addSchema("birthmonth",java.sql.Types.INTEGER,"birthmonth");
		addSchema("birthyear",java.sql.Types.INTEGER,"birthyear");
		addSchema("mobile",java.sql.Types.VARCHAR,"mobile");
		addSchema("address1",java.sql.Types.VARCHAR,"address1");
		addSchema("address2",java.sql.Types.VARCHAR,"address2");
		addSchema("address3",java.sql.Types.VARCHAR,"address3");
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
	public String getUserpassword() {
		return getMember("userpassword");
	}
	public void setUserpassword(String newUserpassword) {
		setMember("userpassword",newUserpassword);
	}
	public String getConfirmpassword() {
		return getMember("confirmpassword");
	}
	public void setConfirmpassword(String newConfirmpassword) {
		setMember("confirmpassword",newConfirmpassword);
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
	public String getBirthmonth() {
		return getMember("birthmonth");
	}
	public void setBirthmonth(String newBirthmonth) {
		setMember("birthmonth",newBirthmonth);
	}
	public String getBirthyear() {
		return getMember("birthyear");
	}
	public void setBirthyear(String newBirthyear) {
		setMember("birthyear",newBirthyear);
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
}
