package com.dcr.application.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;
import java.util.UUID;

public class UserNumCreate {

	public String createNum() {
		UUID uuid = UUID.randomUUID();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Calendar dateTime = Calendar.getInstance();
		String uniqueId = sdf.format(dateTime.getTime());
		
		return uniqueId + (int)(Math.random()*100);
	}

}
