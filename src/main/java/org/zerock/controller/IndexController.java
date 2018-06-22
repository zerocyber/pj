package org.zerock.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.zerock.domain.MemberVO;
import org.zerock.service.IndexService;
import org.zerock.service.MemberService;

@Controller
public class IndexController {

	@Autowired
	private IndexService service;
	
	@Autowired
	private MemberService service2;
	
	@GetMapping("/index")
	public void index(Model model) throws IOException {
		model.addAttribute("week", service.weekList());
		model.addAttribute("month", service.monthList());
		model.addAttribute("year", service.yearList());
	
	}
	
}
