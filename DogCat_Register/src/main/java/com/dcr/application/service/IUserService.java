package com.dcr.application.service;

import java.util.List;

import com.dcr.application.dto.UserDTO;
import com.dcr.application.util.LoginCommand;

public interface IUserService {
	public UserDTO userCheck(LoginCommand loginCommand);
	public int signUp(UserDTO dto);
	public UserDTO signUpIdCheck(String user_id);
}
