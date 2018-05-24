package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.Setter;

public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_= {@Autowired})
	private MemberMapper mapper;

	@Override
	public MemberVO userLogin(String mid) {
		
		return mapper.login(mid);
	}
	

	
	
}
