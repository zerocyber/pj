package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.LoginDTO;
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

	}
	
	@PostMapping("/login")
	public void loginPost(LoginDTO dto, Model model) {		
		MemberVO vo = service.userLogin(dto);
		if(vo == null) {
			return;
		}
		model.addAttribute("MemberVO",vo);
		
	}
	
	@GetMapping("/signup")
	public void signUp() {
		
	}
	
	@PostMapping("/signup")
	public String signUpPost(MemberVO vo, Model model, RedirectAttributes rttr) {
		service.userRegist(vo);
		rttr.addFlashAttribute("msg", "signUp");
		return "redirect:/board/list";
	}
}
