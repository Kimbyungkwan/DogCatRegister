package com.dcr.application.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dcr.application.dao.ILostPetDAO;
import com.dcr.application.dto.LostPetDTO;

@Service
public class LostPetService implements ILostPetService{

	@Autowired
	ILostPetDAO dao;

	@Override
	public List<LostPetDTO> mainLostPetList() {
		// TODO Auto-generated method stub
		return dao.mainLostPetList();
	}
	
	
}
