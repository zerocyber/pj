package org.zerock.controller;


import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replies")
@Log4j
public class ReplyController {

	
	@Setter(onMethod_= {@Autowired})
	private ReplyService service;

	//�뙎湲� �벑濡�
	@RequestMapping(value="/new", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO vo) {
		ResponseEntity<String> entity = null;
		 try {
			 service.register(vo);
			 entity = new ResponseEntity<String>("등록되었습니다",HttpStatus.OK);
		 }catch(Exception e) {
			 e.getMessage();
		 }
		 return entity;
	}

	//�뙎湲� 由ъ뒪�듃
	@RequestMapping(value="/{bno}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listReplies(
			@PathVariable("bno") int bno,
			@PathVariable("page")int page){
		
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			
			PageMaker pm = new PageMaker();
			pm.setCri(cri);
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<ReplyVO> list = service.listReplyPage(bno, cri);
			map.put("list", list);
			
			int count = service.count(bno);
			
			pm.setTotal(count);
			map.put("pm", pm);
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{bno}/{rno}", method=RequestMethod.PUT)
	public ResponseEntity<String> updateReplies(@PathVariable("bno") int bno, 
			@PathVariable("rno")int rno,@RequestBody ReplyVO vo) {
		ResponseEntity<String> entity = null;		
		try {
			service.modify(vo);
			entity = new ResponseEntity<String>("Modify", HttpStatus.OK);			
		}catch(Exception e) {
			e.getMessage();
		}
		return entity;
	}
	
	@RequestMapping(value = "/{bno}/{rno}" , method = RequestMethod.DELETE)
	public ResponseEntity<String> removeReplies(@PathVariable("rno")int rno) {
		ResponseEntity<String> entity = null;
		try {
			service.remove(rno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}		
		return entity;			
	}
	
}
