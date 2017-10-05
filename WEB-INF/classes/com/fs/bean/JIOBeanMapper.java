package com.fs.bean;
/*
 * SCCS id: $Id$
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: $RCSfile$
 * Description: JIOBeanMapper class implements for handle mapping class
 * Version: $Revision$
 * Programmer: $Author$
 * Creation date: Sun Sep 10 10:12:41 ICT 2017
 */
/**
 * JIOBeanMapper class implements for handle mapping class.
 */
import com.fs.bean.gener.*;
//#import anything the right time
//#(10000) programmer code begin;
//#(10000) programmer code end;
public class JIOBeanMapper extends BeanMap {
public JIOBeanMapper() {
	super();
}
protected void initialize() {
	super.initialize();
	mapClass("com.fs.bean.JIOData");
	//#other initial give me a reason
	//#(20000) programmer code begin;
	//#(20000) programmer code end;
}
public String fetchVersion() {
	return super.fetchVersion()+JIOBeanMapper.class+"=$Revision$\n";
}
//#another methods defined irresistible
//#(30000) programmer code begin;
//#(30000) programmer code end;
}
