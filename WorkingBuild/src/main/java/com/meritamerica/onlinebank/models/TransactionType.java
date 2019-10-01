package com.meritamerica.onlinebank.models;

public enum TransactionType {
	Withdrawl,
	Deposit,
	Transfer,
	Accrue,
	Invalid;
	
    private TransactionType() {}
    
    public String[] getUserTypes() {
    	return new String[]{"Withdrawl", "Deposit", "Transfer"};
    }
}		      
