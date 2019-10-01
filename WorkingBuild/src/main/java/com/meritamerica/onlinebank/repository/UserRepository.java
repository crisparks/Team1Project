package com.meritamerica.onlinebank.repository;

import java.util.Optional;

import org.springframework.stereotype.Repository;

import com.meritamerica.onlinebank.models.User;

@Repository
public interface UserRepository extends BaseRepository<User, Long> {
	Optional<User> findByEmail(String email);
}
