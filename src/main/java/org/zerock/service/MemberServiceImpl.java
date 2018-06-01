package org.zerock.service;

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
	
	

	
}
