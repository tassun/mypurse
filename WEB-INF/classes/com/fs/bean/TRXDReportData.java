package com.fs.bean;
/*
 * SCCS id: $Id$
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: TRXDReportData.java
 * Description: TRXDReportData class implements for handle trxd data base schema.
 * Version: $Revision$
 * Creation date: Sun Sep 03 09:44:48 ICT 2017
 */
/**
 * TRXDReportData class implements for handle trxd data base schema.
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
public class TRXDReportData extends BeanData {
//#defined & declaration the real thing
//#(20000) programmer code begin;
//#(20000) programmer code end;
public TRXDReportData() {
	super();
}
protected void initialize() {
	super.initialize();
	setTable("trxd");
	addSchema("cdrefdate",java.sql.Types.DATE);
	addSchema("cdcode",java.sql.Types.VARCHAR);
	addSchema("userid",java.sql.Types.VARCHAR);
	addSchema("amt",java.sql.Types.DECIMAL);
	addSchema("remark",java.sql.Types.VARCHAR);
	map("userid","userid");
	map("cdrefdate","cdrefdate");
	map("cdcode","cdcode");
	map("remark","remark");
	map("amt","amt");
	//#intialize how deep is your love 
	//#(30000) programmer code begin;
	addSchema("fromdate",java.sql.Types.DATE,true);
	addSchema("todate",java.sql.Types.DATE,true);
	addSchema("cdtype",java.sql.Types.VARCHAR,true);
	addSchema("cdname",java.sql.Types.VARCHAR,true);
	map("fromdate","fromdate");
	map("todate","todate");
	map("cdtype","cdtype");
	map("cdname","cdname");
	//#(30000) programmer code end;
}
public String fetchVersion() {
	return super.fetchVersion()+TRXDReportData.class+"=$Revision$\n";
}
public Date getCdrefdate() {
	return getDate("cdrefdate");
}
public void setCdrefdate(Date newCdrefdate) {
	setMember("cdrefdate",newCdrefdate);
}
public String getCdcode() {
	return getString("cdcode");
}
public void setCdcode(String newCdcode) {
	setMember("cdcode",newCdcode);
}
public String getUserid() {
	return getString("userid");
}
public void setUserid(String newUserid) {
	setMember("userid",newUserid);
}
public BigDecimal getAmt() {
	return getBigDecimal("amt");
}
public void setAmt(BigDecimal newAmt) {
	setMember("amt",newAmt);
}
public String getRemark() {
	return getString("remark");
}
public void setRemark(String newRemark) {
	setMember("remark",newRemark);
}
public String getCdtype() {
	return getString("cdtype");
}
public void setCdtype(String newCdtype) {
	setMember("cdtype",newCdtype);
}
public String getCdname() {
	return getString("cdname");
}
public void setCdname(String newCdname) {
	setMember("cdname",newCdname);
}
public Date getFromdate() {
	return getDate("fromdate");
}
public void setFromdate(Date newFromdate) {
	setMember("fromdate",newFromdate);
}
public Date getTodate() {
	return getDate("todate");
}
public void setTodate(Date newTodate) {
	setMember("todate",newTodate);
}
public boolean obtain(BeanSchemaInterface bean) throws Exception {
	if(bean==null) return super.obtain(bean);
	setCdrefdate(bean.getFieldByName(mapper("cdrefdate")).asDate());
	setCdcode(bean.getFieldByName(mapper("cdcode")).asString());
	setUserid(bean.getFieldByName(mapper("userid")).asString());
	setAmt(bean.getFieldByName(mapper("amt")).asBigDecimal());
	setRemark(bean.getFieldByName(mapper("remark")).asString());
	//#obtain it perfect moment
	//#(40000) programmer code begin;
	setFromdate(bean.getFieldByName(mapper("fromdate")).asDate());
	setTodate(bean.getFieldByName(mapper("todate")).asDate());
	//#(40000) programmer code end;
	return super.obtain(bean);
}
public void fetchResult(java.sql.ResultSet rs) throws java.sql.SQLException {
	super.fetchResult(rs);
	setCdrefdate(rs.getDate("cdrefdate"));
	setCdcode(rs.getString("cdcode"));
	setUserid(rs.getString("userid"));
	setAmt(stringToBigDecimal(rs.getString("amt")));
	setRemark(rs.getString("remark"));
	//#fetching other result desire
	//#(60000) programmer code begin;
	//#(60000) programmer code end;
}
public int retrieve(java.sql.Connection connection,java.sql.Connection centerConnection,java.sql.Connection globalConnection,java.util.Map transientVar) throws Exception {
	setKeyField("cdrefdate");
	setKeyField("cdcode");
	setKeyField("userid");
	//#statement shake it up retrieving
	//#(165000) programmer code begin;
	removeAlls();
	//#(165000) programmer code end;
	ExecuteStatement sql = createQueryForRetrieve(connection);
	//#any retrieve statement too close
	//#(170000) programmer code begin;
	sql.clear();
	sql.append("select trxd.cdrefdate,trxd.amt,trxd.cdcode,trxd.userid,trxd.remark,trxp.cdtype,trxp.cdname ");
	sql.append("from trxd,trxp ");
	sql.append("where trxd.cdcode = ?cdcode ");
	sql.append("and trxd.userid = ?userid ");
	if(getFromdate()!=null) {
		sql.append("and trxd.cdrefdate >= ?fromdate ");
		sql.setParameter("fromdate",getFromdate());
	}
	if(getTodate()!=null) {
		sql.append("and trxd.cdrefdate <= ?todate ");
		sql.setParameter("todate",getTodate());
	}
	sql.append("and trxd.cdcode = trxp.cdcode ");
	sql.setParameter("userid",getUserid());
	sql.setParameter("cdcode",getCdcode());
	//#(170000) programmer code end;
	//#assigned parameters make it happen
	//#(180000) programmer code begin;
	String cdtype = "";
	String cdcode = "";
	String cdname = "";
	//#(180000) programmer code end;
	int result = 0;
	java.sql.ResultSet rs = sql.executeQuery(connection);
	while(rs.next()) {
		result++;
		//#any result fetching fool again
		//#(220000) programmer code begin;
		TRXDReportData aTRXDReportData = new TRXDReportData();
		aTRXDReportData.fetchResult(rs);
		add(aTRXDReportData);
		cdtype = rs.getString("cdtype");
		cdcode = rs.getString("cdcode");
		cdname = rs.getString("cdname");
		aTRXDReportData.setCdtype(cdtype);
		aTRXDReportData.setCdname(cdname);
		//#(220000) programmer code end;
	}
	//#after fetching result set lovin each day
	//#(230000) programmer code begin;
	setCdtype(cdtype);
	setCdcode(cdcode);
	setCdname(cdname);
	//#(230000) programmer code end;
	close(rs);
	return result;
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
	sql.append("select trxd.cdcode,sum(trxd.amt) as amt,trxp.cdname,trxp.cdtype ");
	sql.append("from trxd,trxp ");
	sql.append("where trxd.userid = ?userid ");
	sql.setParameter("userid",getUserid());
	if(getFromdate()!=null) {
		sql.append("and trxd.cdrefdate >= ?fromdate ");
		sql.setParameter("fromdate",getFromdate());
	}
	if(getTodate()!=null) {
		sql.append("and trxd.cdrefdate <= ?todate ");
		sql.setParameter("todate",getTodate());
	}
	sql.append("and trxd.cdcode = trxp.cdcode ");
	sql.append("group by cdcode,cdname,cdtype ");
	sql.append("order by cdcode ");
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
		TRXDReportData aTRXDReportData = new TRXDReportData();
		add(aTRXDReportData);
		//#addon statement if you come back
		//#(90000) programmer code begin;
		aTRXDReportData.setCdcode(rs.getString("cdcode"));
		aTRXDReportData.setAmt(stringToBigDecimal(rs.getString("amt")));
		aTRXDReportData.setCdtype(rs.getString("cdtype"));
		aTRXDReportData.setCdname(rs.getString("cdname"));
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
