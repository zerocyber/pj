package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;
import org.zerock.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RequestMapping("/board/*")
@Controller
@Log4j
public class BoardController {

	@Setter(onMethod_= {@Autowired})
	private BoardService service;
	
	@GetMapping("/list")
	public void list() {
		log.info("list..............");
		service.pageList();
	}
	
	@GetMapping("/read")
	public void read(BoardVO vo) {
		log.info("read.............");
		service.read(vo.getBno());
	}
	
	@GetMapping("/write")
	public void write() {
		log.info("write get...........");
	}
	
	@PostMapping("/write")
	public String writePost(BoardVO vo){
		log.info("write post.......");
		service.write(vo);
		return "list";
	}
	
	@GetMapping("/modify")
	public void modify(BoardVO vo) {
		log.info("modify get.........");
	}
	
	@PostMapping("/modify")
	public String modifyPost(BoardVO vo) {
		log.info("modify post...........");
		service.modify(vo);
		return "redirect:/board/read";
	}
	
	@PostMapping("/delete")
	public String delete(int bno) {
		log.info("delete........");
		service.remove(bno);
		return "list";
	}
	
	
}
