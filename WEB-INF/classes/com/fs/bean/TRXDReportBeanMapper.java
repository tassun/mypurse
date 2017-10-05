package com.fs.bean;
/*
 * SCCS id: $Id$
 * System Name: Internet Securities Backoffice System
 * Copyright: Freewill Solutions Co., Ltd.
 * Program id: $RCSfile$
 * Description: TRXDReportBeanMapper class implements for handle mapping class
 * Version: $Revision$
 * Programmer: $Author$
 * Creation date: Sun Sep 03 09:44:51 ICT 2017
 */
/**
 * TRXDReportBeanMapper class implements for handle mapping class.
 */
import com.fs.bean.gener.*;
//#import anything the right time
//#(10000) programmer code begin;
//#(10000) programmer code end;
public class TRXDReportBeanMapper extends BeanMap {
public TRXDReportBeanMapper() {
	super();
}
protected void initialize() {
	super.initialize();
	mapClass("com.fs.bean.TRXDReportData");
	//#other initial give me a reason
	//#(20000) programmer code begin;
	//#(20000) programmer code end;
}
public String fetchVersion() {
	return super.fetchVersion()+TRXDReportBeanMapper.class+"=$Revision$\n";
}
//#another methods defined irresistible
//#(30000) programmer code begin;
//#(30000) programmer code end;
}
