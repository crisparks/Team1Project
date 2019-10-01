package com.meritamerica.onlinebank.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import com.meritamerica.onlinebank.dto.LoginFormObject;
import com.meritamerica.onlinebank.dto.UserFormObj;
import com.meritamerica.onlinebank.models.State;

@Controller
public class BankController {
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("lfo", new LoginFormObject());
		return "index.jsp";
	}

	@PostMapping("/signup")
	public String signup(Model model) {
		model.addAttribute("states", State.getStates());
		model.addAttribute("ufo", new UserFormObj());
		return "signup.jsp";
	}
	
	@GetMapping("/{which}")
	public String fluff(Model model, @PathVariable("which") String which) {
		switch(which) {
			case "about":
				return "about.jsp";
			case "contact":
				return "contact.jsp";
			case "locations":
				return "locations.jsp";
		}
		model.addAttribute("lfo", new LoginFormObject());
		return "index.jsp";
	}
	
	/////////////////////////////////////////////

	@PostMapping("/admin")
	public String admin() {
		return "admin.jsp";
	}
	
	//////////////////////////////////////////////
	
}
