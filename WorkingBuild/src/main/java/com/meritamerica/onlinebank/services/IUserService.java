package com.meritamerica.onlinebank.services;

import javax.persistence.EntityExistsException;

import com.meritamerica.onlinebank.dto.UserFormObj;
import com.meritamerica.onlinebank.models.User;

public interface IUserService {
    User registerNewUserAccount(UserFormObj ufo)     
      throws EntityExistsException;
}