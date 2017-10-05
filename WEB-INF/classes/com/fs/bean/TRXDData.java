package com.fs.bean;
/*
 * SCCS id: $Id$
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: TRXDData.java
 * Description: TRXDData class implements for handle trxd data base schema.
 * Version: $Revision$
 * Creation date: Sun Sep 03 09:44:48 ICT 2017
 */
/**
 * TRXDData class implements for handle trxd data base schema.
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
public class TRXDData extends BeanData {
//#defined & declaration the real thing
//#(20000) programmer code begin;
java.math.BigDecimal MINUS_ONE = new java.math.BigDecimal(-1);
class TRXAmt {
	public java.math.BigDecimal recamt = java.math.BigDecimal.ZERO;
	public java.math.BigDecimal payamt = java.math.BigDecimal.ZERO;
}
//#(20000) programmer code end;
public TRXDData() {
	super();
}
protected void initialize() {
	super.initialize();
	setTable("trxd");
	addSchema("cdrefdate",java.sql.Types.DATE);
	addSchema("cdcode",java.sql.Types.VARCHAR);
	addSchema("userid",java.sql.Types.VARCHAR);
	addSchema("cdseqno",java.sql.Types.INTEGER);
	addSchema("amt",java.sql.Types.DECIMAL);
	addSchema("remark",java.sql.Types.VARCHAR);
	addSchema("editdate",java.sql.Types.DATE);
	addSchema("edittime",java.sql.Types.TIME);
	map("userid","userid");
	map("cdcode","cdcode");
	map("editdate","editdate");
	map("cdseqno","cdseqno");
	map("cdrefdate","cdrefdate");
	map("edittime","edittime");
	map("remark","remark");
	map("amt","amt");
	//#intialize how deep is your love 
	//#(30000) programmer code begin;
	addSchema("cdtype",java.sql.Types.VARCHAR,true);
	addSchema("cdname",java.sql.Types.VARCHAR,true);
	addSchema("oldcdcode",java.sql.Types.VARCHAR,true);
	addSchema("fromdate",java.sql.Types.DATE,true);
	addSchema("todate",java.sql.Types.DATE,true);
	map("cdtype","cdtype");
	map("cdname","cdname");
	map("oldcdcode","oldcdcode");
	map("fromdate","fromdate");
	map("todate","todate");
	//#(30000) programmer code end;
}
public String fetchVersion() {
	return super.fetchVersion()+TRXDData.class+"=$Revision$\n";
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
public int getCdseqno() {
	return getInt("cdseqno");
}
public void setCdseqno(int newCdseqno) {
	setMember("cdseqno",newCdseqno);
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
public String getOldcdcode() {
	return getString("oldcdcode");
}
public void setOldcdcode(String newOldcdcode) {
	setMember("oldcdcode",newOldcdcode);
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
	setCdseqno(bean.getFieldByName(mapper("cdseqno")).asInt());
	setAmt(bean.getFieldByName(mapper("amt")).asBigDecimal());
	setRemark(bean.getFieldByName(mapper("remark")).asString());
	setEditdate(bean.getFieldByName(mapper("editdate")).asDate());
	setEdittime(bean.getFieldByName(mapper("edittime")).asTime());
	//#obtain it perfect moment
	//#(40000) programmer code begin;
	setOldcdcode(bean.getFieldByName(mapper("oldcdcode")).asString());
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
	setCdseqno(rs.getInt("cdseqno"));
	setAmt(stringToBigDecimal(rs.getString("amt")));
	setRemark(rs.getString("remark"));
	setEditdate(rs.getDate("editdate"));
	setEdittime(rs.getTime("edittime"));
	//#fetching other result desire
	//#(60000) programmer code begin;
	setOldcdcode(rs.getString("cdcode"));
	//#(60000) programmer code end;
}
protected void assignParameters(ExecuteStatement sql) throws Exception {
	if(sql==null) return;
	//#Everything I do, I do it for you
	//#(75000) programmer code begin;
	if(getEditdate()==null) setEditdate(new java.sql.Date(System.currentTimeMillis()));
	if(getEdittime()==null) setEdittime(new java.sql.Time(System.currentTimeMillis()));
	//#(75000) programmer code end;
	sql.setParameter("cdrefdate",getCdrefdate());
	sql.setParameter("cdcode",getCdcode());
	sql.setParameter("userid",getUserid());
	sql.setParameter("cdseqno",getCdseqno());
	sql.setParameter("amt",getAmt());
	sql.setParameter("remark",getRemark());
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
	int result = sql.executeUpdate(connection);
	//#ending with insert statement here
	//#(260000) programmer code begin;
	TRXAmt trx = getTransactionAmount(connection);
	TRXMData d = new TRXMData();
	d.init(global);
	d.setCdrefdate(getCdrefdate());
	d.setUserid(getUserid());
	d.setAccount(getUserid());
	d.setDnamt(trx.payamt);
	d.setCnamt(trx.recamt);
	d.setAmt(trx.recamt.subtract(trx.payamt));
	if(java.math.BigDecimal.ZERO.compareTo(d.getAmt())>0) {
		d.setAmt(d.getAmt().multiply(MINUS_ONE));
	}
	int rows = d.update(connection,centerConnection,globalConnection,transientVar);
	if(rows<=0) d.insert(connection,centerConnection,globalConnection,transientVar);
	return result;
	//#(260000) programmer code end;
}
public int delete(java.sql.Connection connection,java.sql.Connection centerConnection,java.sql.Connection globalConnection,java.util.Map transientVar) throws Exception {
	setKeyField("cdrefdate");
	setKeyField("cdcode");
	setKeyField("userid");
	//#begin with delete statement going on
	//#(270000) programmer code begin;
	//#(270000) programmer code end;
	ExecuteStatement sql = createQueryForDelete(connection);
	//#any delete statement more than that
	//#(130000) programmer code begin;
	//#(130000) programmer code end;
	sql.setParameter("cdrefdate",getCdrefdate());
	sql.setParameter("cdcode",getCdcode());
	sql.setParameter("userid",getUserid());
	//#assigned parameters time after time
	//#(140000) programmer code begin;
	//#(140000) programmer code end;
	int result = sql.executeUpdate(connection);
	//#ending with delete statement here
	//#(280000) programmer code begin;
	TRXAmt trx = getTransactionAmount(connection);
	TRXMData d = new TRXMData();
	d.init(global);
	d.setCdrefdate(getCdrefdate());
	d.setUserid(getUserid());
	d.setAccount(getUserid());
	d.setDnamt(trx.payamt);
	d.setCnamt(trx.recamt);
	d.setAmt(trx.recamt.subtract(trx.payamt));
	if(java.math.BigDecimal.ZERO.compareTo(d.getAmt())>0) {
		d.setAmt(d.getAmt().multiply(MINUS_ONE));
	}
	d.update(connection,centerConnection,globalConnection,transientVar);
	return result;
	//#(280000) programmer code end;
}
public int update(java.sql.Connection connection,java.sql.Connection centerConnection,java.sql.Connection globalConnection,java.util.Map transientVar) throws Exception {
	setKeyField("cdrefdate");
	setKeyField("cdcode");
	setKeyField("userid");
	//#begin with update statement going on
	//#(290000) programmer code begin;
	if(getOldcdcode()!=null && getOldcdcode().trim().length()>0) {
		if(!getOldcdcode().equals(getCdcode())) {
			ExecuteStatement sql = createQueryForDelete(connection);
			sql.setParameter("cdrefdate",getCdrefdate());
			sql.setParameter("cdcode",getOldcdcode());
			sql.setParameter("userid",getUserid());
			sql.executeUpdate(connection);
			
			sql = createQueryForInsert(connection);
			assignParameters(sql);
			sql.executeUpdate(connection);
		}
	}
	//#(290000) programmer code end;
	ExecuteStatement sql = createQueryForUpdate(connection);
	//#any update statement over protected
	//#(150000) programmer code begin;
	//#(150000) programmer code end;
	assignParameters(sql);
	//#assigned parameters all rise
	//#(160000) programmer code begin;
	//#(160000) programmer code end;
	int result = sql.executeUpdate(connection);
	//#ending with delete statement going on
	//#(300000) programmer code begin;
	TRXAmt trx = getTransactionAmount(connection);
	TRXMData d = new TRXMData();
	d.init(global);
	d.setCdrefdate(getCdrefdate());
	d.setUserid(getUserid());
	d.setAccount(getUserid());
	d.setDnamt(trx.payamt);
	d.setCnamt(trx.recamt);
	d.setAmt(trx.recamt.subtract(trx.payamt));
	if(java.math.BigDecimal.ZERO.compareTo(d.getAmt())>0) {
		d.setAmt(d.getAmt().multiply(MINUS_ONE));
	}
	d.update(connection,centerConnection,globalConnection,transientVar);
	return result;
	//#(300000) programmer code end;
}
public int retrieve(java.sql.Connection connection,java.sql.Connection centerConnection,java.sql.Connection globalConnection,java.util.Map transientVar) throws Exception {
	setKeyField("cdrefdate");
	setKeyField("cdcode");
	setKeyField("userid");
	//#statement shake it up retrieving
	//#(165000) programmer code begin;
	//#(165000) programmer code end;
	ExecuteStatement sql = createQueryForRetrieve(connection);
	//#any retrieve statement too close
	//#(170000) programmer code begin;
	sql.clear();
	sql.append("select trxd.*,trxp.cdtype,trxp.cdname from trxd,trxp ");
	sql.append("where trxd.cdrefdate = ?cdrefdate ");
	sql.append("and trxd.cdcode = ?cdcode ");
	sql.append("and trxd.userid = ?userid ");
	sql.append("and trxd.cdcode = trxp.cdcode ");
	sql.setParameter("userid",getUserid());
	sql.setParameter("cdrefdate",getCdrefdate());
	sql.setParameter("cdcode",getCdcode());
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
		setCdtype(rs.getString("cdtype"));
		setCdname(rs.getString("cdname"));
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
	if((getCdcode()==null) || getCdcode().trim().equals("")) throw new java.sql.SQLException("Cdcode is unspecified","cdcode",-2008);
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
	sql.clear();
	sql.append("select trxd.*,trxp.cdtype,trxp.cdname from trxd,trxp ");
	sql.append("where trxd.userid = ?userid ");
	sql.setParameter("userid",getUserid());
	if(getCdrefdate()!=null) {
		sql.append("and trxd.cdrefdate = ?cdrefdate ");
		sql.setParameter("cdrefdate",getCdrefdate());
	}
	sql.append("and trxd.cdcode = trxp.cdcode ");
	sql.append("order by cdrefdate, cdseqno ");
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
		TRXDData aTRXDData = new TRXDData();
		aTRXDData.fetchResult(rs);
		add(aTRXDData);
		//#addon statement if you come back
		//#(90000) programmer code begin;
		aTRXDData.setCdtype(rs.getString("cdtype"));
		aTRXDData.setCdname(rs.getString("cdname"));
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
public TRXAmt getTransactionAmount(java.sql.Connection connection) throws Exception {
	TRXAmt trx = new TRXAmt();
	KnSQL knsql = new KnSQL(this);
	knsql.append("select sum(trxd.amt) sumamt,trxp.cdtype ");
	knsql.append("from trxd,trxp ");
	knsql.append("where trxd.cdrefdate = ?cdrefdate ");
	knsql.append("and trxd.userid = ?userid ");
	knsql.append("and trxd.cdcode = trxp.cdcode ");
	knsql.append("group by cdtype ");
	knsql.setParameter("cdrefdate",getCdrefdate());
	knsql.setParameter("userid",getUserid());
	java.sql.ResultSet rs = knsql.executeQuery(connection);
	while(rs.next()) {
		String cdtype = rs.getString("cdtype");
		if("0".equals(cdtype)) {
			trx.payamt = rs.getBigDecimal("sumamt");
		} else {
			trx.recamt = rs.getBigDecimal("sumamt");
		}
	}
	close(rs);
	return trx;
}
//#(100000) programmer code end;
}
