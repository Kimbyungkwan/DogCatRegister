package com.dcr.application.service;

import java.util.List;

import com.dcr.application.dto.PaginationDTO;
import com.dcr.application.dto.PetDTO;

public interface IPetService {
	public List<PetDTO> newPetList();
	public int petRegist(PetDTO dto);
	public List<PetDTO> petManage(String userNum);
	public int petUpdate(PetDTO dto);
	public int petCounter();
	public List<PetDTO> petPageList(int pageNum);
	public List<PaginationDTO> getPagination(int pageNum,int petCount);
}
