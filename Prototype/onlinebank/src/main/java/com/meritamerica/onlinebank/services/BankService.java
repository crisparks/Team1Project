package com.meritamerica.onlinebank.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.meritamerica.onlinebank.models.Address;
import com.meritamerica.onlinebank.models.User;
import com.meritamerica.onlinebank.repository.AddressRepository;
import com.meritamerica.onlinebank.repository.UserRepository;

@Service
public class BankService {
	private final UserRepository uRepo;
	private final AddressRepository aRepo;
	
	public BankService(UserRepository r, AddressRepository a) { uRepo = r; aRepo = a; }
	
    public List<User> allUsers() { return uRepo.findAll(); }
    
    public User createUser(User u) { return uRepo.save(u); }
    
    public User findUserByEmail(String email) { return uRepo.findByEmail(email); }
    
    public Address createAddress(Address a) { return aRepo.save(a); }
}
