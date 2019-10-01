package com.meritamerica.onlinebank.models;


public enum AccountType {
	Closed,
	Savings,
	Checking,
	DbaChecking,
	CD12,
	CD24,
	CD36,
	RegIra,
	RothIra,
	RollIra,
	NonAcct;
	
    private AccountType() {}
	
	public static String[] getTypes() {
		return new String[] {
			"Savings",
			"Checking",
			"DbaChecking",
			"CD",
			"RegIra",
			"RothIra",
			"RollIra"
		};			      
	}
}
