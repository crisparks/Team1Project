package com.meritamerica.onlinebank.dto;

import com.meritamerica.onlinebank.models.Account;
import com.meritamerica.onlinebank.models.Transaction;
import com.meritamerica.onlinebank.models.TransactionType;

public class TransactionFormObject {
	private TransactionType type;
	private String tType;
	private Long tAcct;
	private Account account;
	private double amount;
	
	public TransactionType getType() { return type; }	
	public void setType(TransactionType type) { this.type = type; }
	public String gettType() { return tType; }
	public void settType(String tType) {
		this.tType = tType;
		switch (tType) {
			case "Withdrawl":
				type = TransactionType.Withdrawl;
				break;
			case "Deposit":
				type = TransactionType.Deposit;
				break;
			case "Transfer":
				type = TransactionType.Transfer;
				break;
		}		
	}
	public Long gettAcct() { return tAcct; }
	public void settAcct(Long tAcct) { this.tAcct = tAcct; }
	public Account getAccount() { return account; }
	public void setAccount(Account account) { this.account = account; }
	public double getAmount() { return amount; }
	public void setAmount(double amount) { this.amount = amount; }
	public Transaction getTransaction(Account account) {
		return new Transaction(type, amount, tAcct, account);
	}
}
