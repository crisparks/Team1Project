package com.meritamerica.onlinebank.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.meritamerica.onlinebank.models.User;

@Repository
public interface BankRepository extends CrudRepository<User, Long> {
    List<User> findAll();
}
