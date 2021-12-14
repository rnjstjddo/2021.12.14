package org.zerock.service;

import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;

public interface MemberService {
	
	public void joinMember(MemberVO member, AuthVO vo);
}
