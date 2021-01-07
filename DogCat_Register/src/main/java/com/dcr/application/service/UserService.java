package com.dcr.application.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dcr.application.dao.IUserDAO;
import com.dcr.application.dto.UserDTO;
import com.dcr.application.util.LoginCommand;

@Service
public class UserService implements IUserService {

	@Autowired
	IUserDAO dao;
	
	@Override
	public UserDTO userCheck(LoginCommand loginCommand) {
		// TODO Auto-generated method stub
		return dao.userCheck(loginCommand.getUser_id(),loginCommand.getUser_password());
	}

	@Override
	public UserDTO signUpIdCheck(String user_id) {
		// TODO Auto-generated method stub
		
		return dao.signUpIdCheck(user_id);
	}

	@Override
	public int signUp(UserDTO dto) {
		dao.signUp(dto);
		return 0;
	}

	
	
}
