package org.zerock.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardTests {

	
	@Setter(onMethod_= {@Autowired})
	private BoardMapper mapper;

	@Test
	public void testList() {
		
	}
	
	@Test
	public void testRead() {

		log.info(mapper.read(100));
	}
	
	@Test
	public void testInsert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("제목추가");
		vo.setContent("내용추가");
		vo.setMid("user11");
		vo.setCno(100);
		vo.setKno(10);
		log.info(mapper.insert(vo));
	}
	
	@Test
	public void testUpdate() {
		BoardVO vo = new BoardVO();
		vo.setTitle("제목수정");
		vo.setContent("내용수정");
		vo.setBno(96);
		log.info(mapper.update(vo));
	}
	
	@Test
	public void testDelete() {
		log.info(mapper.delete(99));
	}
	
	@Test
	public void testCount() {
		log.info(mapper.count());
	}
	
}
