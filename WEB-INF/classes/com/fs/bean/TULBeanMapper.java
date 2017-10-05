package com.fs.bean;
/*
 * SCCS id: $Id$
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: $RCSfile$
 * Description: TULBeanMapper class implements for handle mapping class
 * Version: $Revision$
 * Programmer: $Author$
 * Creation date: Thu Sep 07 17:16:24 ICT 2017
 */
/**
 * TULBeanMapper class implements for handle mapping class.
 */
import com.fs.bean.gener.*;
//#import anything the right time
//#(10000) programmer code begin;
//#(10000) programmer code end;
public class TULBeanMapper extends BeanMap {
public TULBeanMapper() {
	super();
}
protected void initialize() {
	super.initialize();
	mapClass("com.fs.bean.TULData");
	//#other initial give me a reason
	//#(20000) programmer code begin;
	//#(20000) programmer code end;
}
public String fetchVersion() {
	return super.fetchVersion()+TULBeanMapper.class+"=$Revision$\n";
}
//#another methods defined irresistible
//#(30000) programmer code begin;
//#(30000) programmer code end;
}
