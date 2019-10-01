package com.meritamerica.onlinebank.repository;

import org.springframework.stereotype.Repository;

import com.meritamerica.onlinebank.models.Address;

@Repository
public interface AddressRepository extends BaseRepository<Address, Long> {}
