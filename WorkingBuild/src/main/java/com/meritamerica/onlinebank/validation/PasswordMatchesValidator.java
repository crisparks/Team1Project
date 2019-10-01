package com.meritamerica.onlinebank.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.meritamerica.onlinebank.dto.UserFormObj;

public class PasswordMatchesValidator 
implements ConstraintValidator<PasswordMatches, Object> { 
   
//  @Override
//  public void initialize(PasswordMatches constraintAnnotation) {       
//  }
  @Override
  public boolean isValid(Object obj, ConstraintValidatorContext context){   
      UserFormObj user = (UserFormObj) obj;
      return user.getPassword1().equals(user.getPassword2());    
  }     
}
