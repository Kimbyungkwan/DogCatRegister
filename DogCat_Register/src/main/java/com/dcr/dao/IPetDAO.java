package com.dcr.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dcr.dto.PetDTO;

@Mapper
public interface IPetDAO {

//	메인 페이지에 신규등록된 동물 4마리 JSON넘겨줌
	public List<PetDTO> newPetList();
}
