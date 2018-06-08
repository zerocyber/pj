package org.zerock.mapper;

import java.util.Date;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.LoginDTO;
import org.zerock.domain.MemberVO;

public interface MemberMapper {

	public MemberVO login(LoginDTO dto);
	
	public int signUp(MemberVO vo);
	
	public void keepLogin(@Param("mid")String mid,@Param("sessionId") String sessionId,  @Param("next")Date next);
	
	public MemberVO checkUserWithSessionKey(String value);
}
