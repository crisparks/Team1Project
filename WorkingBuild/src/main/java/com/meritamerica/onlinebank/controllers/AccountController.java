package com.meritamerica.onlinebank.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.meritamerica.onlinebank.dto.DashModel;
import com.meritamerica.onlinebank.models.Account;
import com.meritamerica.onlinebank.models.AccountType;
import com.meritamerica.onlinebank.models.CdOption;
import com.meritamerica.onlinebank.models.Transaction;
import com.meritamerica.onlinebank.models.TransactionType;
import com.meritamerica.onlinebank.models.User;
import com.meritamerica.onlinebank.services.AccountService;
import com.meritamerica.onlinebank.services.UserService;

@Controller
@Scope("request")
public class AccountController {
	@Autowired private UserService uService;
	@Autowired private AccountService aService;
	
	public AccountController() {}
	
	@PostMapping("/openAccount")
	public String openAccount(Model model, @ModelAttribute("dm") DashModel dm) {
		model.addAttribute("dm", dm);
		return "open.jsp";
	}
	
	@PostMapping("/createAccount")
	public String createAccount(HttpServletRequest request, @ModelAttribute("dm") DashModel dm, Model model) {
		User u = (User) request.getSession().getAttribute("user");
		if (u == null) {
			return "redirect:/";
		}
		List<Account> userAccounts = u.getAccounts();
		Account a = null;
		switch(dm.nafo.getAcctType()) {
		
		case Savings:
			for (Account aa : userAccounts) {
				if (aa.getAccountType() == AccountType.Savings) {
					dm.error = "Only one savings account allowed per account holder!";
					break;
				}
			}
			a = new Account(
						System.currentTimeMillis() / 10000,
						AccountType.Savings,
						0.0,
						1.2,
						u
					);
			break;
		case Checking:
			for (Account aa : userAccounts) {
				if (aa.getAccountType() == AccountType.Checking) {
					dm.error = "Only one personal checking account allowed per account holder!";
					break;
				}
			}
			a = new Account(
						System.currentTimeMillis() / 10000,
						AccountType.Checking,
						0.0,
						0.6,
						u
					);
			break;
		case DbaChecking:
			int dbas = 0;
			for (Account aa : userAccounts) {
				if (aa.getAccountType() == AccountType.DbaChecking) { ++dbas; }
				if (dbas > 2) {
					dm.error = "Only three DBA checking accounts allowed per account holder!";
					break;
				}
			}
			a = new Account(
						System.currentTimeMillis() / 10000,
						AccountType.DbaChecking,
						0.0,
						0.6,
						u
					);
			break;
		case CD12:
		case CD24:
		case CD36:
			double amount = dm.nafo.getAmount();
			List<Account> cds = new ArrayList<>();
			for (Account aa : userAccounts) {
				AccountType at = aa.getAccountType(); 
				if ((at == AccountType.CD12) || (at == AccountType.CD24) || (at == AccountType.CD36)) { cds.add((aa)); }
				//Add display of all CD accounts
			}
			
			double rateMul = 0.0;
			if (amount < 5000.00) {
				rateMul = 1;
			} else if (amount < 50000.00) {
				rateMul = 3;
			} else {
				rateMul = 2;
			}
			List<CdOption> options = new ArrayList<>();
			for (int i = 0; i < 3; i++) {
				options.add(new CdOption(i, (int)rateMul * 1, (double)rateMul * 1.5));
			}
			model.addAttribute("options", options);
			model.addAttribute("cds", cds);
			model.addAttribute("amount", amount);
			
			return "openCd.jsp";
		case RegIra:
			a = new Account(
					System.currentTimeMillis() / 10000,
					AccountType.RegIra,
					0.0,
					0.0,
					u
				);				
			break;
		case RothIra:
			a = new Account(
					System.currentTimeMillis() / 10000,
					AccountType.RothIra,
					0.0,
					0.0,
					u
				);				
			break;
		case RollIra:
			a = new Account(
					System.currentTimeMillis() / 10000,
					AccountType.RollIra,
					0.0,
					0.0,
					u
				);				
			break;
		case Closed:
			break;
		default:
			break;
		}
		if (!dm.error.isEmpty()) {
			model.addAttribute("error", true);
			return "dashboard/dashboard.jsp";
		}
		Transaction t = new Transaction(TransactionType.Deposit, dm.nafo.getAmount(), Account.CASH, a, "Initial Deposit");
//		aService.createAccount(a);
		a.transact(t);
//		tService.saveTransaction(t);
		u.addAccount(a);
		uService.updateUser(u);
		dm.setDefaults(u);
		dm.account = a;
		model.addAttribute("dm", dm);
		return "redirect:/dashboard";	
	}
	
	@PostMapping("/openCd")
	public String openCd(HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute("user");
		double amount = (double) request.getSession().getAttribute("amount");
		Account a = new Account(
				System.currentTimeMillis() / 10000,
				AccountType.CD12,
				0.0,
				0.0,
				u
			);
		return "";
	}
	
	@PostMapping("/closeAccount")
	public String closeAccount(HttpServletRequest request, Model model, @ModelAttribute("dm") DashModel dm) {
		User u = (User)request.getSession().getAttribute("user");
		dm.error = "";
		Long acctToClose = dm.cafo.getAcctToClose();
		Long balanceTarget = dm.cafo.getBalanceTarget();
		if (acctToClose.compareTo(balanceTarget) == 0) {
			dm.error = "Balance must be deposited into different account!";
			model.addAttribute("dm", dm);
			return "/dashboard/dashboard.jsp";
		}
		Optional<Account> oA = aService.findByAccountNumber(acctToClose);
		Optional<Account> oB = aService.findByAccountNumber(balanceTarget);
		Account a = null, b = null;
		if (oA.isPresent()) {
			a = oA.get();
		} else {
			dm.error = "Account to close not found!";
		}
		if (oB.isPresent()) {
			b = oB.get();
		} else {
			dm.error = "Target account for balance deposit not found!";
		}
		if (dm.error.length() > 0) {
			model.addAttribute("dm", dm);
			return "dashboard/close.jsp";
		}
		Transaction tClose = new Transaction(TransactionType.Withdrawl, a.getBalance(), Account.CASH, a, "Closed Account");
		Transaction tDep = new Transaction(TransactionType.Deposit, a.getBalance(), Account.CASH, b, "From closing account: " + acctToClose);
		
		a.transact(tClose);
		b.transact(tDep);
		
		a.setAccountType(AccountType.Closed);
		aService.updateAccount(a);
		aService.updateAccount(b);
		uService.updateUser(u);
		request.getSession().setAttribute("user", u);
		request.getSession().setAttribute("acct", b.getId());
		return "redirect:/dashboard";
	}
}
