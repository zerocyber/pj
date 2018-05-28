package org.zerock.service;

import org.zerock.domain.MemberVO;

public interface MemberService {

	public MemberVO userLogin(String mid);
	
	public int userRegister(MemberVO vo);
}
