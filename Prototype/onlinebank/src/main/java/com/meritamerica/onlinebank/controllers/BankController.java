package com.meritamerica.onlinebank.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.meritamerica.onlinebank.models.User;
import com.meritamerica.onlinebank.services.BankService;

@Controller
public class BankController {
	private final BankService service;
	
	
	public BankController(BankService b) { service = b; }
	@GetMapping("/")
	public String index(Model model) {
		return "index.jsp";
	}
	
	@PutMapping("/")
	public String add(Model model, @Valid @ModelAttribute("user") User user, BindingResult result) {
        if (result.hasErrors()) {
            return "index.jsp";
        } else {
        	service.createUser(user);
            return "redirect:/";
        }
	}
	
	@PostMapping("/signup")
	public String signup(Model model) {
		model.addAttribute("user", new User());
		return "signup.jsp";
	}
	
	
	@PutMapping("/create")
	public String create(Model model, @Valid @ModelAttribute("user") User user, BindingResult result) {
        if (result.hasErrors()) {
        	model.addAttribute("action", "New");
            return "signup.jsp";
        } else {
        	service.createUser(user);
            return "redirect:/";
        }
	}
//	public String create(Model model, @RequestParam("first") String first,
//			@RequestParam("last") String last, @RequestParam("email") String email,
//			 @RequestParam("pw") String pw,  @RequestParam("addr1") String addr1,
//			 @RequestParam("addr2") String addr2,  @RequestParam("city") String city,
//			 @RequestParam("state") String state,  @RequestParam("zip") String zip) {
//		User u = new User(first, last, email, pw, new Address(addr1, addr2, city, state, zip));
//		service.createUser(u);
//		model.addAttribute("user", u);
//		return "index.jsp";
//	}
	
	@PostMapping("/signin")
	public String signin(Model model, @RequestParam("email") String email, @RequestParam("pass") String pass) {
		User u = service.findUserByEmail(email);
		if (u.auth(pass)) {
			model.addAttribute("user", u);
			return "dashboard";
		}
		model.addAttribute("failed", true);
		return "login";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(Model model) {
		
		return "dashboard.jsp";
	}
	
	
	
	
	
	/////////////////////////////////////////////
	
	
	
	
	
	@GetMapping("/user-test")
	public String user_test(Model model) {
		model.addAttribute("users", service.allUsers());
		return "user-test.jsp";
	}
	
	
	
	
	
	
	//////////////////////////////////////////////
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
