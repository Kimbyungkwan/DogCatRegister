package com.dcr.application.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dcr.application.dao.IPetDAO;
import com.dcr.application.dto.PaginationDTO;
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
	public List<PetDTO> petPageList(int pageNum) {
		// TODO Auto-generated method stub

		final int pageSize = 8;
		final int paginationSize = 5; // 한 페이지에 보여줄 페이지 갯수
		
		Map<String,Integer> page = new HashMap<String, Integer>();
		page.put("pageNum" , ((pageNum-1)*8));
		page.put("pageSize" , pageSize);
		
		ArrayList<PaginationDTO> pageList = new ArrayList<PaginationDTO>();
		
		return dao.petPageList(page);
	}

	@Override
	public List<PaginationDTO> getPagination(int pageNum) {
		// TODO Auto-generated method stub

		final int pageSize = 8;
		final int paginationSize = 5; // 한 페이지에 보여줄 페이지 갯수
		
		ArrayList<PaginationDTO> pageList = new ArrayList<PaginationDTO>();
		
		int numPages = (int)Math.ceil((double)dao.petCounter() / pageSize);  //필요한 총 페이지 갯수
		
		int firstLink = ((pageNum - 1)/paginationSize) * paginationSize + 1;
		int lastLink = firstLink + paginationSize - 1;
		
		
		if(lastLink > numPages) {
			lastLink = numPages; //마지막 페이지가 총 페이지 갯수보다 크면 총 페이지 갯수로 수정
		}
		
		if(firstLink > 1) {
			pageList.add(new PaginationDTO("처음", 1, false));
			pageList.add(new PaginationDTO("이전", pageNum -1, false));
		}
		
		for(int i = firstLink; i <= lastLink; i++) {
			pageList.add(new PaginationDTO(""+i, i, i == pageNum));
		}
		
		if(lastLink < numPages) {
			
			pageList.add(new PaginationDTO("다음", pageNum + 1, false));
			pageList.add(new PaginationDTO("끝", numPages, false));
		}
		
		return pageList;
	}
	

}
