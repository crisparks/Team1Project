package com.meritamerica.onlinebank.controllers;

import java.util.Optional;
import javax.persistence.EntityExistsException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.meritamerica.onlinebank.dto.DashModel;
import com.meritamerica.onlinebank.dto.LoginFormObject;
import com.meritamerica.onlinebank.dto.UserFormObj;
import com.meritamerica.onlinebank.models.State;
import com.meritamerica.onlinebank.models.User;
import com.meritamerica.onlinebank.services.UserService;

@Controller
@Scope("request")
public class UserController {
	
	@Autowired UserService uService;
	
	@PutMapping("/createUser")
	public String create(Model model, @ModelAttribute("ufo") @Valid UserFormObj ufo, BindingResult result) {
        if (result.hasErrors()) {
        	model.addAttribute("error", true);
        	model.addAttribute("ufo", ufo);
    		model.addAttribute("states", State.getStates());
            return "signup.jsp";
        }
		User u = createUserAccount(ufo, result);
	    if (u == null) {
	        result.rejectValue("email", "That email address is already in use!");
        	model.addAttribute("error", true);
        	model.addAttribute("ufo", ufo);
    		model.addAttribute("states", State.getStates());
            return "signup.jsp";	        
	    }
	    model.addAttribute("msg", "Account created!  Please log in.");
        return "redirect:/";
	}
	
	private User createUserAccount(UserFormObj ufo, BindingResult result) {
	    User registered = null;
	    try {
	        registered = uService.registerNewUserAccount(ufo);
	    } catch (EntityExistsException e) {
	        return null;
	    }    
	    return registered;
	}
	
	@PostMapping("/deleteUser/{id}")
	public String deleteUser(@PathVariable("id") Long id) {
		Optional<User> oU = uService.findUserById(id);
		if (oU.isPresent()) {
			uService.deleteUser(oU.get());
		}
		return "index.jsp";
	}
	
	@PostMapping("/signin")
	public String signin(HttpServletRequest request, Model model, @Valid @ModelAttribute("lfo") LoginFormObject lfo,  BindingResult result) {
        if (!result.hasErrors()) {
			Optional<User> oU = uService.findUserByEmail(lfo.getEmail());
			if (oU.isPresent()) {
				User u = (User) oU.get();
				if (u.auth(lfo.getPassword())) {	
					request.getSession().setAttribute("user", u);
					return "redirect:/dashboard";
				}			
			}
        }
    	lfo.setFailed(true);
    	model.addAttribute("lfo", lfo);
		return "index.jsp";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, Model model) {
		request.getSession().setAttribute("user", null);
		model.addAttribute("logout", true);
		model.addAttribute("lfo", new LoginFormObject());
		return "index.jsp";
	}
	
	@GetMapping("/user-test")
	public String user_test(Model model) {
		model.addAttribute("users", uService.allUsers());
		return "user-test.jsp";
	}
}