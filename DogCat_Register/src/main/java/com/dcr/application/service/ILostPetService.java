package com.dcr.application.service;

import java.util.List;

import com.dcr.application.dto.LostPetDTO;

public interface ILostPetService {
	public List<LostPetDTO> mainLostPetList();
	public int lostPetCount();
	public List<LostPetDTO> findPetList(int pageNum);
}
