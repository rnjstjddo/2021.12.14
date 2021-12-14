package org.zerock.mapper;

import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String userid);
	
	public void insertMember(MemberVO member);
	public void insertMemberAuth(AuthVO auth);
}
