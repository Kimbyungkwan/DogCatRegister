package com.dcr.application.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public int petRegist(PetDTO dto) {
		// TODO Auto-generated method stub
		return dao.petRegist(dto);
	}

	@Override
	public List<PetDTO> petManage(String userNum) {
		// TODO Auto-generated method stub
		return dao.petManage(userNum);
	}

	@Override
	public int petUpdate(PetDTO dto) {
		// TODO Auto-generated method stub
		return dao.petUpdate(dto);
	}

	@Override
	public int petCounter() {
		// TODO Auto-generated method stub
		return  dao.petCounter();
	}

	@Override
	public List<PetDTO> petPagination(int pageNum) {
		// TODO Auto-generated method stub

		final int pageSize = 8;
		
		Map<String,Integer> page = new HashMap<String, Integer>();
		
		page.put("pageNum" , ((pageNum-1)*8));
		page.put("pageSize" , pageSize);
		
		Map<String,List<PetDTO>>asdf = new HashMap<String, List<PetDTO>>();
		
		asdf.put("test", dao.petPageList(page));
		
		System.out.println("=========="+asdf+"=========");
		System.out.println();
		
		return dao.petPageList(page);
	}

}
