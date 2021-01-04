# DogCatRegister
Dog&amp;Cat Register site


# application.properties   

```
server.port=8081

spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp

spring.datasource.driver-class-name=org.mariadb.jdbc.Driver
spring.datasource.url=jdbc:mariadb://localhost:3306/DogCatRegister
spring.datasource.username=root
spring.datasource.password=kqudk6414


mybatis.mapper-locations=classpath:mybatis/mapper/**/**.xml


spring.devtools.livereload.enabled=true

server.servlet.jsp.init-parameters.development=true

```

# Database query   

### user
```sql
CREATE TABLE `user` (
	`user_Num` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`user_id` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`user_password` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`user_nickname` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`user_email` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`user_phone` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`is_admin` INT(11) NOT NULL DEFAULT '0',
	`user_sign` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	PRIMARY KEY (`user_Num`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
```

### pet
```sql
CREATE TABLE `pet` (
	`pet_num` INT(11) NOT NULL AUTO_INCREMENT,
	`pet_name` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`pet_age` INT(11) NULL DEFAULT NULL,
	`pet_status` VARCHAR(20) NOT NULL DEFAULT '생존' COLLATE 'utf8_general_ci',
	`pet_type` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`pet_species` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`pet_admin` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`pet_photo` VARCHAR(150) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`pet_num`) USING BTREE,
	INDEX `fk_pet_admin` (`pet_admin`) USING BTREE,
	CONSTRAINT `fk_pet_admin` FOREIGN KEY (`pet_admin`) REFERENCES `dogcatregister`.`user` (`user_Num`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=5
;

```

### lost_pet
```sql
CREATE TABLE `lost_pet` (
	`lost_pet_num` INT(11) NOT NULL AUTO_INCREMENT,
	`lost_pet_name` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`lost_pet_age` INT(11) NULL DEFAULT NULL,
	`lost_pet_type` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`lost_pet_species` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`lost_pet_admin` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`lost_pet_content` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`lost_pet_photo` VARCHAR(150) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`lost_pet_location` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`lost_pet_num`) USING BTREE,
	INDEX `fk_lost_pet_admin` (`lost_pet_admin`) USING BTREE,
	CONSTRAINT `fk_lost_pet_admin` FOREIGN KEY (`lost_pet_admin`) REFERENCES `dogcatregister`.`user` (`user_Num`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=2
;
```
