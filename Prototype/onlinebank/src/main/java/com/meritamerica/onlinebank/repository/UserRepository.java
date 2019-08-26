package com.meritamerica.onlinebank.repository;

import org.springframework.stereotype.Repository;

import com.meritamerica.onlinebank.models.User;

@Repository
public interface UserRepository extends BaseRepository<User, Long> {
	User findByEmail(String email);
}
