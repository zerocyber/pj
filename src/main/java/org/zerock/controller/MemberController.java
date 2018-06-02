package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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

	public void loginPost(LoginDTO dto, Model model, RedirectAttributes rttr) {

		MemberVO vo = service.userLogin(dto);
		if(vo == null) {
			log.info("로그인 실패.....");
			rttr.addFlashAttribute("msg", "fail");

		}else {
		log.info("로그인 성공.....");
		model.addAttribute("MemberVO",vo);
		log.info(vo);

		}

		
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
	
	@GetMapping("/logout")
	public String logOut(HttpServletRequest req, HttpServletResponse res, HttpSession session,RedirectAttributes rttr) {
		log.info("get logout................");
		
		Object obj = session.getAttribute("LOGIN");
		if(obj != null) {
			
			MemberVO vo = (MemberVO) obj;
			
			session.removeAttribute("LOGIN");
			session.invalidate();
			
		}
		return "redirect:/index";
	}

}
