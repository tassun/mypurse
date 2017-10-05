package com.fs.bean;

import com.fs.bean.gener.*;

public class  CreditBean extends BeanSchema {	
	public CreditBean() {
	}	
	protected void initialize() {
		super.initialize();
		addSchema("account",java.sql.Types.VARCHAR,"Account");
		addSchema("credit",java.sql.Types.VARCHAR,"Credit");
	}
	public void setAccount(String newAccount) {
		setMember("account",newAccount);
	}
	public String getAccount() {
		return getMember("account");
	}
	public void setCredit(String newCredit) {
		setMember("credit",newCredit);
	}
	public String getCredit() {
		return getMember("credit");
	}
}
