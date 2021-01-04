package com.dcr.application.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dcr.application.dto.PetDTO;

@Mapper
public interface IPetDAO {

//	메인 페이지에 신규등록된 동물 4마리
	public List<PetDTO> newPetList();
}
