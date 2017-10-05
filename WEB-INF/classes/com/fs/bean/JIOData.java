package com.fs.bean;
/*
 * SCCS id: $Id$
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: JIOData.java
 * Description: JIOData class implements for handle jinout data base schema.
 * Version: $Revision$
 * Creation date: Sun Sep 10 10:12:37 ICT 2017
 */
/**
 * JIOData class implements for handle jinout data base schema.
 */
import com.fs.bean.ctrl.*;
import com.fs.bean.gener.*;
import com.fs.bean.util.*;
import com.fs.bean.misc.*;
import java.math.*;
import java.sql.*;
//#import anything for you
//#(10000) programmer code begin;
//#(10000) programmer code end;
public class JIOData extends BeanData {
//#defined & declaration the real thing
//#(20000) programmer code begin;
private BeanUtility butil = new BeanUtility();
//#(20000) programmer code end;
public JIOData() {
	super();
}
protected void initialize() {
	super.initialize();
	setTable("jinout");
	addSchema("userid",java.sql.Types.VARCHAR);
	addSchema("logintime",java.sql.Types.TIMESTAMP);
	addSchema("logouttime",java.sql.Types.TIMESTAMP);
	addSchema("address",java.sql.Types.VARCHAR);
	addSchema("session",java.sql.Types.VARCHAR);
	addSchema("browseragent",java.sql.Types.VARCHAR);
	addSchema("browsername",java.sql.Types.VARCHAR);
	addSchema("browserversion",java.sql.Types.VARCHAR);
	addSchema("osname",java.sql.Types.VARCHAR);
	addSchema("typename",java.sql.Types.VARCHAR);
	addSchema("devicename",java.sql.Types.VARCHAR);
	addSchema("familyname",java.sql.Types.VARCHAR);
	addSchema("producername",java.sql.Types.VARCHAR);
	map("producername","producername");
	map("osname","osname");
	map("logouttime","logouttime");
	map("browserversion","browserversion");
	map("devicename","devicename");
	map("browsername","browsername");
	map("browseragent","browseragent");
	map("typename","typename");
	map("logseqno","logseqno");
	map("userid","userid");
	map("logintime","logintime");
	map("session","session");
	map("address","address");
	map("familyname","familyname");
	//#intialize how deep is your love 
	//#(30000) programmer code begin;
	addSchema("todate",java.sql.Types.DATE,true);
	addSchema("fromdate",java.sql.Types.DATE,true);
	addSchema("usertname",java.sql.Types.CHAR,true);
	addSchema("usertsurname",java.sql.Types.CHAR,true);
	addSchema("email",java.sql.Types.VARCHAR,true);
	addSchema("mobile",java.sql.Types.VARCHAR,true);
	map("fromdate","fromdate");
	map("todate","todate");
	map("usertname","usertname");
	map("usertsurname","usertsurname");
	map("email","email");
	map("mobile","mobile");
	//#(30000) programmer code end;
}
public String fetchVersion() {
	return super.fetchVersion()+JIOData.class+"=$Revision$\n";
}
public String getUserid() {
	return getString("userid");
}
public void setUserid(String newUserid) {
	setMember("userid",newUserid);
}
public Timestamp getLogintime() {
	return getTimestamp("logintime");
}
public void setLogintime(Timestamp newLogintime) {
	setMember("logintime",newLogintime);
}
public Timestamp getLogouttime() {
	return getTimestamp("logouttime");
}
public void setLogouttime(Timestamp newLogouttime) {
	setMember("logouttime",newLogouttime);
}
public String getAddress() {
	return getString("address");
}
public void setAddress(String newAddress) {
	setMember("address",newAddress);
}
public String getSession() {
	return getString("session");
}
public void setSession(String newSession) {
	setMember("session",newSession);
}
public String getBrowseragent() {
	return getString("browseragent");
}
public void setBrowseragent(String newBrowseragent) {
	setMember("browseragent",newBrowseragent);
}
public String getBrowsername() {
	return getString("browsername");
}
public void setBrowsername(String newBrowsername) {
	setMember("browsername",newBrowsername);
}
public String getBrowserversion() {
	return getString("browserversion");
}
public void setBrowserversion(String newBrowserversion) {
	setMember("browserversion",newBrowserversion);
}
public String getOsname() {
	return getString("osname");
}
public void setOsname(String newOsname) {
	setMember("osname",newOsname);
}
public String getTypename() {
	return getString("typename");
}
public void setTypename(String newTypename) {
	setMember("typename",newTypename);
}
public String getDevicename() {
	return getString("devicename");
}
public void setDevicename(String newDevicename) {
	setMember("devicename",newDevicename);
}
public String getFamilyname() {
	return getString("familyname");
}
public void setFamilyname(String newFamilyname) {
	setMember("familyname",newFamilyname);
}
public String getProducername() {
	return getString("producername");
}
public void setProducername(String newProducername) {
	setMember("producername",newProducername);
}
public Date getTodate() {
	return getDate("todate");
}
public void setTodate(Date newTodate) {
	setMember("todate",newTodate);
}
public Date getFromdate() {
	return getDate("fromdate");
}
public void setFromdate(Date newFromdate) {
	setMember("fromdate",newFromdate);
}
public String getUsertname() {
	return getString("usertname");
}
public void setUsertname(String newUsertname) {
	setMember("usertname",newUsertname);
}
public String getUsertsurname() {
	return getString("usertsurname");
}
public void setUsertsurname(String newUsertsurname) {
	setMember("usertsurname",newUsertsurname);
}
public String getEmail() {
	return getString("email");
}
public void setEmail(String newEmail) {
	setMember("email",newEmail);
}
public String getMobile() {
	return getString("mobile");
}
public void setMobile(String newMobile) {
	setMember("mobile",newMobile);
}
public boolean obtain(BeanSchemaInterface bean) throws Exception {
	if(bean==null) return super.obtain(bean);
	setUserid(bean.getFieldByName(mapper("userid")).asString());
	setLogintime(bean.getFieldByName(mapper("logintime")).asTimestamp());
	setLogouttime(bean.getFieldByName(mapper("logouttime")).asTimestamp());
	setAddress(bean.getFieldByName(mapper("address")).asString());
	setSession(bean.getFieldByName(mapper("session")).asString());
	setBrowseragent(bean.getFieldByName(mapper("browseragent")).asString());
	setBrowsername(bean.getFieldByName(mapper("browsername")).asString());
	setBrowserversion(bean.getFieldByName(mapper("browserversion")).asString());
	setOsname(bean.getFieldByName(mapper("osname")).asString());
	setTypename(bean.getFieldByName(mapper("typename")).asString());
	setDevicename(bean.getFieldByName(mapper("devicename")).asString());
	setFamilyname(bean.getFieldByName(mapper("familyname")).asString());
	setProducername(bean.getFieldByName(mapper("producername")).asString());
	//#obtain it perfect moment
	//#(40000) programmer code begin;
	setFromdate(bean.getFieldByName(mapper("fromdate")).asDate());
	setTodate(bean.getFieldByName(mapper("todate")).asDate());
	//#(40000) programmer code end;
	return super.obtain(bean);
}
public void fetchResult(java.sql.ResultSet rs) throws java.sql.SQLException {
	super.fetchResult(rs);
	setUserid(rs.getString("userid"));
	setLogintime(rs.getTimestamp("logintime"));
	setLogouttime(rs.getTimestamp("logouttime"));
	setAddress(rs.getString("address"));
	setSession(rs.getString("session"));
	setBrowseragent(rs.getString("browseragent"));
	setBrowsername(rs.getString("browsername"));
	setBrowserversion(rs.getString("browserversion"));
	setOsname(rs.getString("osname"));
	setTypename(rs.getString("typename"));
	setDevicename(rs.getString("devicename"));
	setFamilyname(rs.getString("familyname"));
	setProducername(rs.getString("producername"));
	//#fetching other result desire
	//#(60000) programmer code begin;
	//#(60000) programmer code end;
}
protected void assignParameters(ExecuteStatement sql) throws Exception {
	if(sql==null) return;
	//#Everything I do, I do it for you
	//#(75000) programmer code begin;
	//#(75000) programmer code end;
	sql.setParameter("userid",getUserid());
	sql.setParameter("logintime",getLogintime());
	sql.setParameter("logouttime",getLogouttime());
	sql.setParameter("address",getAddress());
	sql.setParameter("session",getSession());
	sql.setParameter("browseragent",getBrowseragent());
	sql.setParameter("browsername",getBrowsername());
	sql.setParameter("browserversion",getBrowserversion());
	sql.setParameter("osname",getOsname());
	sql.setParameter("typename",getTypename());
	sql.setParameter("devicename",getDevicename());
	sql.setParameter("familyname",getFamilyname());
	sql.setParameter("producername",getProducername());
	//#I'm gonna be around you
	//#(77000) programmer code begin;
	//#(77000) programmer code end;
}
public int collect(java.sql.Connection connection,java.sql.Connection centerConnection,java.sql.Connection globalConnection,java.util.Map transientVar) throws Exception {
	removeAlls();
	PermissionBean fsPermission = global==null?null:global.getPermission();
	//#here we go to the collection
	//#(65000) programmer code begin;
	//#(65000) programmer code end;
	ExecuteStatement sql = createQueryForCollect(connection);
	//#any collect statement would you be happier
	//#(70000) programmer code begin;
	sql.clear();
	sql.append("select jinout.*,tuser.usertname,tuser.usertsurname,tuser.email,tuser.mobile ");
	sql.append("from jinout ");
	sql.append("left join tuser on tuser.userid = jinout.userid ");
	sql.append("where jinout.userid is not null ");
	if(getUserid()!=null && (getUserid().trim().length()>0)) {
		sql.append("and jinout.userid LIKE ?userid ");
		sql.setParameter("userid",getUserid()+"%");
	}
	if(getFromdate()!=null) {
		sql.append("and jinout.logintime >= ?fromdate ");
		sql.setParameter("fromdate",new java.sql.Timestamp(getFromdate().getTime()));
	}
	if(getTodate()!=null) {
		java.util.Date todate = butil.rollingDate(getTodate(),0,0,0,23,59,59);
		sql.append("and jinout.logintime <= ?todate ");
		sql.setParameter("todate",new java.sql.Timestamp(todate.getTime()));
	}
	sql.append(" order by userid,logintime desc ");
	//#(70000) programmer code end;
	//#assigned parameters this temptation
	//#(80000) programmer code begin;
	//#(80000) programmer code end;
	int result = 0;
	java.sql.ResultSet rs = sql.executeQuery(connection);
	while(rs.next()) {
		result++;
		//#addon statement if you come back
		//#(85000) programmer code begin;
		//#(85000) programmer code end;
		JIOData aJIOData = new JIOData();
		aJIOData.fetchResult(rs);
		add(aJIOData);
		//#addon statement if you come back
		//#(90000) programmer code begin;
		aJIOData.setUsertname(rs.getString("usertname"));
		aJIOData.setUsertsurname(rs.getString("usertsurname"));
		aJIOData.setEmail(rs.getString("email"));
		aJIOData.setMobile(rs.getString("mobile"));
		//#(90000) programmer code end;
	}
	//#after scraping result set in too deep
	//#(240000) programmer code begin;
	//#(240000) programmer code end;
	close(rs);
	return result;
}
//#another methods defined drive you crazy
//#(100000) programmer code begin;
//#(100000) programmer code end;
}
