package com.meritamerica.onlinebank.dto;

import com.meritamerica.onlinebank.models.AccountType;

public class NewAccountFormObject {
	private AccountType acctType;
	private Long user_id;
	private double amount;
	
	public AccountType getAcctType() { return acctType; }
	public void setAcctType(AccountType acctType) { this.acctType = acctType; }
	public double getAmount() { return amount; }
	public void setAmount(double amount) { this.amount = amount; }
	public Long getUser_id() { return user_id; }
	public void setUser_id(Long user_id) { this.user_id = user_id; }
}
