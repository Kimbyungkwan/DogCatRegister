package com.dcr.application.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dcr.application.dto.LostPetDTO;

@Mapper
public interface ILostPetDAO {

//	메인 페이지에 잃어버린 동물 4마리
	public List<LostPetDTO> mainLostPetList();
	
}
