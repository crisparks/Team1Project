package com.meritamerica.onlinebank.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import com.meritamerica.onlinebank.dto.DashModel;
import com.meritamerica.onlinebank.models.Account;
import com.meritamerica.onlinebank.models.User;
import com.meritamerica.onlinebank.services.AccountService;

@Controller
public class DashboardController {
	private final AccountService service;
	
	public DashboardController(AccountService b) { service = b; }
	
	@PostMapping("/dashboard")
	public String dash(HttpServletRequest request, Model model) {
		User user = (User) request.getSession().getAttribute("user");
		DashModel dm = DashModel.getDefault(user);
		model.addAttribute("dm", dm);
		return "/dashboard/dashboard.jsp";
	}
	
	@GetMapping("/dashboard")
	public String dashGet(HttpServletRequest request, Model model) {
		Long acctId = (Long)request.getSession().getAttribute("acct");
		User user = (User) request.getSession().getAttribute("user");
		DashModel dm = DashModel.getDefault(user);
		if (acctId != null) {
			Optional<Account> oA = service.findAccountById(acctId);
			if (oA.isPresent())
				dm.setAccount(oA.get());
		}
		model.addAttribute("dm", dm);
		return "/dashboard/dashboard.jsp";
	}
	
	@GetMapping("/dashboard/acctView/{id}")
	public String acctView(HttpServletRequest request, Model model, @PathVariable("id") Long id) {
		User u = (User)request.getSession().getAttribute("user");
		DashModel dm = DashModel.getDefault(u);
		Optional<Account> oA = service.findAccountById(id);
		if (oA.isPresent()) {
			dm.account = (Account)oA.get();
		}
		model.addAttribute("dm", dm);
		return "/dashboard/acctView.jsp";
	}
	
	@GetMapping("/dashboard/open")
	public String dOpen(HttpServletRequest request, Model model) {
		User u = (User)request.getSession().getAttribute("user");
		DashModel dm = DashModel.getDefault(u);
		model.addAttribute("dm", dm);
		return "/dashboard/open.jsp";
	}
	
	@GetMapping("/dashboard/close")
	public String dClose(HttpServletRequest request, Model model) {
		User u = (User) request.getSession().getAttribute("user");
		DashModel dm = DashModel.getDefault(u);
		model.addAttribute("dm", dm);
		List<Account> acctList = new ArrayList<>();
		for (Account a : u.getAccounts()) 
			if (a.acctType() != "Closed") 
				acctList.add(a);
		model.addAttribute("accts", acctList);
		return "/dashboard/close.jsp";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}