package com.meritamerica.onlinebank.services;

import java.util.Optional;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Service;

import com.meritamerica.onlinebank.models.Account;
import com.meritamerica.onlinebank.models.Address;
import com.meritamerica.onlinebank.repository.AccountRepository;
import com.meritamerica.onlinebank.repository.AddressRepository;
import com.meritamerica.onlinebank.repository.UserRepository;

@Service
public class AccountService {
	private final AddressRepository aRepo;
	private final AccountRepository acctRepo;
	
	public AccountService(UserRepository r, AddressRepository a, AccountRepository ac) { aRepo = a; acctRepo = ac; }
	

    
    public Address createAddress(Address a) { return aRepo.save(a); }
    
    public Account createAccount(Account a) { return acctRepo.save(a); }
    public Account updateAccount(Account a) { return acctRepo.save(a); }
    
    public Optional<Account> findAccountById(Long id) { 
    	Optional<Account> oA = acctRepo.Id(id);
    	if (oA.isPresent()) {
    		Account a = oA.get();
    		Hibernate.initialize(a.getTransactions());
    		return Optional.of(a);
    	}
    	return oA;
    }
    public Optional<Account> findByAccountNumber(Long num) { 
    	Optional<Account> oA = acctRepo.findByAccountNumber(num);
    	if (oA.isPresent()) {
    		Account a = oA.get();
    		Hibernate.initialize(a.getTransactions());
    		return Optional.of(a);
    	}
    	return oA;    	
    }
}
