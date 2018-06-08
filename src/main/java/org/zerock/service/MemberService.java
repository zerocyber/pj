package org.zerock.service;

import java.util.Date;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.LoginDTO;
import org.zerock.domain.MemberVO;

public interface MemberService {

	public MemberVO userLogin(LoginDTO dto);
	
	public int userRegist(MemberVO vo);
	
	public void keepLogin(@Param("sessionId") String sessionId, @Param("mid")String mid, @Param("next")Date next);
	public MemberVO checkLoginBefore(String value);
	
}
