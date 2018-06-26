package org.zerock.security;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	
	@Autowired
	private MemberService service;
	
	@Override
	public UserDetails loadUserByUsername(String mid) throws UsernameNotFoundException {
		
		System.out.println("UserDetail...............come..................");
		MemberVO member = service.getUserID(mid);
		
		System.out.println("member...................."+member);
		
		if(member == null) {
			throw new UsernameNotFoundException("no user found with username"+member.getMid());
		}
		
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		
		roles.add(new SimpleGrantedAuthority(service.getUserAuth(mid)));
		
		UserDetails user = new User(mid, member.getMpw(), roles);
		
		return user;
	}
	
	public static String encoder(String password) {
		BCryptPasswordEncoder passencoder = new BCryptPasswordEncoder();
		String encoderPass = passencoder.encode(password);
		return encoderPass;
	}
}
