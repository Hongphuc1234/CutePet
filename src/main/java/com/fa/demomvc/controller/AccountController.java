package com.fa.demomvc.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.demomvc.entity.Account;
import com.fa.demomvc.entity.Addproduct;
import com.fa.demomvc.entity.buy;
import com.fa.demomvc.entity.notificationAccount;
import com.fa.demomvc.service.AccountService;
import com.fa.demomvc.service.ProductService;

@Controller
public class AccountController {
	@Autowired
	private AccountService accountService;
	@Autowired
	private ProductService productService;

	@GetMapping("/profile")
	public String showProfile(Model m, @RequestParam("AccountID") int AccountID, HttpSession session) {
		if (session.getAttribute("accA") == null) {
			m.addAttribute("message", "vui lòng đăng nhập !");
			return "Login";
		} else {
			Account account = accountService.findAccById(AccountID);
			m.addAttribute("upAcc", account);
			m.addAttribute("accp", productService.countproduct(AccountID));
			System.out.println(account);
			return "profile";
		}
	}

	@GetMapping("/updateAccount")
	public String updateAccount(@RequestParam(name = "AccountID") int AccountID, Model model, HttpSession session) {
		if (session.getAttribute("accA") == null) {
			model.addAttribute("message", "vui lòng đăng nhập !");
			return "Login";
		} else {
			Account account = accountService.findAccById(AccountID);
			model.addAttribute("upAcc", account);
			System.out.println(account);
			return "updateacc";
		}
	}

	@PostMapping("/saveupdate")
	public String updateAccount(@ModelAttribute(name = "RegisterForm") Account account,
			@RequestParam("Re-Pass") String rpass, @RequestParam("oldPass") String oldPass, BindingResult results,
			Model m, HttpSession session) {
		boolean check;
		if (session.getAttribute("accA") == null) {
			m.addAttribute("message", "vui lòng đăng nhập !");
			return "Login";
		} else {
			if (account.getCustomername().trim().isEmpty() || account.getUsername().trim().isEmpty()
					|| account.getPhone().trim().isEmpty()) {

				int a = account.getAccountID();
				m.addAttribute("message", "Vui lòng nhập đây đủ thông tin");
				m.addAttribute("upAcc", account);
				return "updateacc";

			} else if (oldPass.trim().isEmpty() == false) {
				if (account.getPass().length() < 8) {
					int a = account.getAccountID();
					m.addAttribute("message", "Vui lòng nhập nhập mật khẩu từ 8 kí tự");
					m.addAttribute("upAcc", account);
					return "updateacc";
				
				} else if ((check = BCrypt.checkpw(oldPass,accountService.checkpass(account.getAccountID()).getPass() ))== false) {

	
					m.addAttribute("message", "mật khẩu cũ sai");
					m.addAttribute("upAcc", account);
					return "updateacc";
				} else if (account.getPass().equals(rpass) == false) {

			
					m.addAttribute("message", "nhập lại mật khẩu sai ");
					m.addAttribute("upAcc", account);
					return "updateacc";
				}

			}

			if (oldPass.trim().isEmpty() == true) {
				account.setPass(accountService.findAccById(account.getAccountID()).getPass());
				System.out.println(accountService.findAccById(account.getAccountID()).getPass());
			}else {
				String hashPass = BCrypt.hashpw(rpass, BCrypt.gensalt(12));
				account.setPass(hashPass);
			}
			if (accountService.findAccById(account.getAccountID()).getIsAdmin() == 1) {
				account.setIsAdmin(1);
			} else {
				account.setIsAdmin(0);
			}
			
			accountService.saveOrUpdateAccount(account);
			return "redirect:/login";
		}
	}

