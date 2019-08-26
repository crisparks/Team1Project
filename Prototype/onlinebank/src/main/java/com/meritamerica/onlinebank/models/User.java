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
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

@Entity
@Table(name="users")
public class User implements Serializable {
	
	private static final long serialVersionUID = -2918666379427911469L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id", unique=true, nullable=false, updatable=false)	
	private Long id;
	
	@Size(min=2, max=80)
    @Column(name="first_name")
	private String firstName;
    
	@Size(min=2, max=80)
    @Column(name="last_name")
	private String lastName;

	@Size(min=7, max=255)
    @Column(name="email")
	private String email;
	
	@Size(min=8, max=24)
    @Column(name="password")
	private String password;
	
    @Temporal(TemporalType.DATE)
    @Column(name = "created")
	private Date userCreated;
    
    @Temporal(TemporalType.DATE)
    @Column(name = "updated")
	private Date userUpdated;
	
    @OneToOne(fetch=FetchType.EAGER, cascade = CascadeType.MERGE)
    @JoinColumn(name="id")
    private Address address;
    
    
//    private Set<Account> userAccounts;
	
	public User() {}
	public User(String f, String l, String e, String p, Address a) {
		firstName = f;
		lastName = l;
		email = e;
		password = p;
		address = a;
		address.setUser(this);
	}
	
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    

	public String getFirstName() { return firstName; }
	public void setFirstName(String firstName) { this.firstName = firstName; }
	
	public String getLastName() { return lastName; }
	public void setLastName(String lastName) { this.lastName = lastName; }
	
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }
	
	public String getPassword() { return password; }
	public void setPassword(String pw) {
		// TODO make accessible to elevated permissions only
		password = pw;
	}

    public Address getAddress() { return address; }
	public void setAddress(Address address) { this.address = address; } //  this.address.setUser(this); }
	
//    @JoinColumn(name = "acct_id")
//    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//    public Set<Account> getAccounts() { return userAccounts; }
//	public void setAccounts(Set<Account> accounts) { this.userAccounts = accounts; }

    public Date getCreated() { return userCreated; }
    public void setCreated(Date created) {this.userCreated = created; }

    public Date getUpdated() { return userUpdated; }
    public void setUpdated(Date updated) {this.userUpdated = updated; }

	
	public boolean auth(String p) { return password.contentEquals(p); }
	
	@PrePersist
	protected void onCreate() { this.userCreated = new Date(); }
	
	@PreUpdate
	protected void onUpdate() { this.userUpdated = new Date(); }
	
}
