package org.zerock.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.core.userdetails.ReactiveUserDetailsServiceResourceFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
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
	public void list(Criteria cri, Model model) {
		log.info("list..............");
		
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotal(service.count());
		model.addAttribute("BoardVO", service.pageList(cri));
		model.addAttribute("pm", pm);
		
	}
	
	@GetMapping("/read")
	public void read(BoardVO vo, Model model, @Param("bno")int bno) {
		log.info("read.............");
		model.addAttribute("BoardVO", service.read(bno));
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
