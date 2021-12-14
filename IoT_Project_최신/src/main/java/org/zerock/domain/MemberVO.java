package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

/*	아이디	userId
	비밀번호	userPw
	이름		userName	
	연락처	num1,num2,num3
	이메일	userEmail
	성별		userGender
	주소		userAddress1,userAddress2
	권한		authList====auth,userId=====
	
	활성화상태	enabled
	(기록물,	regdate
	가입일)	
	업데이트	updateDate
	*/
	
	private String userId;
	private String number1;
	private int number2,number3;
	private String userName;
	private String userPw;
	private String userEmail;
	private String userGender;
	private String userAddress1,userAddress2;
	
	List<AuthVO> authList;
	
	private boolean enabled;
	private Date regDate;
	private Date updateDate;
	
}
