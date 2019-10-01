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
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

@Entity
@Table(name="addresses")
public class Address implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1058485399620694896L;
	
	private Long addrId;
	private String line1;
	private String line2;
	private String city;
	private String state;
	private String zip;
    private User user;

	private Date created;

	private Date updated;
	
	public Address() {}
	public Address(String l1, String l2, String c, String s, String z) {
		line1 = l1;
		line2 = l2;
		city = c;
		state = s;
		zip = z;
	}

    @Id 
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id", unique=true, nullable=false, updatable=false)
	public Long getId() { return addrId; }
    public void setId(Long id) { this.addrId = id; }

	@Size(min=2, max=255)    
    @Column(name="line1")
	public String getLine1() { return line1; }
	public void setLine1(String line1) { this.line1 = line1; }

	@Size(max=255)
    @Column(name="line2")
	public String getLine2() { return line2; }
	public void setLine2(String line2) { this.line2 = line2; }

	@Size(min=2, max=255)
    @Column(name="city")
	public String getCity() { return city; }
	public void setCity(String city) { this.city = city; }

	@Size(min=2, max=2)
    @Column(name="state")
	public String getState() { return state; }
	public void setState(String state) { this.state = state; }
	
	@Size(min=5, max=10)
    @Column(name="zip")
	public String getZip() { return zip; }
	public void setZip(String zip) { this.zip = zip; }

    @Temporal(TemporalType.DATE)
    @Column(name = "created")
    public Date getCreated() { return created; }
    public void setCreated(Date d) { this.created = d; }

    @Temporal(TemporalType.DATE)
    @Column(name = "updated")
    public Date getUpdated() { return updated; }
    public void setUpdated(Date d) {this.updated = d; }


    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="user_id")
	public User getUser() { return user; }
	public void setUser(User user) { this.user = user; }
	
	@PrePersist
	protected void onCreate() { this.created = new Date(); }
	
	@PreUpdate
	protected void onUpdate() { this.updated = new Date(); }
}
