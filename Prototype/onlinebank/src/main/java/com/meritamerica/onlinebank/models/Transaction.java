package com.meritamerica.onlinebank.models;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
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

	private Long trans_id;
	private TransactionType type;
	private double amount;
	private String source;
	private String target;
	private Date created;
	private Date updated;

	public Transaction() {}

	public Transaction(TransactionType ty, double a, String s, String t) {
		type = ty;
		amount = a;
		source = s;
		target = t;
	}

	@Id
	@Column(name = "trans_id", unique = true, nullable = false, updatable = false)
	public Long getTrans_id() { return trans_id; }
	public void setTrans_id(Long trans_id) { this.trans_id = trans_id; }
	
	@Column(name = "trans_type")
	public TransactionType getType() { return type; }
	public void setType(TransactionType type) { this.type = type; }
	
	@Column(name = "trans_amount")
	public double getAmount() { return amount; }
	public void setAmount(double amount) { this.amount = amount; }
	
	@Column(name = "trans_source")
	public String getSource() { return source; }
	public void setSource(String source) { this.source = source; }
	
	@Column(name = "trans_target")
	public String getTarget() { return target; }
	public void setTarget(String target) { this.target = target; }
	
	@Temporal(TemporalType.DATE)
	@Column(name = "trans_created")
	public Date getCreated() { return created; }
	public void setCreated(Date created) { this.created = created; }
	
	@Temporal(TemporalType.DATE)
	@Column(name = "trans_updated")
	public Date getUpdated() { return updated; }
	public void setUpdated(Date updated) { this.updated = updated; }
	
	@PrePersist
	protected void onCreate() { this.created = new Date(); }
	
	@PreUpdate
	protected void onUpdate() { this.updated = new Date(); }

	public enum TransactionType {WITHDRAWL, DEPOSIT, TRANSFER, ACCRUE; }

}
