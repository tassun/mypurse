package com.fs.bean;
/*
 * SCCS id: $Id$
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: TRegisterData.java
 * Description: TRegisterData class implements for handle tuser data base schema.
 * Version: $Revision$
 * Creation date: Fri Sep 01 13:44:16 ICT 2017
 */
/**
 * TRegisterData class implements for handle tuser data base schema.
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
public class TRegisterData extends BeanData {
//#defined & declaration the real thing
//#(20000) programmer code begin;
//#(20000) programmer code end;
public TRegisterData() {
	super();
}
protected void initialize() {
	super.initialize();
	setTable("tuser");
	addSchema("userid",java.sql.Types.CHAR);
	addSchema("username",java.sql.Types.CHAR);
	addSchema("site",java.sql.Types.CHAR);
	addSchema("userbranch",java.sql.Types.CHAR);
	addSchema("usertname",java.sql.Types.CHAR);
	addSchema("usertsurname",java.sql.Types.CHAR);
	addSchema("userename",java.sql.Types.CHAR);
	addSchema("useresurname",java.sql.Types.CHAR);
	addSchema("startdate",java.sql.Types.DATE);
	addSchema("starttime",java.sql.Types.TIME);
	addSchema("status",java.sql.Types.CHAR);
	addSchema("userpassword",java.sql.Types.CHAR);
	addSchema("passwordexpiredate",java.sql.Types.DATE);
	addSchema("deptcode",java.sql.Types.CHAR);
	addSchema("divcode",java.sql.Types.CHAR);
	addSchema("supervisor",java.sql.Types.CHAR);
	addSchema("photoimage",java.sql.Types.CHAR);
	addSchema("adminflag",java.sql.Types.CHAR);
	addSchema("firstpage",java.sql.Types.CHAR);
	addSchema("theme",java.sql.Types.CHAR);
	addSchema("showphoto",java.sql.Types.CHAR);
	addSchema("loginfailtimes",java.sql.Types.TINYINT);
	addSchema("lockflag",java.sql.Types.CHAR);
	addSchema("usertype",java.sql.Types.CHAR);
	addSchema("iconfile",java.sql.Types.VARCHAR);
	addSchema("accessdate",java.sql.Types.DATE);
	addSchema("accesstime",java.sql.Types.TIME);
	addSchema("accesshits",java.sql.Types.BIGINT);
	addSchema("failtime",java.sql.Types.BIGINT);
	addSchema("editdate",java.sql.Types.DATE);
	addSchema("edittime",java.sql.Types.TIME);
	addSchema("email",java.sql.Types.VARCHAR);
	addSchema("cardid",java.sql.Types.VARCHAR);
	addSchema("gender",java.sql.Types.CHAR);
	addSchema("birthday",java.sql.Types.DATE);
	addSchema("mobile",java.sql.Types.VARCHAR);
	addSchema("address1",java.sql.Types.VARCHAR);
	addSchema("address2",java.sql.Types.VARCHAR);
	addSchema("address3",java.sql.Types.VARCHAR);
	map("address3","address3");
	map("usertype","usertype");
	map("address2","address2");
	map("mobile","mobile");
	map("cardid","cardid");
	map("address1","address1");
	map("userpassword","userpassword");
	map("userid","userid");
	map("iconfile","iconfile");
	map("email","email");
	map("gender","gender");
	map("usertsurname","usertsurname");
	map("usertname","usertname");
	map("status","status");
	addSchema("birthmonth",java.sql.Types.INTEGER,true);
	addSchema("birthdate",java.sql.Types.INTEGER,true);
	addSchema("birthyear",java.sql.Types.INTEGER,true);
	//#intialize how deep is your love 
	//#(30000) programmer code begin;
	map("birthdate","birthday");
	map("birthmonth","birthmonth");
	map("birthyear","birthyear");
	//#(30000) programmer code end;
}
public String fetchVersion() {
	return super.fetchVersion()+TRegisterData.class+"=$Revision$\n";
}
public String getUserid() {
	return getString("userid");
}
public void setUserid(String newUserid) {
	setMember("userid",newUserid);
}
public String getUsername() {
	return getString("username");
}
public void setUsername(String newUsername) {
	setMember("username",newUsername);
}
public String getSite() {
	return getString("site");
}
public void setSite(String newSite) {
	setMember("site",newSite);
}
public String getUserbranch() {
	return getString("userbranch");
}
public void setUserbranch(String newUserbranch) {
	setMember("userbranch",newUserbranch);
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
public String getUserename() {
	return getString("userename");
}
public void setUserename(String newUserename) {
	setMember("userename",newUserename);
}
public String getUseresurname() {
	return getString("useresurname");
}
public void setUseresurname(String newUseresurname) {
	setMember("useresurname",newUseresurname);
}
public Date getStartdate() {
	return getDate("startdate");
}
public void setStartdate(Date newStartdate) {
	setMember("startdate",newStartdate);
}
public Time getStarttime() {
	return getTime("starttime");
}
public void setStarttime(Time newStarttime) {
	setMember("starttime",newStarttime);
}
public String getStatus() {
	return getString("status");
}
public void setStatus(String newStatus) {
	setMember("status",newStatus);
}
public String getUserpassword() {
	return getString("userpassword");
}
public void setUserpassword(String newUserpassword) {
	setMember("userpassword",newUserpassword);
}
public Date getPasswordexpiredate() {
	return getDate("passwordexpiredate");
}
public void setPasswordexpiredate(Date newPasswordexpiredate) {
	setMember("passwordexpiredate",newPasswordexpiredate);
}
public String getDeptcode() {
	return getString("deptcode");
}
public void setDeptcode(String newDeptcode) {
	setMember("deptcode",newDeptcode);
}
public String getDivcode() {
	return getString("divcode");
}
public void setDivcode(String newDivcode) {
	setMember("divcode",newDivcode);
}
public String getSupervisor() {
	return getString("supervisor");
}
public void setSupervisor(String newSupervisor) {
	setMember("supervisor",newSupervisor);
}
public String getPhotoimage() {
	return getString("photoimage");
}
public void setPhotoimage(String newPhotoimage) {
	setMember("photoimage",newPhotoimage);
}
public String getAdminflag() {
	return getString("adminflag");
}
public void setAdminflag(String newAdminflag) {
	setMember("adminflag",newAdminflag);
}
public String getFirstpage() {
	return getString("firstpage");
}
public void setFirstpage(String newFirstpage) {
	setMember("firstpage",newFirstpage);
}
public String getTheme() {
	return getString("theme");
}
public void setTheme(String newTheme) {
	setMember("theme",newTheme);
}
public String getShowphoto() {
	return getString("showphoto");
}
public void setShowphoto(String newShowphoto) {
	setMember("showphoto",newShowphoto);
}
public int getLoginfailtimes() {
	return getInt("loginfailtimes");
}
public void setLoginfailtimes(int newLoginfailtimes) {
	setMember("loginfailtimes",newLoginfailtimes);
}
public String getLockflag() {
	return getString("lockflag");
}
public void setLockflag(String newLockflag) {
	setMember("lockflag",newLockflag);
}
public String getUsertype() {
	return getString("usertype");
}
public void setUsertype(String newUsertype) {
	setMember("usertype",newUsertype);
}
public String getIconfile() {
	return getString("iconfile");
}
public void setIconfile(String newIconfile) {
	setMember("iconfile",newIconfile);
}
public Date getAccessdate() {
	return getDate("accessdate");
}
public void setAccessdate(Date newAccessdate) {
	setMember("accessdate",newAccessdate);
}
public Time getAccesstime() {
	return getTime("accesstime");
}
public void setAccesstime(Time newAccesstime) {
	setMember("accesstime",newAccesstime);
}
public long getAccesshits() {
	return getLong("accesshits");
}
public void setAccesshits(long newAccesshits) {
	setMember("accesshits",newAccesshits);
}
public long getFailtime() {
	return getLong("failtime");
}
public void setFailtime(long newFailtime) {
	setMember("failtime",newFailtime);
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
public String getEmail() {
	return getString("email");
}
public void setEmail(String newEmail) {
	setMember("email",newEmail);
}
public String getCardid() {
	return getString("cardid");
}
public void setCardid(String newCardid) {
	setMember("cardid",newCardid);
}
public String getGender() {
	return getString("gender");
}
public void setGender(String newGender) {
	setMember("gender",newGender);
}
public Date getBirthday() {
	return getDate("birthday");
}
public void setBirthday(Date newBirthday) {
	setMember("birthday",newBirthday);
}
public String getMobile() {
	return getString("mobile");
}
public void setMobile(String newMobile) {
	setMember("mobile",newMobile);
}
public String getAddress1() {
	return getString("address1");
}
public void setAddress1(String newAddress1) {
	setMember("address1",newAddress1);
}
public String getAddress2() {
	return getString("address2");
}
public void setAddress2(String newAddress2) {
	setMember("address2",newAddress2);
}
public String getAddress3() {
	return getString("address3");
}
public void setAddress3(String newAddress3) {
	setMember("address3",newAddress3);
}
public int getBirthmonth() {
	return getInt("birthmonth");
}
public void setBirthmonth(int newBirthmonth) {
	setMember("birthmonth",newBirthmonth);
}
public int getBirthdate() {
	return getInt("birthdate");
}
public void setBirthdate(int newBirthdate) {
	setMember("birthdate",newBirthdate);
}
public int getBirthyear() {
	return getInt("birthyear");
}
public void setBirthyear(int newBirthyear) {
	setMember("birthyear",newBirthyear);
}
public boolean obtain(BeanSchemaInterface bean) throws Exception {
	if(bean==null) return super.obtain(bean);
	setUserid(bean.getFieldByName(mapper("userid")).asString());
	setUsername(bean.getFieldByName(mapper("username")).asString());
	setSite(bean.getFieldByName(mapper("site")).asString());
	setUserbranch(bean.getFieldByName(mapper("userbranch")).asString());
	setUsertname(bean.getFieldByName(mapper("usertname")).asString());
	setUsertsurname(bean.getFieldByName(mapper("usertsurname")).asString());
	setUserename(bean.getFieldByName(mapper("userename")).asString());
	setUseresurname(bean.getFieldByName(mapper("useresurname")).asString());
	setStartdate(bean.getFieldByName(mapper("startdate")).asDate());
	setStarttime(bean.getFieldByName(mapper("starttime")).asTime());
	setStatus(bean.getFieldByName(mapper("status")).asString());
	setUserpassword(bean.getFieldByName(mapper("userpassword")).asString());
	setPasswordexpiredate(bean.getFieldByName(mapper("passwordexpiredate")).asDate());
	setDeptcode(bean.getFieldByName(mapper("deptcode")).asString());
	setDivcode(bean.getFieldByName(mapper("divcode")).asString());
	setSupervisor(bean.getFieldByName(mapper("supervisor")).asString());
	setPhotoimage(bean.getFieldByName(mapper("photoimage")).asString());
	setAdminflag(bean.getFieldByName(mapper("adminflag")).asString());
	setFirstpage(bean.getFieldByName(mapper("firstpage")).asString());
	setTheme(bean.getFieldByName(mapper("theme")).asString());
	setShowphoto(bean.getFieldByName(mapper("showphoto")).asString());
	setLoginfailtimes(bean.getFieldByName(mapper("loginfailtimes")).asInt());
	setLockflag(bean.getFieldByName(mapper("lockflag")).asString());
	setUsertype(bean.getFieldByName(mapper("usertype")).asString());
	setIconfile(bean.getFieldByName(mapper("iconfile")).asString());
	setAccessdate(bean.getFieldByName(mapper("accessdate")).asDate());
	setAccesstime(bean.getFieldByName(mapper("accesstime")).asTime());
	setAccesshits(bean.getFieldByName(mapper("accesshits")).asLong());
	setFailtime(bean.getFieldByName(mapper("failtime")).asLong());
	setEditdate(bean.getFieldByName(mapper("editdate")).asDate());
	setEdittime(bean.getFieldByName(mapper("edittime")).asTime());
	setEmail(bean.getFieldByName(mapper("email")).asString());
	setCardid(bean.getFieldByName(mapper("cardid")).asString());
	setGender(bean.getFieldByName(mapper("gender")).asString());
	setMobile(bean.getFieldByName(mapper("mobile")).asString());
	setAddress1(bean.getFieldByName(mapper("address1")).asString());
	setAddress2(bean.getFieldByName(mapper("address2")).asString());
	setAddress3(bean.getFieldByName(mapper("address3")).asString());
	//#obtain it perfect moment
	//#(40000) programmer code begin;
	if(getUsername()==null || getUsername().trim().length()<=0) setUsername(getUserid());
	setBirthdate(bean.getFieldByName(mapper("birthdate")).asInt());
	setBirthmonth(bean.getFieldByName(mapper("birthmonth")).asInt());
	setBirthyear(bean.getFieldByName(mapper("birthyear")).asInt());
	if(getBirthdate()>0 && getBirthmonth()>=0 && getBirthyear()>0) {
		java.util.Calendar calendar = BeanUtility.getCalendar();
		calendar.set(java.util.Calendar.YEAR,getBirthyear());
		calendar.set(java.util.Calendar.MONTH,getBirthmonth());
		calendar.set(java.util.Calendar.DAY_OF_MONTH,getBirthdate());	
		setBirthday(new java.sql.Date(calendar.getTime().getTime()));
	}
	//#(40000) programmer code end;
	return super.obtain(bean);
}
public void fetchResult(java.sql.ResultSet rs) throws java.sql.SQLException {
	super.fetchResult(rs);
	setUserid(rs.getString("userid"));
	setUsername(rs.getString("username"));
	setSite(rs.getString("site"));
	setUserbranch(rs.getString("userbranch"));
	setUsertname(rs.getString("usertname"));
	setUsertsurname(rs.getString("usertsurname"));
	setUserename(rs.getString("userename"));
	setUseresurname(rs.getString("useresurname"));
	setStartdate(rs.getDate("startdate"));
	setStarttime(rs.getTime("starttime"));
	setStatus(rs.getString("status"));
	setUserpassword(rs.getString("userpassword"));
	setPasswordexpiredate(rs.getDate("passwordexpiredate"));
	setDeptcode(rs.getString("deptcode"));
	setDivcode(rs.getString("divcode"));
	setSupervisor(rs.getString("supervisor"));
	setPhotoimage(rs.getString("photoimage"));
	setAdminflag(rs.getString("adminflag"));
	setFirstpage(rs.getString("firstpage"));
	setTheme(rs.getString("theme"));
	setShowphoto(rs.getString("showphoto"));
	setLoginfailtimes(rs.getInt("loginfailtimes"));
	setLockflag(rs.getString("lockflag"));
	setUsertype(rs.getString("usertype"));
	setIconfile(rs.getString("iconfile"));
	setAccessdate(rs.getDate("accessdate"));
	setAccesstime(rs.getTime("accesstime"));
	setAccesshits(rs.getLong("accesshits"));
	setFailtime(rs.getLong("failtime"));
	setEditdate(rs.getDate("editdate"));
	setEdittime(rs.getTime("edittime"));
	setEmail(rs.getString("email"));
	setCardid(rs.getString("cardid"));
	setGender(rs.getString("gender"));
	setBirthday(rs.getDate("birthday"));
	setMobile(rs.getString("mobile"));
	setAddress1(rs.getString("address1"));
	setAddress2(rs.getString("address2"));
	setAddress3(rs.getString("address3"));
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
	sql.setParameter("username",getUsername());
	sql.setParameter("site",getSite());
	sql.setParameter("userbranch",getUserbranch());
	sql.setParameter("usertname",getUsertname());
	sql.setParameter("usertsurname",getUsertsurname());
	sql.setParameter("userename",getUserename());
	sql.setParameter("useresurname",getUseresurname());
	sql.setParameter("startdate",getStartdate());
	sql.setParameter("starttime",getStarttime());
	sql.setParameter("status",getStatus());
	sql.setParameter("userpassword",getUserpassword());
	sql.setParameter("passwordexpiredate",getPasswordexpiredate());
	sql.setParameter("deptcode",getDeptcode());
	sql.setParameter("divcode",getDivcode());
	sql.setParameter("supervisor",getSupervisor());
	sql.setParameter("photoimage",getPhotoimage());
	sql.setParameter("adminflag",getAdminflag());
	sql.setParameter("firstpage",getFirstpage());
	sql.setParameter("theme",getTheme());
	sql.setParameter("showphoto",getShowphoto());
	sql.setParameter("loginfailtimes",getLoginfailtimes());
	sql.setParameter("lockflag",getLockflag());
	sql.setParameter("usertype",getUsertype());
	sql.setParameter("iconfile",getIconfile());
	sql.setParameter("accessdate",getAccessdate());
	sql.setParameter("accesstime",getAccesstime());
	sql.setParameter("accesshits",getAccesshits());
	sql.setParameter("failtime",getFailtime());
	sql.setParameter("editdate",getEditdate());
	sql.setParameter("edittime",getEdittime());
	sql.setParameter("email",getEmail());
	sql.setParameter("cardid",getCardid());
	sql.setParameter("gender",getGender());
	sql.setParameter("birthday",getBirthday());
	sql.setParameter("mobile",getMobile());
	sql.setParameter("address1",getAddress1());
	sql.setParameter("address2",getAddress2());
	sql.setParameter("address3",getAddress3());
	//#I'm gonna be around you
	//#(77000) programmer code begin;
	//#(77000) programmer code end;
}
public int insert(java.sql.Connection connection,java.sql.Connection centerConnection,java.sql.Connection globalConnection,java.util.Map transientVar) throws Exception {
	//#begin with insert statement going on
	//#(250000) programmer code begin;
	boolean found = false;
	KnSQL knsql = new KnSQL(this);
	knsql.append("select userid from tuser where userid=?userid");
	knsql.setParameter("userid",getUserid());
	java.sql.ResultSet rs = knsql.executeQuery(connection);
	if(rs.next()) {
		found = true;
	}
	close(rs);
	if(found) throw new BeanException("User ID is already existed",-8898);
	if(getStartdate()==null) setStartdate(new java.sql.Date(System.currentTimeMillis()));
	if(getStarttime()==null) setStarttime(new java.sql.Time(System.currentTimeMillis()));
	setEditdate(new java.sql.Date(System.currentTimeMillis()));
	setEdittime(new java.sql.Time(System.currentTimeMillis()));
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
	setKeyField("userid");
	//#begin with delete statement going on
	//#(270000) programmer code begin;
	//#(270000) programmer code end;
	ExecuteStatement sql = createQueryForDelete(connection);
	//#any delete statement more than that
	//#(130000) programmer code begin;
	//#(130000) programmer code end;
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
	setKeyField("userid");
	//#begin with update statement going on
	//#(290000) programmer code begin;
	setEditdate(new java.sql.Date(System.currentTimeMillis()));
	setEdittime(new java.sql.Time(System.currentTimeMillis()));
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
		TRegisterData aTRegisterData = new TRegisterData();
		aTRegisterData.fetchResult(rs);
		add(aTRegisterData);
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
