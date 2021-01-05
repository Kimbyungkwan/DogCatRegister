package com.dcr.application.util;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class LoginCommand {
	
	@NotNull(message="Id is not null ")
	@NotEmpty(message="Id is empty")
	private String user_id;
	
	@NotNull(message="Password is not null ")
	@NotEmpty(message="Password is empty")
	private String user_password;
}
