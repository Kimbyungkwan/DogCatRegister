package com.dcr.application.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dcr.application.dao.ILostPetDAO;
import com.dcr.application.dto.LostPetDTO;
import com.dcr.application.dto.PaginationDTO;

@Service
public class LostPetService implements ILostPetService{

	@Autowired
	ILostPetDAO dao;

	@Override
	public List<LostPetDTO> mainLostPetList() {

		return dao.mainLostPetList();
	}

	@Override
	public int lostPetCount() {
		// TODO Auto-generated method stub
		return dao.lostPetCount();
	}

	@Override
	public List<LostPetDTO> findPetList(int pageNum) {


		final int pageSize = 8;
		final int paginationSize = 5; // 한 페이지에 보여줄 페이지 갯수
		
		Map<String,Integer> page = new HashMap<String, Integer>();
		page.put("pageNum" , ((pageNum-1)*8));
		page.put("pageSize" , pageSize);
		
		ArrayList<PaginationDTO> pageList = new ArrayList<PaginationDTO>();
		
		return dao.findPetList(page);
	}

	@Override
	public LostPetDTO lostPetDetail(String num) {
		// TODO Auto-generated method stub
		return dao.lostPetDetail(num);
	}
	
	
}
