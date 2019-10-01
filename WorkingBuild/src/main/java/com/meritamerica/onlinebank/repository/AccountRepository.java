package com.meritamerica.onlinebank.repository;

import java.util.Optional;

import org.springframework.stereotype.Repository;

import com.meritamerica.onlinebank.models.Account;

@Repository
public interface AccountRepository extends BaseRepository<Account, Long> {
	Optional<Account> findByAccountNumber(Long num);
}
