package org.zerock.mapper;

import org.zerock.domain.MemberVO;

public interface MemberMapper {

	public MemberVO login(String mid);
	
	public int signUp(MemberVO vo);
}
