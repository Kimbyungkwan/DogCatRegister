package com.dcr.application;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dcr.application.service.ILostPetService;
import com.dcr.application.service.IPetService;
import com.dcr.application.service.IUserService;
import com.dcr.application.util.LoginCommand;

@Controller
public class MyController {

	@Autowired
	IPetService pet;

	@Autowired
	ILostPetService lostPet;
	
	@Autowired
	IUserService user;

	
	@RequestMapping(value = {"/","/home"})
	public String root(Model model) throws Exception {
		model.addAttribute("newPetlist", pet.newPetList());
		model.addAttribute("newLostPetList", lostPet.mainLostPetList());

		return "home";
	}

	@RequestMapping(value="member/login", method=RequestMethod.GET)
	public String memberLogin() {
		return "login";
	}
	
	@RequestMapping(value="member/login", method=RequestMethod.POST)
	public String login(HttpSession session,HttpServletRequest request, Model model,@ModelAttribute("dto") @Valid LoginCommand loginCommand,
						BindingResult result) {
		
		String page = "redirect:/home";
		
		if(result.hasErrors()) {
			if(result.getFieldError("user_id") != null) {
				System.out.println("1:" + result.getFieldError("user_id")
												.getDefaultMessage());
				model.addAttribute("errors_id", result.getFieldError("user_id")
														.getDefaultMessage());
			}
			if(result.getFieldError("user_password") != null) {
				System.out.println("2:" + result.getFieldError("user_password")
												.getDefaultMessage());
				model.addAttribute("errors_pw", result.getFieldError("user_password")
														.getDefaultMessage());
			}
			page = "login";
		}
		
		try {
			model.addAttribute("user_id", loginCommand.getUser_id());
			model.addAttribute("user_pw", loginCommand.getUser_password());
			System.out.println("======");
			if(user.userCheck(loginCommand).getUser_id().equals(loginCommand.getUser_id()) &&
				user.userCheck(loginCommand).getUser_password().equals(loginCommand.getUser_password())) {
			}
			session.setAttribute("user", user.userCheck(loginCommand));
			System.out.println("user Login");
			page="redirect:/home";
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("notMatch","아이디나 패스워드가 잘못됐습니다.");
			page = "login";
		}
		
		return page;
	}
	
	
	@RequestMapping("member/logout")
	public String logout(HttpSession request) {
		if(request.getAttribute("user") != null) {
			System.out.println(request.getAttribute("user"));
			System.out.println("session user delete");
			request.invalidate();
		}
		return"redirect:/home";
	}
	
	@RequestMapping("/animal")
	public String animal() {
		return "animal";
	}
	
	@RequestMapping("/find")
	public String find() {
		return "find";
	}
	
	@RequestMapping("/regist")
	public String regist() {
		return "regist";
	}

}
