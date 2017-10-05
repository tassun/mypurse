package com.fs.bean;
/*
 * SCCS id: $Id$
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: TRXMData.java
 * Description: TRXMData class implements for handle trxm data base schema.
 * Version: $Revision$
 * Creation date: Sun Sep 03 09:44:27 ICT 2017
 */
/**
 * TRXMData class implements for handle trxm data base schema.
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
public class TRXMData extends BeanData {
//#defined & declaration the real thing
//#(20000) programmer code begin;
//#(20000) programmer code end;
public TRXMData() {
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
	addSchema("editdate",java.sql.Types.DATE);
	addSchema("edittime",java.sql.Types.TIME);
	addSchema("remark",java.sql.Types.VARCHAR);
	map("amt","amt");
	map("cdrefdate","cdrefdate");
	map("edittime","edittime");
	map("editdate","editdate");
	map("userid","userid");
	map("remark","remark");
	map("account","account");
	map("dnamt","dnamt");
	map("cnamt","cnamt");
	//#intialize how deep is your love 
	//#(30000) programmer code begin;
	//#(30000) programmer code end;
}
public String fetchVersion() {
	return super.fetchVersion()+TRXMData.class+"=$Revision$\n";
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
public Date getEditdate() {
	return getDate("editdate");
}
public void setEditdate(Date newEditdate) {
	setMember("editdate",newEditdate);
}
public Time getEdittime() {
	return getTime("edittime");
}
public void setEdittime(Time newEdittime) {
	setMember("edittime",newEdittime);
}
public String getRemark() {
	return getString("remark");
}
public void setRemark(String newRemark) {
	setMember("remark",newRemark);
}
public boolean obtain(BeanSchemaInterface bean) throws Exception {
	if(bean==null) return super.obtain(bean);
	setCdrefdate(bean.getFieldByName(mapper("cdrefdate")).asDate());
	setUserid(bean.getFieldByName(mapper("userid")).asString());
	setAccount(bean.getFieldByName(mapper("account")).asString());
	setAmt(bean.getFieldByName(mapper("amt")).asBigDecimal());
	setDnamt(bean.getFieldByName(mapper("dnamt")).asBigDecimal());
	setCnamt(bean.getFieldByName(mapper("cnamt")).asBigDecimal());
	setEditdate(bean.getFieldByName(mapper("editdate")).asDate());
	setEdittime(bean.getFieldByName(mapper("edittime")).asTime());
	setRemark(bean.getFieldByName(mapper("remark")).asString());
	//#obtain it perfect moment
	//#(40000) programmer code begin;
	if(getAccount()==null || getAccount().trim().length()<=0) setAccount(getUserid());
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
	setEditdate(rs.getDate("editdate"));
	setEdittime(rs.getTime("edittime"));
	setRemark(rs.getString("remark"));
	//#fetching other result desire
	//#(60000) programmer code begin;
	//#(60000) programmer code end;
}
protected void assignParameters(ExecuteStatement sql) throws Exception {
	if(sql==null) return;
	//#Everything I do, I do it for you
	//#(75000) programmer code begin;
	if(getEditdate()==null) setEditdate(new java.sql.Date(System.currentTimeMillis()));
	if(getEdittime()==null) setEdittime(new java.sql.Time(System.currentTimeMillis()));
	if(getAccount()==null || getAccount().trim().length()<=0) setAccount(getUserid());
	//#(75000) programmer code end;
	sql.setParameter("cdrefdate",getCdrefdate());
	sql.setParameter("userid",getUserid());
	sql.setParameter("account",getAccount());
	sql.setParameter("amt",getAmt());
	sql.setParameter("dnamt",getDnamt());
	sql.setParameter("cnamt",getCnamt());
	sql.setParameter("editdate",getEditdate());
	sql.setParameter("edittime",getEdittime());
	sql.setParameter("remark",getRemark());
	//#I'm gonna be around you
	//#(77000) programmer code begin;
	//#(77000) programmer code end;
}
public int insert(java.sql.Connection connection,java.sql.Connection centerConnection,java.sql.Connection globalConnection,java.util.Map transientVar) throws Exception {
	//#begin with insert statement going on
	//#(250000) programmer code begin;
	//#(250000) programmer code end;
	ExecuteStatement sql = createQueryForInsert(connection);
	//#another modification keep on loving you
	//#(110000) programmer code begin;
	//#(110000) programmer code end;
	assignParameters(sql);
	//#assigned parameter always on my mind
	//#(120000) programmer code begin;
	//#(120000) programmer code end;
	return sql.executeUpdate(connection);
	//#ending with insert statement here
	//#(260000) programmer code begin;
	//#(260000) programmer code end;
}
public int delete(java.sql.Connection connection,java.sql.Connection centerConnection,java.sql.Connection globalConnection,java.util.Map transientVar) throws Exception {
	setKeyField("cdrefdate");
	setKeyField("userid");
	//#begin with delete statement going on
	//#(270000) programmer code begin;
	//#(270000) programmer code end;
	ExecuteStatement sql = createQueryForDelete(connection);
	//#any delete statement more than that
	//#(130000) programmer code begin;
	//#(130000) programmer code end;
	sql.setParameter("cdrefdate",getCdrefdate());
	sql.setParameter("userid",getUserid());
	//#assigned parameters time after time
	//#(140000) programmer code begin;
	//#(140000) programmer code end;
	return sql.executeUpdate(connection);
	//#ending with delete statement here
	//#(280000) programmer code begin;
	//#(280000) programmer code end;
}
public int update(java.sql.Connection connection,java.sql.Connection centerConnection,java.sql.Connection globalConnection,java.util.Map transientVar) throws Exception {
	setKeyField("cdrefdate");
	setKeyField("userid");
	//#begin with update statement going on
	//#(290000) programmer code begin;
	//#(290000) programmer code end;
	ExecuteStatement sql = createQueryForUpdate(connection);
	//#any update statement over protected
	//#(150000) programmer code begin;
	//#(150000) programmer code end;
	assignParameters(sql);
	//#assigned parameters all rise
	//#(160000) programmer code begin;
	//#(160000) programmer code end;
	return sql.executeUpdate(connection);
	//#ending with delete statement going on
	//#(300000) programmer code begin;
	//#(300000) programmer code end;
}
public int retrieve(java.sql.Connection connection,java.sql.Connection centerConnection,java.sql.Connection globalConnection,java.util.Map transientVar) throws Exception {
	setKeyField("cdrefdate");
	setKeyField("userid");
	//#statement shake it up retrieving
	//#(165000) programmer code begin;
	//#(165000) programmer code end;
	ExecuteStatement sql = createQueryForRetrieve(connection);
	//#any retrieve statement too close
	//#(170000) programmer code begin;
	//#(170000) programmer code end;
	//#assigned parameters make it happen
	//#(180000) programmer code begin;
	//#(180000) programmer code end;
	int result = 0;
	java.sql.ResultSet rs = sql.executeQuery(connection);
	if(rs.next()) {
		result++;
		fetchResult(rs);
		//#any result fetching fool again
		//#(220000) programmer code begin;
		//#(220000) programmer code end;
	}
	//#after fetching result set lovin each day
	//#(230000) programmer code begin;
	//#(230000) programmer code end;
	close(rs);
	return result;
}
public boolean validateInsert(java.sql.Connection connection,java.sql.Connection centerConnection,java.sql.Connection globalConnection,java.util.Map transientVar) throws Exception {
	//#say you say me
	//#(195000) programmer code begin;
	//#(195000) programmer code end;
	if(getCdrefdate()==null) throw new java.sql.SQLException("Cdrefdate is undefined","cdrefdate",-2008);
	if((getUserid()==null) || getUserid().trim().equals("")) throw new java.sql.SQLException("Userid is unspecified","userid",-2008);
	//#valid statement best in me
	//#(190000) programmer code begin;
	//#(190000) programmer code end;
	return true;
}
public boolean validateUpdate(java.sql.Connection connection,java.sql.Connection centerConnection,java.sql.Connection globalConnection,java.util.Map transientVar) throws Exception {
	//#valid update statement to be with you
	//#(200000) programmer code begin;
	//#(200000) programmer code end;
	return true;
}
public boolean validateDelete(java.sql.Connection connection,java.sql.Connection centerConnection,java.sql.Connection globalConnection,java.util.Map transientVar) throws Exception {
	//#valid delete statement here for you
	//#(210000) programmer code begin;
	//#(210000) programmer code end;
	return true;
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
		TRXMData aTRXMData = new TRXMData();
		aTRXMData.fetchResult(rs);
		add(aTRXMData);
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
//#(100000) programmer code end;
}
