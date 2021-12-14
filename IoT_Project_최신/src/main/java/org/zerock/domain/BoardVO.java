package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

// PART 03 CHAPTER 08 영속/비즈니스 계층의 CRUD구현
// PAGE 183 VO클래스의 작성
@Data
public class BoardVO {

	private Long bno;
	private String title;
	private String content;
	private String writer;
	private String type;
	private Date regdate;
	private Date updatedate;
	private int viewcnt;
	private int replycnt;
	
	private List<BoardAttachVO> attachList;
}
