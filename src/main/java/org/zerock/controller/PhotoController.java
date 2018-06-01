package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.service.PhotoService;

@Controller
@RequestMapping("/photo/*")
public class PhotoController {


	@Autowired
	private PhotoService service;
	
	@GetMapping("/list")
	public void photoList(Model model,Criteria cri) {
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		cri.setPerPageNum(12);
		model.addAttribute("photoList", service.pageList(cri));
		model.addAttribute("pageMaker", pm);
		
	}
	
	@GetMapping("/write")
	public void photoWrite() {
		
	}
}
