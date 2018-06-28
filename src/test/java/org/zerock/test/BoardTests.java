package org.zerock.test;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.mapper.BoardMapper;
import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardTests {

	
	@Setter(onMethod_= {@Autowired})
	private BoardMapper mapper;

	@Test
	public void testList() {
		

	}
	
	@Test
	public void addFile() {

	}
	

	
	
}
