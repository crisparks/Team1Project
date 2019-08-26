package com.meritamerica.onlinebank.models;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name="accounts")
public abstract class Account implements Serializable {
	private static final long serialVersionUID = -6931308272159535229L;

	/**
	 * Base class for all account types
	 */
	
	public enum AccountType {
		SAVINGS,
		CHECKING,
		DBACHECK,
		CD,
		REGIRA,
		ROTHIRA,
		ROLLIRA
	}
	
	private Long acctId;
	private int acctNumber;
	AccountType acctType;
	private double acctBalance;
	private double acctRate;	
	private User user;
	private Date acctCreated;
	private Date acctUpdated;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="acct_id", unique=true, nullable=false, updatable=false)
	public Long getId() { return acctId; }
	public void setId(Long l) { acctId = l; }
	
	@Column(name="acct_number", unique=true, nullable=false, updatable=false)
	public int getAccountNumber() { return acctNumber; }
	public void setAccountNumber(int num) { acctNumber = num; }
	
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
	
	@ManyToOne(fetch=FetchType.LAZY, optional=false)
	@JoinColumn(name="user_id", nullable=false)
	@OnDelete(action=OnDeleteAction.CASCADE)
	public User getUser() { return user; }
	public void setUser(User user) { this.user = user; }
	
    @Temporal(TemporalType.DATE)
    @Column(name = "acct_created")
    public Date getCreated() { return acctCreated; }
    public void setCreated(Date created) {this.acctCreated = created; }
    
    @Temporal(TemporalType.DATE)
    @Column(name = "acct_updated")
    public Date getUpdated() { return acctUpdated; }
    public void setUpdated(Date updated) {this.acctUpdated = updated; }
    
	public abstract double deposit(Transaction t);		// Returns new balance
	public abstract double withdraw(Transaction t);		// "	"	"	"	"
	
	@PrePersist
	protected void onCreate() { this.acctCreated = new Date(); }
	
	@PreUpdate
	protected void onUpdate() { this.acctUpdated = new Date(); }
}