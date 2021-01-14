package com.dcr.application.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PaginationDTO {

	private String display;
	private int pageNo;
	private boolean curPage;
	
}
