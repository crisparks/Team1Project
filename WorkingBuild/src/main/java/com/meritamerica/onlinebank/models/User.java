package com.meritamerica.onlinebank.models;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

@Entity
@Table(name="users")
public class User implements Serializable {
	
	private static final long serialVersionUID = -2918666379427911469L;
		
	private Long userId;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private Date userCreated;
	private Date userUpdated;
    private Address address;
    private List<Account> accounts;
    
    public User() {
		accounts = new ArrayList<>(); 
	}
	
	public User(String f, String l, String e, String p, Address a) {
		firstName = f;
		lastName = l;
		email = e;
		password = p;
		address = a;
		if (a != null) address.setUser(this);
		accounts = new ArrayList<>(); 
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="user_id", unique=true, nullable=false, updatable=false)
    public Long getId() { return userId; }
    public void setId(Long id) { this.userId = id; }
    	
	@Size(min=2, max=80)
    @Column(name="first_name")
	public String getFirstName() { return firstName; }
	public void setFirstName(String firstName) { this.firstName = firstName; }

	@Size(min=2, max=80)
    @Column(name="last_name")
	public String getLastName() { return lastName; }
	public void setLastName(String lastName) { this.lastName = lastName; }

	@Size(min=7, max=255)
    @Column(name="email")
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }

	@Size(min=8, max=24)
    @Column(name="password")
	public String getPassword() { return password; }
	public void setPassword(String pw) {
		// TODO make accessible to elevated permissions only
		password = pw;
	}

    @OneToOne(mappedBy="user", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
    public Address getAddress() { return address; }
	public void setAddress(Address address) {
		if (address == null) return;
		this.address = address; 
		this.address.setUser(this);
	}
	
    @OneToMany(mappedBy="user", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
    public List<Account> getAccounts() { return accounts; }
	public void setAccounts(List<Account> accounts) { this.accounts = accounts; }	
	
	@Temporal(TemporalType.DATE)
    @Column(name = "created")
    public Date getCreated() { return userCreated; }
    public void setCreated(Date created) {this.userCreated = created; }

    @Temporal(TemporalType.DATE)
    @Column(name = "updated")
    public Date getUpdated() { return userUpdated; }
    public void setUpdated(Date updated) {this.userUpdated = updated; }
	
	@PrePersist
	protected void onCreate() { this.userCreated = new Date(); }
	
	@PreUpdate
	protected void onUpdate() { this.userUpdated = new Date(); }

	public boolean auth(String p) { return password.contentEquals(p); }
	
	public void addAccount(Account account) {
		if (accounts == null) accounts = new ArrayList<>();
		account.setUser(this);
		this.accounts.add(account);
	}
	
	@Transient
	public String getName() { return String.format("%s %s", firstName, lastName); }
	
	@Transient
	public String getCreatedDate() {
        return new SimpleDateFormat("ddMMMyyyy").format(userCreated);
	}
	
	@Transient
	public static Optional<User> getAdminUser() {
		Address a = new Address("123 Admin St", "", "Adminton", "Adminnesota", "25333");
		return Optional.of(new User("Admin", "", "admin", "admin", a));
	}
	
	@Override
	public String toString() {
		return firstName + " " + lastName;
	}
}
