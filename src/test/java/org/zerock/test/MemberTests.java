package org.zerock.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberTests {

	
	@Setter(onMethod_= {@Autowired})
	private MemberMapper mapper;
	
	
	@Test
	public void test() {
		
		log.info(mapper.login("테스트1"));
	}
	
	@Test
	public void signUpTest() {
		
		MemberVO vo = new MemberVO();
		
		vo.setMid("테스트6");
		vo.setMpw("1234");
		vo.setMname("정원준");
		vo.setEmail("");
		
		
		log.info(mapper.signUp(vo));
	}
	
}
