package com.mnazareno.jba.annotation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.mnazareno.jba.repository.UserRepository;

public class UniqueUsernameValidator implements ConstraintValidator<UniqueUsername, String> {

	@Autowired
	private UserRepository userRepo;
	
	public void initialize(UniqueUsername constraintAnnotation) {
	}

	public boolean isValid(String value, ConstraintValidatorContext context) {
		if (userRepo == null) {
			return true;
		}
		return userRepo.findByName(value) == null;
	}

}
