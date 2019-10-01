package com.meritamerica.onlinebank.dto;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import com.meritamerica.onlinebank.models.Address;
import com.meritamerica.onlinebank.models.User;
import com.meritamerica.onlinebank.validation.PasswordMatches;

@PasswordMatches
public class UserFormObj {
	
	@NotEmpty
	@NotNull
	private String firstName;

	@NotEmpty
	@NotNull
	private String lastName;
	
	@NotEmpty
	@NotNull
	private String email;

	@NotEmpty
	@NotNull
	private String password1;
	
	@NotEmpty
	@NotNull
	private String password2;

	@NotEmpty
	@NotNull
	private String line1;

	private String line2;
	
	@NotEmpty
	@NotNull
	private String city;
	
	@NotEmpty
	@NotNull
	private String state;
	
	@NotEmpty
	@NotNull
	@Pattern(regexp="^[0-9]{5}(?:-[0-9]{4})?$")
	private String zip;
	
	@Min(value=100)
	private double initalDeposit;
	
	public UserFormObj() {}
	
	public String getFirstName() { return firstName; }
	public void setFirstName(String firstName) { this.firstName = firstName; }
	public String getLastName() { return lastName; }
	public void setLastName(String lastName) { this.lastName = lastName; }
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }
	public String getPassword1() { return password1; }
	public void setPassword1(String password) { this.password1 = password; }
	public String getPassword2() { return password2; }
	public void setPassword2(String matchingPassword) { this.password2 = matchingPassword; }
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
	public double getInitalDeposit() { return initalDeposit; }
	public void setInitalDeposit(double initalDeposit) { this.initalDeposit = initalDeposit; }
	public User getUser() { return new User(firstName, lastName, email, password1, new Address(line1, line2, city, state, zip)); }

}
