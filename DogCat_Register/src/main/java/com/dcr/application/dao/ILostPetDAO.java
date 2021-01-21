package com.dcr.application.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.dcr.application.dto.LostPetDTO;
import com.dcr.application.dto.PetDTO;

@Mapper
public interface ILostPetDAO {

//	메인 페이지에 잃어버린 동물 4마리
	public List<LostPetDTO> mainLostPetList();
	public int lostPetCount();
	public List<LostPetDTO> findPetList(Map<String,Integer> page);
	public LostPetDTO lostPetDetail(String num);
	public int lostPetRegist(LostPetDTO dto);
}
