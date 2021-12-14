package org.zerock.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


// Page 292 MyBatis와 스프링에서 페이징 처리
@Getter
@Setter
@ToString
public class Criteria {
	
	private int pageNum;
	private int amount;
	private String type;
		
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	// Page 333 검색조건 처리를 위한 Criteria 확장
	private String typeSearch;
	private String keyword;
	
	public String[] getTypeArr() {
		return typeSearch == null ? new String[] {} : typeSearch.split("");
	}
	
	
	// Page 348 UriComponentsBuilder를 이용하는 링크 생성
	public String getListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("typeSearch", this.getTypeSearch())
				.queryParam("keyword", this.getKeyword())
				.queryParam("type", this.getType());
		
		return builder.toUriString();
	}
	
}
