package org.zerock.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;


@Log4j
public class LoginInterceptor extends HandlerInterceptorAdapter {

	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		
		Object memberVO = modelMap.get("MemberVO");

		log.info("memberVO: "+memberVO);
		if(memberVO !=null) {
			log.info("login success.............................");
			session.setAttribute("LOGIN", memberVO);
			
			Object uri = session.getAttribute("URI");

			response.sendRedirect(uri != null? (String)uri : "/index");		
		}

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		
		if(session.getAttribute("LOGIN") !=null) {

			
			log.info("이전에 있던 로그인 데이터 삭제처리");

			session.removeAttribute("LOGIN");
		}
		return true;
	}

}
