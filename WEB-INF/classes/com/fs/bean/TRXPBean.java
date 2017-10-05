package com.fs.bean;

/*
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: TRXPBean.java
 * Description: TRXPBean class implements for handle  schema bean.
 * Version: $Revision$
 * Creation date: Sun Sep 03 09:41:17 ICT 2017
 */
/**
 * TRXPBean class implements for handle schema bean.
 */
import com.fs.bean.gener.*;
import com.fs.bean.util.*;
import com.fs.bean.misc.*;
public class TRXPBean extends BeanSchema {

	public TRXPBean() {
		super();
	}
	protected void initialize() {
		super.initialize();
		addSchema("cdcode",java.sql.Types.VARCHAR,"cdcode");
		addSchema("cdname",java.sql.Types.VARCHAR,"cdname");
		addSchema("cdtype",java.sql.Types.CHAR,"cdtype");
		addSchema("cdstyle",java.sql.Types.VARCHAR,"cdstyle");
		addSchema("iconfile",java.sql.Types.VARCHAR,"iconfile");
		addSchema("amt",java.sql.Types.DECIMAL,"amt");
		addSchema("ownflag",java.sql.Types.CHAR,"ownflag");
		addSchema("userid",java.sql.Types.VARCHAR,"userid");
		addSchema("editdate",java.sql.Types.DATE,"editdate");
		addSchema("edittime",java.sql.Types.TIME,"edittime");
		collectClass(com.fs.bean.TRXPBean.class);
	}
	public String getCdcode() {
		return getMember("cdcode");
	}
	public void setCdcode(String newCdcode) {
		setMember("cdcode",newCdcode);
	}
	public String getCdname() {
		return getMember("cdname");
	}
	public void setCdname(String newCdname) {
		setMember("cdname",newCdname);
	}
	public String getCdtype() {
		return getMember("cdtype");
	}
	public void setCdtype(String newCdtype) {
		setMember("cdtype",newCdtype);
	}
	public String getCdstyle() {
		return getMember("cdstyle");
	}
	public void setCdstyle(String newCdstyle) {
		setMember("cdstyle",newCdstyle);
	}
	public String getIconfile() {
		return getMember("iconfile");
	}
	public void setIconfile(String newIconfile) {
		setMember("iconfile",newIconfile);
	}
	public String getAmt() {
		return getMember("amt");
	}
	public void setAmt(String newAmt) {
		setMember("amt",newAmt);
	}
	public String getOwnflag() {
		return getMember("ownflag");
	}
	public void setOwnflag(String newOwnflag) {
		setMember("ownflag",newOwnflag);
	}
	public String getUserid() {
		return getMember("userid");
	}
	public void setUserid(String newUserid) {
		setMember("userid",newUserid);
	}
	public String getEditdate() {
		return getMember("editdate");
	}
	public void setEditdate(String newEditdate) {
		setMember("editdate",newEditdate);
	}
	public String getEdittime() {
		return getMember("edittime");
	}
	public void setEdittime(String newEdittime) {
		setMember("edittime",newEdittime);
	}
}
