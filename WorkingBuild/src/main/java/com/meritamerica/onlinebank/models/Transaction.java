package com.meritamerica.onlinebank.models;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "transactions")
public class Transaction implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2544412963883579011L;

	private Long id;
	private TransactionType type;
	private String description;
	private double amount;
	private Long other;
	private Account account;
	private boolean success;
	private Date created;

	public Transaction() {}

	public Transaction(TransactionType ty, double a, Long t, Account acct) {
		type = ty;
		amount = a;
		other = t;
		account = acct;
		description = "-transaction-";
	}
	
	public Transaction(TransactionType ty, double a, Long t, Account acct, String desc) {
		type = ty;
		amount = a;
		other = t;
		account = acct;
		description = desc;
	}

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "trans_id", unique = true, nullable = false, updatable = false)
	public Long getId() { return id; }
	public void setId(Long trans_id) { this.id = trans_id; }
	
	@Column(name = "trans_type", nullable = false, updatable = false)
	public TransactionType getType() { return type; }
	public void setType(TransactionType type) { this.type = type; }
	
	@Column(name="trans_description", nullable = false, updatable = false)
	public String getDescription() { return description; }
	public void setDescription(String description) { this.description = description; }

	@Column(name = "trans_amount", nullable = false, updatable = false)
	public double getAmount() { return amount; }
	public void setAmount(double amount) { this.amount = amount; }
	
	@Column(name = "trans_other", nullable = false, updatable = false)
	public Long getOther() { return other; }
	public void setOther(Long target) { this.other = target; }
	
	@ManyToOne(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	@JoinColumn(name="acct_id")
	public Account getAccount() { return account; }
	public void setAccount(Account account) { this.account = account; }

	@Column(name="success", nullable=false, updatable = false)
	public boolean isSuccess() { return success; }
	public void setSuccess(boolean success) { this.success = success; }

	@Temporal(TemporalType.DATE)
	@Column(name = "trans_created", nullable = false, updatable = false)
	public Date getCreated() { return created; }
	public void setCreated(Date created) { this.created = created; }
		
	@PrePersist
	protected void onCreate() { this.created = new Date(); }
}
