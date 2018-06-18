package org.zerock.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.zerock.utils.JavaWebCrawler;

@Controller
public class IndexController {

	private final static String WEEKLY = "http://movie.daum.net/boxoffice/weekly";
	private final static String MONTHLY = "http://movie.daum.net/boxoffice/monthly";
	private final static String YEARLY = "http://movie.daum.net/boxoffice/yearly";
	
	@GetMapping("/index")
	public void index(Model model) throws IOException {
		
		model.addAttribute("weekly",JavaWebCrawler.goCrawling(WEEKLY));
		model.addAttribute("monthly",JavaWebCrawler.goCrawling(MONTHLY));
		model.addAttribute("yearly",JavaWebCrawler.goCrawling(YEARLY));
		
	}
	
}
