package com.meritamerica.onlinebank.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meritamerica.onlinebank.models.Transaction;
import com.meritamerica.onlinebank.repository.TransactionRepository;

@Service
public class TransactionService {
	@Autowired private TransactionRepository tRepo;
	
	public void saveTransaction(Transaction t) { tRepo.save(t); }
}
