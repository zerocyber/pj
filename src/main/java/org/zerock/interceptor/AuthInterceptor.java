package org.zerock.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j
public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	throws Exception{
	
	HttpSession session = request.getSession();
	
	if(session.getAttribute("LOGIN") == null) {
		
		log.info("로그인 권한이 필요한 페이지에 유저가 접속 시도...................");
		response.sendRedirect("/login");
		return false;
	}
	
		return true;
	
	}

	
	
}
