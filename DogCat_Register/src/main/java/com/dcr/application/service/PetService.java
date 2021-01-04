package com.dcr.application.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dcr.application.dao.IPetDAO;
import com.dcr.application.dto.PetDTO;

@Service
public class PetService implements IPetService {

	@Autowired
	IPetDAO dao;

	@Override
	public List<PetDTO> newPetList() {
		// TODO Auto-generated method stub
		return dao.newPetList();
	}
	
	
}
