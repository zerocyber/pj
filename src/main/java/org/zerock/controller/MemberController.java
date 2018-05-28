package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RequestMapping("")
@Controller
@Log4j
public class MemberController {

	@Setter(onMethod_= {@Autowired})
	private MemberService service;
	
	
	@GetMapping("/login")
	public void login() {
		
		log.info("Login get............................");
	}
	@GetMapping("/signup")
	public void signUp() {
		log.info("Sign Up get...........................");
	}
	
	@PostMapping("/signup")
	public String signUpPost(MemberVO vo, RedirectAttributes rtts) {
		log.info("user regist..............");	

		service.userRegister(vo);
		
		rtts.addFlashAttribute("msg", "success");
		
		return "redirect:/login";
		
	}
}
