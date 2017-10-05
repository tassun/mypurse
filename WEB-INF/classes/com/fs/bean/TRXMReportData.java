package com.fs.bean;
/*
 * SCCS id: $Id$
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: TRXMReportData.java
 * Description: TRXMReportData class implements for handle trxm data base schema.
 * Version: $Revision$
 * Creation date: Sun Sep 03 09:44:27 ICT 2017
 */
/**
 * TRXMReportData class implements for handle trxm data base schema.
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
public class TRXMReportData extends BeanData {
//#defined & declaration the real thing
//#(20000) programmer code begin;
//#(20000) programmer code end;
public TRXMReportData() {
	super();
}
protected void initialize() {
	super.initialize();
	setTable("trxm");
	addSchema("cdrefdate",java.sql.Types.DATE);
	addSchema("userid",java.sql.Types.VARCHAR);
	addSchema("account",java.sql.Types.VARCHAR);
	addSchema("amt",java.sql.Types.DECIMAL);
	addSchema("dnamt",java.sql.Types.DECIMAL);
	addSchema("cnamt",java.sql.Types.DECIMAL);
	addSchema("remark",java.sql.Types.VARCHAR);
	map("amt","amt");
	map("cdrefdate","cdrefdate");
	map("userid","userid");
	map("remark","remark");
	map("account","account");
	map("dnamt","dnamt");
	map("cnamt","cnamt");
	//#intialize how deep is your love 
	//#(30000) programmer code begin;
	addSchema("fromdate",java.sql.Types.DATE,true);
	addSchema("todate",java.sql.Types.DATE,true);
	addSchema("monthly",java.sql.Types.CHAR,true);
	addSchema("yearly",java.sql.Types.CHAR,true);
	addSchema("monthyear",java.sql.Types.CHAR,true);
	map("fromdate","fromdate");
	map("todate","todate");
	map("monthly","monthly");
	map("yearly","yearly");
	map("monthyear","monthyear");
	//#(30000) programmer code end;
}
public String fetchVersion() {
	return super.fetchVersion()+TRXMReportData.class+"=$Revision$\n";
}
public Date getCdrefdate() {
	return getDate("cdrefdate");
}
public void setCdrefdate(Date newCdrefdate) {
	setMember("cdrefdate",newCdrefdate);
}
public String getUserid() {
	return getString("userid");
}
public void setUserid(String newUserid) {
	setMember("userid",newUserid);
}
public String getAccount() {
	return getString("account");
}
public void setAccount(String newAccount) {
	setMember("account",newAccount);
}
public BigDecimal getAmt() {
	return getBigDecimal("amt");
}
public void setAmt(BigDecimal newAmt) {
	setMember("amt",newAmt);
}
public BigDecimal getDnamt() {
	return getBigDecimal("dnamt");
}
public void setDnamt(BigDecimal newDnamt) {
	setMember("dnamt",newDnamt);
}
public BigDecimal getCnamt() {
	return getBigDecimal("cnamt");
}
public void setCnamt(BigDecimal newCnamt) {
	setMember("cnamt",newCnamt);
}
public String getRemark() {
	return getString("remark");
}
public void setRemark(String newRemark) {
	setMember("remark",newRemark);
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
public String getMonthly() {
	return getString("monthly");
}
public void setMonthly(String newMonthly) {
	setMember("monthly",newMonthly);
}
public String getYearly() {
	return getString("yearly");
}
public void setYearly(String newYearly) {
	setMember("yearly",newYearly);
}
public String getMonthyear() {
	return getString("monthyear");
}
public void setMonthyear(String newMonthyear) {
	setMember("monthyear",newMonthyear);
}
public boolean obtain(BeanSchemaInterface bean) throws Exception {
	if(bean==null) return super.obtain(bean);
	setCdrefdate(bean.getFieldByName(mapper("cdrefdate")).asDate());
	setUserid(bean.getFieldByName(mapper("userid")).asString());
	setAccount(bean.getFieldByName(mapper("account")).asString());
	setAmt(bean.getFieldByName(mapper("amt")).asBigDecimal());
	setDnamt(bean.getFieldByName(mapper("dnamt")).asBigDecimal());
	setCnamt(bean.getFieldByName(mapper("cnamt")).asBigDecimal());
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
	setUserid(rs.getString("userid"));
	setAccount(rs.getString("account"));
	setAmt(stringToBigDecimal(rs.getString("amt")));
	setDnamt(stringToBigDecimal(rs.getString("dnamt")));
	setCnamt(stringToBigDecimal(rs.getString("cnamt")));
	setRemark(rs.getString("remark"));
	//#fetching other result desire
	//#(60000) programmer code begin;
	//#(60000) programmer code end;
}
public int retrieve(java.sql.Connection connection,java.sql.Connection centerConnection,java.sql.Connection globalConnection,java.util.Map transientVar) throws Exception {
	setKeyField("cdrefdate");
	setKeyField("userid");
	//#statement shake it up retrieving
	//#(165000) programmer code begin;
	removeAlls();
	//#(165000) programmer code end;
	ExecuteStatement sql = createQueryForRetrieve(connection);
	//#any retrieve statement too close
	//#(170000) programmer code begin;
	sql.clear();
	sql.append("select year(cdrefdate) yearly,month(cdrefdate) monthly,sum(amt) as amt,sum(dnamt) as dnamt,sum(cnamt) as cnamt ");
	sql.append("from trxm ");
	sql.append("where userid = ?userid ");
	if(getFromdate()!=null) {
		sql.append("and cdrefdate >= ?fromdate ");
		sql.setParameter("fromdate",getFromdate());
	}
	if(getTodate()!=null) {
		sql.append("and cdrefdate <= ?todate ");
		sql.setParameter("todate",getTodate());
	}
	sql.setParameter("userid",getUserid());
	sql.append("group by yearly,monthly ");
	sql.append("order by yearly,monthly ");
	//#(170000) programmer code end;
	//#assigned parameters make it happen
	//#(180000) programmer code begin;
	//#(180000) programmer code end;
	int result = 0;
	java.sql.ResultSet rs = sql.executeQuery(connection);
	while(rs.next()) {
		result++;
		//#any result fetching fool again
		//#(220000) programmer code begin;
		String month = rs.getString("monthly");
		if(month==null) month = "";
		TRXMReportData aTRXMReportData = new TRXMReportData();
		aTRXMReportData.setYearly(rs.getString("yearly"));
		aTRXMReportData.setMonthly(month.length()==1?"0"+month:month);
		aTRXMReportData.setMonthyear(aTRXMReportData.getYearly()+"-"+aTRXMReportData.getMonthly());
		aTRXMReportData.setAmt(stringToBigDecimal(rs.getString("amt")));
		aTRXMReportData.setDnamt(stringToBigDecimal(rs.getString("dnamt")));
		aTRXMReportData.setCnamt(stringToBigDecimal(rs.getString("cnamt")));
		add(aTRXMReportData);
		//#(220000) programmer code end;
	}
	//#after fetching result set lovin each day
	//#(230000) programmer code begin;
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
	sql.append(" where userid = ?userid ");
	if(getFromdate()!=null) {
		sql.append("and cdrefdate >= ?fromdate ");
		sql.setParameter("fromdate",getFromdate());
	}
	if(getTodate()!=null) {
		sql.append("and cdrefdate <= ?todate ");
		sql.setParameter("todate",getTodate());
	}
	sql.setParameter("userid",getUserid());
	sql.append("order by cdrefdate ");
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
		TRXMReportData aTRXMReportData = new TRXMReportData();
		aTRXMReportData.fetchResult(rs);
		add(aTRXMReportData);
		//#addon statement if you come back
		//#(90000) programmer code begin;
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
public int process(java.sql.Connection connection,java.sql.Connection centerConnection,java.sql.Connection globalConnection,java.util.Map<String, Object> transientVar, String action) throws Exception {
	if("search".equals(action)) {
		return search(connection,centerConnection,globalConnection,transientVar);
	}
	return 0;
}
public int search(java.sql.Connection connection,java.sql.Connection centerConnection,java.sql.Connection globalConnection,java.util.Map transientVar) throws Exception {
	removeAlls();
	ExecuteStatement sql = new KnSQL(this);
	sql.append("select year(cdrefdate) yearly,sum(amt) as amt,sum(dnamt) as dnamt,sum(cnamt) as cnamt ");
	sql.append("from trxm ");
	sql.append("where userid = ?userid ");
	if(getFromdate()!=null) {
		sql.append("and cdrefdate >= ?fromdate ");
		sql.setParameter("fromdate",getFromdate());
	}
	if(getTodate()!=null) {
		sql.append("and cdrefdate <= ?todate ");
		sql.setParameter("todate",getTodate());
	}
	sql.setParameter("userid",getUserid());
	sql.append("group by yearly ");
	sql.append("order by yearly ");
	int result = 0;
	java.sql.ResultSet rs = sql.executeQuery(connection);
	while(rs.next()) {
		result++;
		TRXMReportData aTRXMReportData = new TRXMReportData();
		aTRXMReportData.setYearly(rs.getString("yearly"));
		aTRXMReportData.setAmt(stringToBigDecimal(rs.getString("amt")));
		aTRXMReportData.setDnamt(stringToBigDecimal(rs.getString("dnamt")));
		aTRXMReportData.setCnamt(stringToBigDecimal(rs.getString("cnamt")));
		add(aTRXMReportData);
	}
	close(rs);
	return result;
}
//#(100000) programmer code end;
}
