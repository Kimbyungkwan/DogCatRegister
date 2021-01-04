package com.dcr.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dcr.application.service.ILostPetService;
import com.dcr.application.service.IPetService;

@Controller
public class MyController {

	@Autowired
	IPetService pet;

	@Autowired
	ILostPetService lostPet;

	@RequestMapping("/")
	public String root(Model model) throws Exception {
		model.addAttribute("newPetlist", pet.newPetList());
		System.out.println(pet.newPetList());
		
		model.addAttribute("lostPetList", lostPet.mainLostPetList());
		System.out.println(lostPet.mainLostPetList());
		
		return "home";
	}
}
