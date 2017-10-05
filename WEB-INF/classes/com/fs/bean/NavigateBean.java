package com.fs.bean;

/*
 * SCCS id: $Id$
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: $RCSfile$
 * Description: Bean generate class
 * Version: $Revision$
 * Programmer: $Author$
 * Creation date: Fri Apr 29 11:10:02 ICT 2011
 */

import com.fs.bean.misc.*;
import com.fs.bean.gener.*;

public class NavigateBean extends BeanSchema {

//#member & declaration remember me this way
//#(10000) programmer code begin;
public static int DEFAULT_RESULT_PER_PAGE = 20;
//#(10000) programmer code end;
public NavigateBean() {
	super();
}
protected void initialize() {
	super.initialize();
	addSchema("searchoption",java.sql.Types.VARCHAR,"Search Options");
	addSchema("sortname",java.sql.Types.VARCHAR,"Sort Name");
	addSchema("sortorder",java.sql.Types.VARCHAR,"Sort Order");
	addSchema("query",java.sql.Types.VARCHAR,"Query");
	addSchema("qtype",java.sql.Types.VARCHAR,"Query Type");
	addSchema("page",java.sql.Types.VARCHAR,"Page");
	addSchema("rp",java.sql.Types.VARCHAR,"Result Per Page");
	addSchema("fetch",java.sql.Types.VARCHAR,"Fetching");
	//#initialize & assigned always somewhere
	//#(20000) programmer code begin;
	//#(20000) programmer code end;
}
public String fetchVersion() {
	return super.fetchVersion()+NavigateBean.class+"=$Revision$\n";
}
public String getSearchoption() {
	return getMember("searchoption");
}
public void setSearchoption(String newSearchoption) {
	setMember("searchoption",newSearchoption);
}
public String getSortname() {
	return getMember("sortname");
}
public void setSortname(String newSortname) {
	setMember("sortname",newSortname);
}
public String getSortorder() {
	return getMember("sortorder");
}
public void setSortorder(String newSortorder) {
	setMember("sortorder",newSortorder);
}
public String getQuery() {
	return getMember("query");
}
public void setQuery(String newQuery) {
	setMember("query",newQuery);
}
public String getQtype() {
	return getMember("qtype");
}
public void setQtype(String newQtype) {
	setMember("qtype",newQtype);
}
public String getPage() {
	return getMember("page");
}
public void setPage(String newPage) {
	setMember("page",newPage);
}
public String getRp() {
	return getMember("rp");
}
public void setRp(String newRp) {
	setMember("rp",newRp);
}
public String getFetch() {
	return getMember("fetch");
}
public void setFetch(String newFetch) {
	setMember("fetch",newFetch);
}
//#methods defined everything will flow
//#(30000) programmer code begin;
public boolean isFetching() {
	return "true".equalsIgnoreCase(getFetch());
}
public int getResultsPerpage() {
	if(getRp()!=null && getRp().trim().length()>0) {
		try { return Integer.parseInt(getRp()); } catch(Exception ex) { }
	}
	return DEFAULT_RESULT_PER_PAGE;
}
public int getPageNo() {
	if(getPage()!=null && getPage().trim().length()>0) {
		try { return Integer.parseInt(getPage()); } catch(Exception ex) { }
	}
	return 1;
}
public boolean isInverse() {
	return "desc".equalsIgnoreCase(getSortorder());
}
//#(30000) programmer code end;
/*
$Revision$
*/
}
