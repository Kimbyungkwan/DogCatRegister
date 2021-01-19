
package com.dcr.application.dto;

import lombok.Data;

@Data
public class LostPetDTO {

	private int lost_pet_num;
	private String lost_pet_name;
	private int lost_pet_age;
	private String lost_pet_type;
	private String lost_pet_species;
	private String lost_pet_admin;
	private String lost_pet_content;
	private String lost_pet_photo;
	private String lost_pet_location;
	private String lost_pet_sex;
	private String lost_pet_date;
}
