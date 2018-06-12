package org.zerock.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.LoginDTO;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_= {@Autowired})
	private MemberMapper mapper;
	
	
	@Override
	public MemberVO userLogin(LoginDTO dto) {
		
		return mapper.login(dto);
	}


	@Override
	public int userRegist(MemberVO vo) {
		
		return mapper.signUp(vo);
	}


	@Override
	public void keepLogin(String mid, String sessionId, Date next) {
		
	
		mapper.keepLogin(mid, sessionId, next);
	}


	@Override
	public MemberVO checkLoginBefore(String value) {
		
		return mapper.checkUserWithSessionKey(value);
	}


	@Override
	public int userIdCheck(String id) {
		
		return mapper.idCheck(id);
	}
	
	
	
	

	
}
