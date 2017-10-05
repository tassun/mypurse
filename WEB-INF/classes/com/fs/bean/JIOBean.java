package com.fs.bean;

/*
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: JIOBean.java
 * Description: JIOBean class implements for handle  schema bean.
 * Version: $Revision$
 * Creation date: Sun Sep 10 10:06:42 ICT 2017
 */
/**
 * JIOBean class implements for handle schema bean.
 */
import com.fs.bean.gener.*;
import com.fs.bean.util.*;
import com.fs.bean.misc.*;
public class JIOBean extends BeanSchema {

	public JIOBean() {
		super();
	}
	protected void initialize() {
		super.initialize();
		addSchema("fromdate",java.sql.Types.DATE,"fromdate");
		addSchema("todate",java.sql.Types.DATE,"todate");
		addSchema("userid",java.sql.Types.VARCHAR,"userid");
		addSchema("logintime",java.sql.Types.TIMESTAMP,"logintime");
		addSchema("logouttime",java.sql.Types.TIMESTAMP,"logouttime");
		addSchema("address",java.sql.Types.VARCHAR,"address");
		addSchema("session",java.sql.Types.VARCHAR,"session");
		addSchema("browseragent",java.sql.Types.VARCHAR,"browseragent");
		addSchema("browsername",java.sql.Types.VARCHAR,"browsername");
		addSchema("browserversion",java.sql.Types.VARCHAR,"browserversion");
		addSchema("osname",java.sql.Types.VARCHAR,"osname");
		addSchema("typename",java.sql.Types.VARCHAR,"typename");
		addSchema("devicename",java.sql.Types.VARCHAR,"devicename");
		addSchema("familyname",java.sql.Types.VARCHAR,"familyname");
		addSchema("producername",java.sql.Types.VARCHAR,"producername");
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
	public String getUserid() {
		return getMember("userid");
	}
	public void setUserid(String newUserid) {
		setMember("userid",newUserid);
	}
	public String getLogintime() {
		return getMember("logintime");
	}
	public void setLogintime(String newLogintime) {
		setMember("logintime",newLogintime);
	}
	public String getLogouttime() {
		return getMember("logouttime");
	}
	public void setLogouttime(String newLogouttime) {
		setMember("logouttime",newLogouttime);
	}
	public String getAddress() {
		return getMember("address");
	}
	public void setAddress(String newAddress) {
		setMember("address",newAddress);
	}
	public String getSession() {
		return getMember("session");
	}
	public void setSession(String newSession) {
		setMember("session",newSession);
	}
	public String getBrowseragent() {
		return getMember("browseragent");
	}
	public void setBrowseragent(String newBrowseragent) {
		setMember("browseragent",newBrowseragent);
	}
	public String getBrowsername() {
		return getMember("browsername");
	}
	public void setBrowsername(String newBrowsername) {
		setMember("browsername",newBrowsername);
	}
	public String getBrowserversion() {
		return getMember("browserversion");
	}
	public void setBrowserversion(String newBrowserversion) {
		setMember("browserversion",newBrowserversion);
	}
	public String getOsname() {
		return getMember("osname");
	}
	public void setOsname(String newOsname) {
		setMember("osname",newOsname);
	}
	public String getTypename() {
		return getMember("typename");
	}
	public void setTypename(String newTypename) {
		setMember("typename",newTypename);
	}
	public String getDevicename() {
		return getMember("devicename");
	}
	public void setDevicename(String newDevicename) {
		setMember("devicename",newDevicename);
	}
	public String getFamilyname() {
		return getMember("familyname");
	}
	public void setFamilyname(String newFamilyname) {
		setMember("familyname",newFamilyname);
	}
	public String getProducername() {
		return getMember("producername");
	}
	public void setProducername(String newProducername) {
		setMember("producername",newProducername);
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
