package org.zerock.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class DogInfoDTO {

	private Long dno;
	private Date regdate;
	private String age;
	private String simple;
	private Double weight;
	private String fileName;
	private String health;
	private String name;
	private String kind;
	private String feature;
	private String sex;
	private String price;
//	public DogInfoDTO(Long dno, Date regdate, String age, String simple, Double weight, String fileName, String health,
//			String name, String kind, String feature, String sex) {
//		super();
//		this.dno = dno;
//		this.regdate = regdate;
//		this.age = age;
//		this.simple = simple;
//		this.weight = weight;
//		this.fileName = fileName;
//		this.health = health;
//		this.name = name;
//		this.kind = kind;
//		this.feature = feature;
//		this.sex = sex;
//	}

	public MultipartFile uploadfileName;
}
