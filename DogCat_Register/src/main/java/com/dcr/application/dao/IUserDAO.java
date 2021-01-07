package com.dcr.application.dao;

import org.apache.ibatis.annotations.Mapper;

import com.dcr.application.dto.UserDTO;

@Mapper
public interface IUserDAO {

	public UserDTO userCheck(String user_id,String user_pw);
	public int signUp(UserDTO dto);
	public UserDTO signUpIdCheck(String user_id);
}
