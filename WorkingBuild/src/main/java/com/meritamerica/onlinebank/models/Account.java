package com.meritamerica.onlinebank.models;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="accounts")
public class Account implements Serializable {
	private static final long serialVersionUID = -6931308272159535229L;
	public static final Long CASH = -1111111L;
	public static final Long CHECK = -2222222L;
	public static final Long ATM = -3333333L;

	protected Long acctId;
	protected Long acctNumber;
	protected AccountType acctType;
	protected double acctBalance;
	protected double acctRate;	
	protected User user;
	private List<Transaction> transactions;
	protected Date acctCreated;
	protected Date acctUpdated;
	
	public Account() { transactions = new ArrayList<>(); }
	public Account(Long num, AccountType type, double bal, double rate, User u) {
		acctNumber = num;
		acctType = type;
		acctBalance = bal;
		acctRate = rate;
		user = u;
		transactions = new ArrayList<>();
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="acct_id", unique=true, nullable=false, updatable=false)
	public Long getId() { return acctId; }
	public void setId(Long l) { acctId = l; }
	
	@Column(name="acct_number", unique=true, nullable=false, updatable=false)
	public Long getAccountNumber() { return acctNumber; }
	public void setAccountNumber(Long num) { acctNumber = num; }
	
	@Column(name="acct_type")
	public AccountType getAccountType() { return acctType; }
	public void setAccountType(AccountType acctType) { this.acctType = acctType; }
	
	@Column(name="acct_balance")
	public double getBalance() { return acctBalance; }
	protected void setBalance(double amt) {
		// TODO make accessible to elevated permissions only
		acctBalance = amt;
	}
	
	@Column(name="acct_rate")
	public double getRate() { return acctRate; }
	public void setRate(double r) {
		// TODO make accessible to elevated permissions only
		acctRate = r; 
	}
	
	@ManyToOne(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	@JoinColumn(name="user_id")
	public User getUser() { return user; }
	public void setUser(User user) { this.user = user; }
	
    @OneToMany(mappedBy="account", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
    public List<Transaction> getTransactions() {
    	return transactions;
    }
	public void setTransactions(List<Transaction> transactions) {
		this.transactions = transactions;
	}
	
	@Temporal(TemporalType.DATE)
    @Column(name = "acct_created")
    public Date getCreated() { return acctCreated; }
    public void setCreated(Date created) {this.acctCreated = created; }
    
    @Temporal(TemporalType.DATE)
    @Column(name = "acct_updated")
    public Date getUpdated() { return acctUpdated; }
    public void setUpdated(Date updated) {this.acctUpdated = updated; }
    
    public double transact(Transaction t) {
		t.setAccount(this);
		transactions.add(t);
    	switch (t.getType()) {
			case Deposit:
				acctBalance += t.getAmount();
				break;
    		case Withdrawl:
    		case Transfer:
    			acctBalance -= t.getAmount();
    			break;
    		default: break;
    	}
    	return acctBalance;
    }
	
	@PrePersist
	private void onCreate() { this.acctCreated = new Date(); }
	
	@PreUpdate
	private void onUpdate() { this.acctUpdated = new Date(); }

	@Override
	public String toString() {
		String tName = acctType.name();
		String s = String.format("%s (%04d)", tName, acctNumber % 10000); 
		return s;
	}
	
	public String acctType() { return acctType.name(); }
	
	public boolean compareTo(Account a) {
		if (a == null) return false;
		return a.getAccountNumber() == this.acctNumber;
	}
}