package com.dcr.application.util;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Pagination {

	private String display;
	private int pageNo;
	private boolean curPage;
	
}
