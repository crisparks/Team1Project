package com.meritamerica.onlinebank.services;

import java.util.List;
import java.util.Optional;
import javax.persistence.EntityExistsException;
import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meritamerica.onlinebank.dto.UserFormObj;
import com.meritamerica.onlinebank.models.Account;
import com.meritamerica.onlinebank.models.AccountType;
import com.meritamerica.onlinebank.models.User;
import com.meritamerica.onlinebank.repository.AccountRepository;
import com.meritamerica.onlinebank.repository.AddressRepository;
import com.meritamerica.onlinebank.repository.UserRepository;

@Service
public class UserService implements IUserService {
	@Autowired UserRepository uRepo;
    @Autowired AccountRepository acctRepo;
    @Autowired AddressRepository addrRepo;
    
    public UserService() {}
    
    public List<User> allUsers() { return uRepo.findAll(); }
    
    public User createUser(User u) { return uRepo.save(u); }
    
    public User updateUser(User u) { return uRepo.save(u); }
    
    public void deleteUser(User u) { uRepo.delete(u); }
    
    public Optional<User> findUserByEmail(String email) {
    	if (email.equalsIgnoreCase("admin")) {
    		return User.getAdminUser();
    	}
    	Optional<User> oU = uRepo.findByEmail(email);
    	if (oU.isPresent()) {
    		User u = oU.get();
    		Hibernate.initialize(u.getAccounts());
    		return Optional.of(u);
    	}
    	return oU;
    }
    
    public Optional<User> findUserById(Long id) { return uRepo.Id(id); }
     
    @Transactional
    @Override
    public User registerNewUserAccount(UserFormObj ufo) throws EntityExistsException {
         
        if (emailExists(ufo.getEmail())) {   
            throw new EntityExistsException(
              "There is an account with that email address:"  + ufo.getEmail());
        }
        User u = ufo.getUser();
        addrRepo.save(u.getAddress());
        Account acct = new Account((System.currentTimeMillis() / 1000), AccountType.Savings, ufo.getInitalDeposit(), 1.2, u);
    	u.addAccount(acct);
    	acctRepo.save(acct);
        return uRepo.save(u);       
    }
    
    private boolean emailExists(String email) {
        Optional<User> user = uRepo.findByEmail(email);
        if (user.isPresent()) {
            return true;
        }
        return false;
    }
}