	@PostMapping("/CheckLogin")
	public String Login(@RequestParam("Username") String Username, @RequestParam("Pass") String Pass, Model m,
			HttpSession session, HttpServletResponse response ) {
		boolean check;
		if (Username.trim().isEmpty() || Pass.trim().isEmpty()) {
			m.addAttribute("message", "Vui lòng nhập đầy đủ thông tin");
			return "Login";
		} else {
			Account accc = accountService.Login(Username);

			if ((accc != null) && (check = BCrypt.checkpw(Pass, accc.getPass()) == true)) {
				int a = accc.getAccountID();
				String b = String.valueOf(a);
				if (accc.getIsAdmin() == 1) {
					Cookie idUser = new Cookie("admin", b);
					response.addCookie(idUser);
					int ac = accc.getAccountID();
					List<notificationAccount> noti = accountService.findnoti(ac);
					List<buy> listbuy = accountService.findbuy(ac);
					List<buy> listcus = accountService.findcus(ac);
					session.setAttribute("accA", accc);
					session.setAttribute("noti", noti);
					session.setAttribute("admin",accc);
					session.setAttribute("listcus", listcus);
					session.setAttribute("listbuy", listbuy);
					System.out.println(accc.getAccountID());
					session.setMaxInactiveInterval(1200);
					session.setAttribute("accA", accc);
					session.setMaxInactiveInterval(1200);

					return "redirect:/listA";

				} else {

					Cookie idUser = new Cookie("idUser", b);
					response.addCookie(idUser);
					int ac = accc.getAccountID();
					List<notificationAccount> noti = accountService.findnoti(ac);
					List<buy> listbuy = accountService.findbuy(ac);
					List<buy> listcus = accountService.findcus(ac);
					session.setAttribute("accA", accc);				
					session.setAttribute("noti", noti);
					session.setAttribute("listcus", listcus);
					session.setAttribute("listbuy", listbuy);
					System.out.println(accc.getAccountID());
					session.setMaxInactiveInterval(1200);
					session.setAttribute("accA", accc);
					session.setMaxInactiveInterval(720000);
					return "redirect:/listA";
				}

			}

			else {
				m.addAttribute("message", "Nhập sai tên đăng nhập hoặc mật khẩu");
				return ("Login");
			}
		}
	}

	@GetMapping("/logout")
	public String Loout(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		Cookie cookie = null;
		Cookie[] cookies = null;
		cookies = request.getCookies();
		if (session.getAttribute("acc") == null && session.getAttribute("accA") == null) {
			model.addAttribute("message", "vui lòng đăng nhập !");
			return "Login";
		} else {
			session.removeAttribute("acc");
			session.removeAttribute("accA");
			session.removeAttribute("admin");
			session.removeAttribute("listcus");
			session.removeAttribute("listbuy");
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			return "Login";
		}
	}

	@GetMapping("/Register")
	public String showRegisterForm(Model model, HttpSession session) {

		model.addAttribute("RigisterForm", new Account());
		return "register";
	}

	@GetMapping("/adminpage")
	public String showAdminpage(Model model, HttpSession session) {
		if (session.getAttribute("admin")==null) {
			model.addAttribute("message", "Bạn không phải admin, vui lòng đăng nhập");
			return "Login";
		} else {
			List<Addproduct> productA = productService.findAllAdd();
			model.addAttribute("productA", productA);
			return "pheduyet";
		}
	}

	@GetMapping("/login")
	public String showLoginForm(Model model) {
		model.addAttribute("LoginForm", new Account());
		return "Login";
	}

	@PostMapping("/saveee")
	public String addNewAccount(@ModelAttribute(name = "RegisterForm") Account account,
			@RequestParam("Re-Pass") String rpass, BindingResult results, Model m, HttpSession session) {
		{
			if (account.getCustomername().trim().isEmpty() || account.getUsername().trim().isEmpty()
					|| account.getPass().trim().isEmpty() || account.getPhone().trim().isEmpty()) {
				m.addAttribute("message", "Vui lòng nhập đây đủ thông tin");
				return "register";

			} else {
				if (account.getPass().length() < 8) {
					m.addAttribute("message", "Mật khẩu tối thiểu 8 kí tự ");
					return "register";
				} else if (account.getPass().equals(rpass) == false) {
					m.addAttribute("message", "Nhập lại mật khẩu sai ");
					return "register";
				}

			}
			String passhash = BCrypt.hashpw(account.getPass(), BCrypt.gensalt(12));
	        account.setPass(passhash);
			account.setIsAdmin(0);
			accountService.saveOrUpdateAccount(account);
			return "Login";
		}
	}

}
