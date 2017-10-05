package com.fs.bean;
/*
 * SCCS id: $Id$
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: $RCSfile$
 * Description: TRegisterBeanMapper class implements for handle mapping class
 * Version: $Revision$
 * Programmer: $Author$
 * Creation date: Fri Sep 01 13:44:21 ICT 2017
 */
/**
 * TRegisterBeanMapper class implements for handle mapping class.
 */
import com.fs.bean.gener.*;
//#import anything the right time
//#(10000) programmer code begin;
//#(10000) programmer code end;
public class TRegisterBeanMapper extends BeanMap {
public TRegisterBeanMapper() {
	super();
}
protected void initialize() {
	super.initialize();
	mapClass("com.fs.bean.TRegisterData");
	//#other initial give me a reason
	//#(20000) programmer code begin;
	//#(20000) programmer code end;
}
public String fetchVersion() {
	return super.fetchVersion()+TRegisterBeanMapper.class+"=$Revision$\n";
}
//#another methods defined irresistible
//#(30000) programmer code begin;
//#(30000) programmer code end;
}
