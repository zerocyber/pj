package org.zerock.mapper;

import org.zerock.domain.LoginDTO;
import org.zerock.domain.MemberVO;

public interface MemberMapper {

	public MemberVO login(LoginDTO dto);
	
	public int signUp(MemberVO vo);
	
}
