package com.dcr.application.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dcr.application.dto.UserDTO;
import com.dcr.application.util.LoginCommand;

@Mapper
public interface IUserDAO {

	public UserDTO userCheck(String user_id,String user_pw);
}
