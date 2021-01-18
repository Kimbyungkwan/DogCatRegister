package com.dcr.application;

import java.net.http.HttpRequest;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dcr.application.dto.PetDTO;
import com.dcr.application.dto.UserDTO;
import com.dcr.application.service.ILostPetService;
import com.dcr.application.service.IPetService;
import com.dcr.application.service.IUserService;
import com.dcr.application.util.LoginCommand;
import com.dcr.application.util.UserNumCreate;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
	public String logout(HttpSession session) {
//		session에 데이터 user데이터 확인후 존재하면 초기화 
//		메인페이지로 이동.
		if(session.getAttribute("user") != null) {
			System.out.println(session.getAttribute("user"));
			System.out.println("session user delete");
			session.invalidate();
		}
		return"redirect:/home";
	}
	
	@ResponseBody
	@RequestMapping( value="member/signup", method=RequestMethod.POST)
	public HashMap<String, Object> signup(@RequestBody UserDTO dto, UserNumCreate UNC) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		
		dto.setUser_Num(UNC.createNum());
		
		System.out.println(dto);
		if(user.signUp(dto) == 1) {
			map.put("message", "가입 완료");
		}else {
			map.put("message", "가입 실패");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping( value="member/signup/idcheck", method=RequestMethod.POST)
	public HashMap<String, Object> idcheck(@RequestBody String req) {

		HashMap<String,Object> map = new HashMap<String, Object>();

		if(user.signUpIdCheck(req) == null) {
			map.put("message", "사용가능한 아이디입니다.");
		}else {
			map.put("overlap", "중복된 아이디입니다.");
			map.put("message", "중복된 아이디입니다.");
		}
		System.out.println("아이디 체크 완료");
		return map;
	}
	
	@RequestMapping(value={"/animal","/animal/1"})
	public String animal(HttpServletRequest request,Model model) throws Exception {

		System.out.println(model);
		pet.petPageList(1);
		model.addAttribute("petList",pet.petPageList(1));
		model.addAttribute("petCounter",pet.petCounter());
		model.addAttribute("num",1);

		model.addAttribute("pageList",pet.getPagination(1,pet.petCounter()));
		return "animal";
	}
	
	@RequestMapping("/animal/{num}")
	public String animalPage(@PathVariable("num") String num,Model model) throws Exception {
		
		System.out.println(num);
		
		model.addAttribute("petList",pet.petPageList(Integer.parseInt(num)));
		model.addAttribute("petCounter",pet.petCounter());
		model.addAttribute("num",num);
		model.addAttribute("pageList",pet.getPagination(Integer.parseInt(num),pet.petCounter()));
		
		return "animal";
	}

	@ResponseBody 
	@RequestMapping("/animal/counter")
	public int animalCounter() {
		return pet.petCounter();
	}
	
	@RequestMapping({"/find","/find/1"})
	public String find(Model model) {

		System.out.println(pet.getPagination(1,lostPet.lostPetCount()));
		model.addAttribute("newLostPetList", lostPet.findPetList(1));
		model.addAttribute("pageList",pet.getPagination(1,lostPet.lostPetCount()));
		
		return "find";
	}

	@RequestMapping("/find/{num}")
	public String findPage(@PathVariable("num") String num,Model model) {

		System.out.println(pet.getPagination(Integer.parseInt(num),lostPet.lostPetCount()));
//		model.addAttribute("pageList",pet.getPagination(Integer.parseInt(num)));
		System.out.println(num);
		model.addAttribute("newLostPetList", lostPet.findPetList(Integer.parseInt(num)));
		model.addAttribute("pageList",pet.getPagination(Integer.parseInt(num),lostPet.lostPetCount()));
		
		return "find";
	}
	
	@RequestMapping("/regist")
	public String regist(HttpSession session) {
		
		String page = "regist";
		if(session.getAttribute("user") == null) {
			page = "redirect:member/login";
		}
		return page;
	}

	@ResponseBody 
	@RequestMapping(value="/regist/fileUpload", method=RequestMethod.POST)
	public String fileUpload(HttpServletRequest request) {
		JSONObject obj = new JSONObject();
		int size = 1024 * 1024 * 5; // 5M 제한
		String file = "";
		String oriFile = "";
		try {
			String path = ResourceUtils.getFile("classpath:static/upload/images/").toPath().toString();
			System.out.println(path);
			MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8",
					new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			String str = (String)files.nextElement();
			
			file = multi.getFilesystemName(str);
			oriFile = multi.getOriginalFileName(str);
			
			obj.put("success", new Integer(1));
			obj.put("desc","업로드 성공");
			obj.put("src","/upload/images/"+file);

			System.out.println("=====");
			System.out.println("업로드 성공");
			System.out.println("=====");
		}catch(Exception e) {
			e.printStackTrace();
			obj.put("success", new Integer(0));
			obj.put("desc", "업로드 실패");
		}

		return obj.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="/regist/pet", method=RequestMethod.POST)
	public int petRegist(@RequestBody PetDTO dto) {
		System.out.println(dto);
		int complete;
		
		try{
			pet.petRegist(dto);
			complete=1;
			}
		catch (Exception e) {
			// TODO: handle exception
			complete=0;
		}
		
		return complete;
	}
	
	@ResponseBody
	@RequestMapping(value="/regist/management", method=RequestMethod.POST)
	public List<PetDTO> petManagement(@RequestBody String userNum) {
		
		return pet.petManage(userNum);
	}
	
	@ResponseBody
	@RequestMapping(value="/regist/management/update", method=RequestMethod.POST)
	public List<PetDTO> petUpdate(@RequestBody PetDTO dto) {
		
		System.out.println("---------");
		System.out.println(dto);
		pet.petUpdate(dto);
		return pet.petManage(dto.getPet_admin());
	}
	
	 
	
	
}
