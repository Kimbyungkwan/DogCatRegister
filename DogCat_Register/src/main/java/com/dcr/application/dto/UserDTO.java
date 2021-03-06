package com.dcr.application.dto;

import lombok.Data;

@Data
public class UserDTO {

	private String user_Num;
	private String user_id;
	private String user_password;
	private String user_nickname;
	private String user_email;
	private String user_phone;
	private int is_admin;
	private String user_sign;
}
