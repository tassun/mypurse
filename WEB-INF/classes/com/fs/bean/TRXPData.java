package com.fs.bean;
/*
 * SCCS id: $Id$
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: TRXPData.java
 * Description: TRXPData class implements for handle trxp data base schema.
 * Version: $Revision$
 * Creation date: Sun Sep 03 09:44:02 ICT 2017
 */
/**
 * TRXPData class implements for handle trxp data base schema.
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
public class TRXPData extends BeanData {
//#defined & declaration the real thing
//#(20000) programmer code begin;
//#(20000) programmer code end;
public TRXPData() {
	super();
}
protected void initialize() {
	super.initialize();
	setTable("trxp");
	addSchema("cdcode",java.sql.Types.VARCHAR);
	addSchema("cdname",java.sql.Types.VARCHAR);
	addSchema("cdtype",java.sql.Types.CHAR);
	addSchema("cdstyle",java.sql.Types.VARCHAR);
	addSchema("iconfile",java.sql.Types.VARCHAR);
	addSchema("amt",java.sql.Types.DECIMAL);
	addSchema("ownflag",java.sql.Types.CHAR);
	addSchema("userid",java.sql.Types.VARCHAR);
	addSchema("editdate",java.sql.Types.DATE);
	addSchema("edittime",java.sql.Types.TIME);
	map("amt","amt");
	map("cdtype","cdtype");
	map("edittime","edittime");
	map("editdate","editdate");
	map("userid","userid");
	map("cdstyle","cdstyle");
	map("iconfile","iconfile");
	map("cdname","cdname");
	map("cdcode","cdcode");
	map("ownflag","ownflag");
	//#intialize how deep is your love 
	//#(30000) programmer code begin;
	//#(30000) programmer code end;
}
public String fetchVersion() {
	return super.fetchVersion()+TRXPData.class+"=$Revision$\n";
}
public String getCdcode() {
	return getString("cdcode");
}
public void setCdcode(String newCdcode) {
	setMember("cdcode",newCdcode);
}
public String getCdname() {
	return getString("cdname");
}
public void setCdname(String newCdname) {
	setMember("cdname",newCdname);
}
public String getCdtype() {
	return getString("cdtype");
}
public void setCdtype(String newCdtype) {
	setMember("cdtype",newCdtype);
}
public String getCdstyle() {
	return getString("cdstyle");
}
public void setCdstyle(String newCdstyle) {
	setMember("cdstyle",newCdstyle);
}
public String getIconfile() {
	return getString("iconfile");
}
public void setIconfile(String newIconfile) {
	setMember("iconfile",newIconfile);
}
public BigDecimal getAmt() {
	return getBigDecimal("amt");
}
public void setAmt(BigDecimal newAmt) {
	setMember("amt",newAmt);
}
public String getOwnflag() {
	return getString("ownflag");
}
public void setOwnflag(String newOwnflag) {
	setMember("ownflag",newOwnflag);
}
public String getUserid() {
	return getString("userid");
}
public void setUserid(String newUserid) {
	setMember("userid",newUserid);
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
public boolean obtain(BeanSchemaInterface bean) throws Exception {
	if(bean==null) return super.obtain(bean);
	setCdcode(bean.getFieldByName(mapper("cdcode")).asString());
	setCdname(bean.getFieldByName(mapper("cdname")).asString());
	setCdtype(bean.getFieldByName(mapper("cdtype")).asString());
	setCdstyle(bean.getFieldByName(mapper("cdstyle")).asString());
	setIconfile(bean.getFieldByName(mapper("iconfile")).asString());
	setAmt(bean.getFieldByName(mapper("amt")).asBigDecimal());
	setOwnflag(bean.getFieldByName(mapper("ownflag")).asString());
	setUserid(bean.getFieldByName(mapper("userid")).asString());
	setEditdate(bean.getFieldByName(mapper("editdate")).asDate());
	setEdittime(bean.getFieldByName(mapper("edittime")).asTime());
	//#obtain it perfect moment
	//#(40000) programmer code begin;
	//#(40000) programmer code end;
	return super.obtain(bean);
}
public void fetchResult(java.sql.ResultSet rs) throws java.sql.SQLException {
	super.fetchResult(rs);
	setCdcode(rs.getString("cdcode"));
	setCdname(rs.getString("cdname"));
	setCdtype(rs.getString("cdtype"));
	setCdstyle(rs.getString("cdstyle"));
	setIconfile(rs.getString("iconfile"));
	setAmt(stringToBigDecimal(rs.getString("amt")));
	setOwnflag(rs.getString("ownflag"));
	setUserid(rs.getString("userid"));
	setEditdate(rs.getDate("editdate"));
	setEdittime(rs.getTime("edittime"));
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
	//#(75000) programmer code end;
	sql.setParameter("cdcode",getCdcode());
	sql.setParameter("cdname",getCdname());
	sql.setParameter("cdtype",getCdtype());
	sql.setParameter("cdstyle",getCdstyle());
	sql.setParameter("iconfile",getIconfile());
	sql.setParameter("amt",getAmt());
	sql.setParameter("ownflag",getOwnflag());
	sql.setParameter("userid",getUserid());
	sql.setParameter("editdate",getEditdate());
	sql.setParameter("edittime",getEdittime());
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
	setKeyField("cdcode");
	//#begin with delete statement going on
	//#(270000) programmer code begin;
	int counter = 0;
	KnSQL knsql = new KnSQL(this);
	knsql.append("select count(*) counter from trxd where cdcode=?cdcode ");
	knsql.setParameter("cdcode",getCdcode());
	java.sql.ResultSet rs = knsql.executeQuery(connection);
	if(rs.next()) {
		counter = rs.getInt("counter");
	}
	close(rs);
	if(counter>0) {
		throw new BeanException("Can not delete, this item list has been used from journal transaction",8001);
	}
	//#(270000) programmer code end;
	ExecuteStatement sql = createQueryForDelete(connection);
	//#any delete statement more than that
	//#(130000) programmer code begin;
	//#(130000) programmer code end;
	sql.setParameter("cdcode",getCdcode());
	//#assigned parameters time after time
	//#(140000) programmer code begin;
	//#(140000) programmer code end;
	return sql.executeUpdate(connection);
	//#ending with delete statement here
	//#(280000) programmer code begin;
	//#(280000) programmer code end;
}
public int update(java.sql.Connection connection,java.sql.Connection centerConnection,java.sql.Connection globalConnection,java.util.Map transientVar) throws Exception {
	setKeyField("cdcode");
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
	setKeyField("cdcode");
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
	if((getCdcode()==null) || getCdcode().trim().equals("")) throw new java.sql.SQLException("Cdcode is unspecified","cdcode",-2008);
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
	String filter = " where";
	sql.append(filter+" userid = ?userid or ownflag is null ");
	sql.setParameter("userid",getUserid());
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
		TRXPData aTRXPData = new TRXPData();
		aTRXPData.fetchResult(rs);
		add(aTRXPData);
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
