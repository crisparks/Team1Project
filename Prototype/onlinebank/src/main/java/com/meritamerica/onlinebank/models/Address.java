package com.meritamerica.onlinebank.models;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
	
    @Id 
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id", unique=true, nullable=false, updatable=false)
	private Long id;
    
	@Size(min=2, max=255)    
    @Column(name="line1")
	private String line1;
	
	@Size(max=255)
    @Column(name="line2")
	private String line2;
	
	@Size(min=2, max=255)
    @Column(name="city")
	private String city;
	
	@Size(min=2, max=2)
    @Column(name="state")
	private String state;
	
	@Size(min=5, max=10)
    @Column(name="zip")
	private String zip;
	
    @OneToOne(mappedBy = "address")
    private User user;

    @Temporal(TemporalType.DATE)
    @Column(name = "created")
	private Date created;

    @Temporal(TemporalType.DATE)
    @Column(name = "updated")
	private Date updated;
	
	public Address() {}
	public Address(String l1, String l2, String c, String s, String z) {
		line1 = l1;
		line2 = l2;
		city = c;
		state = s;
		zip = z;
	}
	
	public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

	public String getLine1() { return line1; }
	public void setLine1(String line1) { this.line1 = line1; }

	public String getLine2() { return line2; }
	public void setLine2(String line2) { this.line2 = line2; }

	public String getCity() { return city; }
	public void setCity(String city) { this.city = city; }

	public String getState() { return state; }
	public void setState(String state) { this.state = state; }
	

	public String getZip() { return zip; }
	public void setZip(String zip) { this.zip = zip; }
	
    public Date getCreated() { return created; }
    public void setCreated(Date d) { this.created = d; }
    
    public Date getUpdated() { return updated; }
    public void setUpdated(Date d) {this.updated = d; }

	public User getUser() { return user; }
	public void setUser(User user) { this.user = user; }
	
	@PrePersist
	protected void onCreate() { this.created = new Date(); }
	
	@PreUpdate
	protected void onUpdate() { this.updated = new Date(); }
}
