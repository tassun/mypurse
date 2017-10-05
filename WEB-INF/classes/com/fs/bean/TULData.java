package com.fs.bean;
/*
 * SCCS id: $Id$
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: TULData.java
 * Description: TULData class implements for handle tul data base schema.
 * Version: $Revision$
 * Creation date: Thu Sep 07 17:16:20 ICT 2017
 */
/**
 * TULData class implements for handle tul data base schema.
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
public class TULData extends BeanData {
//#defined & declaration the real thing
//#(20000) programmer code begin;
private BeanUtility butil = new BeanUtility();
private java.util.Map<String,String> prgmap = new java.util.HashMap<String,String>();
//#(20000) programmer code end;
public TULData() {
	super();
}
protected void initialize() {
	super.initialize();
	setTable("tul");
	addSchema("seqno",java.sql.Types.BIGINT);
	addSchema("curtime",java.sql.Types.TIMESTAMP);
	addSchema("userid",java.sql.Types.VARCHAR);
	addSchema("site",java.sql.Types.VARCHAR);
	addSchema("progid",java.sql.Types.VARCHAR);
	addSchema("action",java.sql.Types.VARCHAR);
	addSchema("remark",java.sql.Types.VARCHAR);
	map("userid","userid");
	map("site","site");
	map("progid","progid");
	map("action","action");
	map("remark","remark");
	map("curtime","curtime");
	map("seqno","seqno");
	//#intialize how deep is your love 
	//#(30000) programmer code begin;
	addSchema("usertname",java.sql.Types.CHAR,true);
	addSchema("usertsurname",java.sql.Types.CHAR,true);
	addSchema("email",java.sql.Types.VARCHAR,true);
	addSchema("mobile",java.sql.Types.VARCHAR,true);
	addSchema("fromdate",java.sql.Types.DATE,true);
	addSchema("todate",java.sql.Types.DATE,true);
	addSchema("curdate",java.sql.Types.DATE,true);
	map("fromdate","fromdate");
	map("todate","todate");
	map("curdate","curdate");
	map("usertname","usertname");
	map("usertsurname","usertsurname");
	map("email","email");
	map("mobile","mobile");
	//#(30000) programmer code end;
}
public String fetchVersion() {
	return super.fetchVersion()+TULData.class+"=$Revision$\n";
}
public long getSeqno() {
	return getLong("seqno");
}
public void setSeqno(long newSeqno) {
	setMember("seqno",newSeqno);
}
public Timestamp getCurtime() {
	return getTimestamp("curtime");
}
public void setCurtime(Timestamp newCurtime) {
	setMember("curtime",newCurtime);
}
public String getUserid() {
	return getString("userid");
}
public void setUserid(String newUserid) {
	setMember("userid",newUserid);
}
public String getSite() {
	return getString("site");
}
public void setSite(String newSite) {
	setMember("site",newSite);
}
public String getProgid() {
	return getString("progid");
}
public void setProgid(String newProgid) {
	setMember("progid",newProgid);
}
public String getAction() {
	return getString("action");
}
public void setAction(String newAction) {
	setMember("action",newAction);
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
public Date getCurdate() {
	return getDate("curdate");
}
public void setCurdate(Date newCurdate) {
	setMember("curdate",newCurdate);
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
	setSeqno(bean.getFieldByName(mapper("seqno")).asLong());
	setCurtime(bean.getFieldByName(mapper("curtime")).asTimestamp());
	setUserid(bean.getFieldByName(mapper("userid")).asString());
	setSite(bean.getFieldByName(mapper("site")).asString());
	setProgid(bean.getFieldByName(mapper("progid")).asString());
	setAction(bean.getFieldByName(mapper("action")).asString());
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
	setSeqno(rs.getLong("seqno"));
	setCurtime(rs.getTimestamp("curtime"));
	setUserid(rs.getString("userid"));
	setSite(rs.getString("site"));
	setProgid(rs.getString("progid"));
	setAction(rs.getString("action"));
	setRemark(rs.getString("remark"));
	//#fetching other result desire
	//#(60000) programmer code begin;
	setCurdate(new java.sql.Date(getCurtime().getTime()));
	//#(60000) programmer code end;
}
protected void assignParameters(ExecuteStatement sql) throws Exception {
	if(sql==null) return;
	//#Everything I do, I do it for you
	//#(75000) programmer code begin;
	//#(75000) programmer code end;
	sql.setParameter("seqno",getSeqno());
	sql.setParameter("curtime",getCurtime());
	sql.setParameter("userid",getUserid());
	sql.setParameter("site",getSite());
	sql.setParameter("progid",getProgid());
	sql.setParameter("action",getAction());
	sql.setParameter("remark",getRemark());
	//#I'm gonna be around you
	//#(77000) programmer code begin;
	//#(77000) programmer code end;
}
public int retrieve(java.sql.Connection connection,java.sql.Connection centerConnection,java.sql.Connection globalConnection,java.util.Map transientVar) throws Exception {
	removeAlls();
	PermissionBean fsPermission = global==null?null:global.getPermission();
	//#here we go to the collection
	//#(65000) programmer code begin;
	//#(65000) programmer code end;
	ExecuteStatement sql = createQueryForCollect(connection);
	//#any collect statement would you be happier
	//#(70000) programmer code begin;
	sql.append(" where userid = ?userid ");
	sql.setParameter("userid",getUserid());
	if((getProgid() != null) && (getProgid().trim().length() > 0)) {
		sql.append("and progid LIKE ?progid ");
		sql.setParameter("progid",getProgid()+"%");
	}
	if(getFromdate()!=null) {
		sql.append("and curtime >= ?fromdate ");
		sql.setParameter("fromdate",new java.sql.Timestamp(getFromdate().getTime()));
	}
	if(getTodate()!=null) {
		java.util.Date todate = butil.rollingDate(getTodate(),0,0,0,23,59,59);
		sql.append("and curtime <= ?todate ");
		sql.setParameter("todate",new java.sql.Timestamp(todate.getTime()));
	}
	sql.append(" order by curtime desc,progid ");
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
		TULData aTULData = new TULData();
		aTULData.fetchResult(rs);
		add(aTULData);
		//#addon statement if you come back
		//#(90000) programmer code begin;
		//#(90000) programmer code end;
	}
	//#after scraping result set in too deep
	//#(240000) programmer code begin;
	if(result>0) {
		sql.clear();
		sql.append("select usertname,usertsurname,email,mobile from tuser where userid = ?userid");
		sql.setParameter("userid",getUserid());
		java.sql.ResultSet crs = sql.executeQuery(connection);
		if(crs.next()) {
			setUsertname(crs.getString("usertname"));
			setUsertsurname(crs.getString("usertsurname"));
			setEmail(crs.getString("email"));
			setMobile(crs.getString("mobile"));
		}
		close(crs);
	}
	//#(240000) programmer code end;
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
	sql.append("select tul.userid,tul.progid,tuser.usertname,tuser.usertsurname,tuser.email,tuser.mobile ");
	sql.append("from tul ");
	sql.append("left join tuser on tuser.userid = tul.userid ");
	sql.append("where tul.userid is not null ");
	if(getUserid()!=null && (getUserid().trim().length()>0)) {
		sql.append("and tul.userid LIKE ?userid ");
		sql.setParameter("userid",getUserid()+"%");
	}
	if((getProgid() != null) && (getProgid().trim().length() > 0)) {
		sql.append("and tul.progid LIKE ?progid ");
		sql.setParameter("progid",getProgid()+"%");
	}
	if(getFromdate()!=null) {
		sql.append("and tul.curtime >= ?fromdate ");
		sql.setParameter("fromdate",new java.sql.Timestamp(getFromdate().getTime()));
	}
	if(getTodate()!=null) {
		java.util.Date todate = butil.rollingDate(getTodate(),0,0,0,23,59,59);
		sql.append("and tul.curtime <= ?todate ");
		sql.setParameter("todate",new java.sql.Timestamp(todate.getTime()));
	}
	sql.append(" order by userid ");
	//#(70000) programmer code end;
	//#assigned parameters this temptation
	//#(80000) programmer code begin;
	//java.util.Map<String,TULData> tul = new java.util.HashMap<String,TULData>();
	String fs_userid = null;
	TULData aTULData = null;
	//#(80000) programmer code end;
	int result = 0;
	java.sql.ResultSet rs = sql.executeQuery(connection);
	while(rs.next()) {
		result++;
		String userid = rs.getString("userid");
		if(!userid.equals(fs_userid)) {
			aTULData = new TULData();
			add(aTULData);
			aTULData.setUserid(userid);
			aTULData.setUsertname(rs.getString("usertname"));
			aTULData.setUsertsurname(rs.getString("usertsurname"));
			aTULData.setEmail(rs.getString("email"));
			aTULData.setMobile(rs.getString("mobile"));
		}
		fs_userid = userid;
		/*
		TULData aTULData = tul.get(userid);
		if(aTULData==null) {
			aTULData = new TULData();
			add(aTULData);
			aTULData.setUserid(userid);
			aTULData.setUsertname(rs.getString("usertname"));
			aTULData.setUsertsurname(rs.getString("usertsurname"));
			aTULData.setEmail(rs.getString("email"));
			aTULData.setMobile(rs.getString("mobile"));
			tul.put(userid,aTULData);
		}
		*/
		String progid = rs.getString("progid");
		if(progid!=null && progid.trim().length()>0) {
			String fs_progid = aTULData.getProgid();
			if(fs_progid==null) fs_progid = "";
			if(fs_progid.indexOf(progid)<0) {
				if(fs_progid.length()>0) fs_progid = fs_progid.concat(", ");
				fs_progid = fs_progid.concat(progid);
			}
			aTULData.setProgid(fs_progid);
			//aTULData.prgmap.put(progid,progid);
		}
	}
	//#after scraping result set in too deep
	//#(240000) programmer code begin;
	/*
	java.util.Enumeration ens = childElements();
	if(ens!=null) {
		for(;ens.hasMoreElements();) {
			TULData d = (TULData)ens.nextElement();
			d.setProgid(d.serializeProgid());
		}
	}
	*/
	//tul.clear(); tul = null;
	//#(240000) programmer code end;
	close(rs);
	return result;
}
//#another methods defined drive you crazy
//#(100000) programmer code begin;
public String serializeProgid() {
	if(prgmap!=null) {
		StringBuilder buf = new StringBuilder();
		for(java.util.Iterator it = prgmap.keySet().iterator();it.hasNext();) {
			if(buf.length()>0) buf.append(", ");
			buf.append(it.next());
		}
		return buf.toString();
	}
	return null;
}
//#(100000) programmer code end;
}
