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
		log.info("post handle.............................................");
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		log.info("modelMap: " + modelMap);
		Object memberVO = modelMap.get("MemberVO");
		if(memberVO !=null) {
			log.info("login success.............................");
			session.setAttribute("LOGIN", memberVO);
			response.sendRedirect("/index");
			
		}
	
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		
		if(session.getAttribute("LOGIN") !=null) {
			
			log.info("이전에 있던 로그인 데이터를 삭제합니다...................");
			session.removeAttribute("LOGIN");
		}
		
		return true;
	}
	
	
	
}
