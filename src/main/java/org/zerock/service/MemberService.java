package org.zerock.service;

import org.zerock.domain.LoginDTO;
import org.zerock.domain.MemberVO;

public interface MemberService {

	public MemberVO userLogin(LoginDTO dto);
	
	public int userRegist(MemberVO vo);
	
}
