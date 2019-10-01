package com.meritamerica.onlinebank.dto;

public class CloseAccountFormObject {
	private Long acctToClose;
	private Long balanceTarget;
	
	public Long getAcctToClose() {
		return acctToClose;
	}
	public void setAcctToClose(Long acctToClose) {
		this.acctToClose = acctToClose;
	}
	public Long getBalanceTarget() {
		return balanceTarget;
	}
	public void setBalanceTarget(Long balanceTarget) {
		this.balanceTarget = balanceTarget;
	}
}
