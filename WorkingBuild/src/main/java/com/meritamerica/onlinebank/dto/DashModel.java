package com.meritamerica.onlinebank.dto;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.meritamerica.onlinebank.models.Account;
import com.meritamerica.onlinebank.models.AccountType;
import com.meritamerica.onlinebank.models.User;

public class DashModel {


	public NewAccountFormObject nafo;
	public CloseAccountFormObject cafo;
	public TransactionFormObject tfo;
	public User user;
	public Account account;
	public boolean tfoError;
	public boolean nafoError;
	public boolean cafoError;
	public String error;
	private boolean showClose;
	
	public DashModel() {
		nafo = new NewAccountFormObject();
		tfo = new TransactionFormObject();
		account = new Account();
		tfoError = false;
		nafoError = false;
		error = "";
		setShowClose(false);
	}	
	
	public void setDefaults(User user) {
		this.user = user;
		this.account = user.getAccounts().get(0);
		this.nafo = new NewAccountFormObject();
		this.setCafo(new CloseAccountFormObject());
		this.tfo = new TransactionFormObject();
		this.nafoError = false;
		this.cafoError = false;
		this.tfoError = false;
		this.error = "";
		setShowClose(false);
	}
	
	public static DashModel getDefault(User user) {
		DashModel ret = new DashModel();
		ret.user = user;
		ret.account = user.getAccounts().get(0);
		ret.nafo = new NewAccountFormObject();
		ret.setCafo(new CloseAccountFormObject());
		ret.tfo = new TransactionFormObject();
		ret.nafoError = false;
		ret.cafoError = false;
		ret.tfoError = false;
		ret.error = "";
		ret.setShowClose(false);
		return ret;
	}
	
	public List<String> getTransactionTypes() {
		return new ArrayList<String>(Arrays.asList(
			"Withdrawl",
			"Deposit",
			"Transfer"
		));
	}
	
	public String[] getAccountTypes() {
		return AccountType.getTypes();
	}
	
	public Map<Long, String> getNonAccountTypes() {
		Map<Long, String> ret = new HashMap<>();
		ret.put(Account.CASH, "Cash");
		ret.put(Account.CHECK, "Check");
		ret.put(Account.ATM, "ATM");
		return ret;
	}
	
	public User getUser() { return user; }
	public void setUser(User user) { this.user = user; }
	public Account getAccount() { return account; }
	public void setAccount(Account account) { this.account = account; }
	public String getError() { return error; }
	public void setError(String error) { this.error = error; }
	public NewAccountFormObject getNafo() { return nafo; }
	public void setNafo(NewAccountFormObject nafo) { this.nafo = nafo; }
	public CloseAccountFormObject getCafo() { return cafo; }
	public void setCafo(CloseAccountFormObject cafo) { this.cafo = cafo; }
	public TransactionFormObject getTfo() { return tfo; }
	public void setTfo(TransactionFormObject tfo) { this.tfo = tfo; }
	public boolean isNafoError() { return nafoError; }
	public void setNafoError(boolean nafoError) { this.nafoError = nafoError; }
	public boolean isTfoError() { return tfoError; }
	public void setTfoError(boolean tfoError) { this.tfoError = tfoError; }

	public boolean isShowClose() {
		return showClose;
	}

	public void setShowClose(boolean showClose) {
		this.showClose = showClose;
	}
}
