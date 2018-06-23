package org.zerock.controller;

import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;
import org.zerock.domain.LoginDTO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.RecommendVO;
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
	public void login(HttpServletRequest req) {

	}
	
	@PostMapping("/login")
	public void loginPost(LoginDTO dto, Model model, RedirectAttributes rttr, HttpSession session) throws Exception {

		MemberVO vo = service.userLogin(dto);
		if(vo == null) {
			log.info("login fail............");
			rttr.addFlashAttribute("msg", "fail");
			return;
		}
		model.addAttribute("MemberVO",vo);
		model.addAttribute("RecommendVO", service.recommendMovie(vo.getFavor()));
		log.info(vo);
		if(dto.isRememberMe()) {
			log.info("rememberMe................................");
			int amount = 60*60*24*7;
			Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
			log.info("sessionLimit......................: "+ sessionLimit);
			service.keepLogin(vo.getMid(), session.getId(), sessionLimit);
		}
	}
	
	
	@GetMapping("/signup")
	public void signUp() {
		
	}
	
	@PostMapping("/signup")
	public void signUpPost(MemberVO vo, Model model, RedirectAttributes rttr, 
			HttpSession session, HttpServletResponse res) throws Exception {
		service.userRegist(vo);
		session.setAttribute("LOGIN", vo);
		Object uri = session.getAttribute("URI");
		
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();

		out.println(uri !=null? "<script>alert('회원가입되었습니다'); location.href='"+(String)uri+"' </script>" :
								"<script>alert('회원가입되었습니다'); location.href='/index' </script>"
				); 
	}
	
	@GetMapping("/logout")
	public void logOut(HttpServletRequest req, HttpServletResponse res, HttpSession session,RedirectAttributes rttr) throws Exception {
		log.info("get logout................");
		
		Cookie loginCookie = WebUtils.getCookie(req, "loginCookie");
		Object obj = session.getAttribute("LOGIN");
		Object uri = session.getAttribute("URI");
		if(obj != null) {
			
			MemberVO vo = (MemberVO) obj;
			
			session.removeAttribute("LOGIN");
			session.invalidate();
			
		}
		
		if(loginCookie != null) {
			loginCookie.setMaxAge(0);
			res.addCookie(loginCookie);
			log.info("쿠키 제거................");
		}
		res.sendRedirect(uri != null ? (String)uri : "/index");

	}
	
	@PostMapping("/idCheck")
	public ResponseEntity<String> checkId(@RequestBody String id) {
/*		log.info("idCheck progress.....inputId : " + id);
		int result = service.userIdCheck(id);
		log.info("result : " + result);
		*/
		
		ResponseEntity<String> entity = null;
		
		entity = new ResponseEntity<String>(Integer.toString(service.userIdCheck(id)), HttpStatus.OK);
		log.info("아이디 체크 진행중..................");
		log.info("아이디 체크 결과 : " + Integer.toString(service.userIdCheck(id)));
		
		return entity;
	}
	

}
