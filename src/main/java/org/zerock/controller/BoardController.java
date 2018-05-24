package org.zerock.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.service.BoardService;

import com.fasterxml.jackson.databind.annotation.JsonAppend.Prop;
import com.mysql.jdbc.StringUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RequestMapping("/nboard/*")
@Controller
@Log4j
public class BoardController {

	@Setter(onMethod_= {@Autowired})
	private BoardService service;
	
	@Setter(onMethod_= {@Autowired})
	private HttpServletRequest req;
	
	@Setter(onMethod_= {@Autowired})
	private HttpServletResponse res;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model,HttpServletRequest request)throws Exception {
		log.info("list..............");
		
		String uri = request.getRequestURI().split("/")[2].toString();
		log.info(uri);
		
		model.addAttribute("BoardVO", service.searchList(cri));
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotal(service.count(cri));
//		model.addAttribute("BoardVO", service.pageList(cri));
		model.addAttribute("pm", pm);
	}
	
	@GetMapping("/nread")
	public void read(BoardVO vo, Model model, @Param("bno") int bno, Criteria cri) {
		log.info("read.............");
		Cookie cookies[] = req.getCookies();
		Map cookieMap = new HashMap();
		if(req.getCookies() != null ) {
			log.info("getCookies not null...............................................");
			for(int i = 0; i < cookies.length; i++) {
			Cookie cookieObj = cookies[i];
			cookieMap.put(cookieObj.getName(), cookieObj.getValue());
			log.info("name: " + cookieObj.getName()+ "  value: "+ cookieObj.getValue());
			}	
		}
		String cookieViews = (String)cookieMap.get("views");
		log.info("cookieViews........................: " + cookieViews);
		String cookie_viewCnt = "|" + bno;
		if(cookieViews == null) {
			cookieViews = "views";
		}
		
		if(StringUtils.indexOfIgnoreCase(cookieViews, cookie_viewCnt) == -1) {
			Cookie cookie = new Cookie("views" ,  cookieViews+ cookie_viewCnt);
			cookie.setMaxAge(60 * 60 * 24);
			res.addCookie(cookie);
			service.viewCnt(bno);
		}
		model.addAttribute("BoardVO", service.read(bno));
		model.addAttribute("cri",cri);	
	}
	
	@GetMapping("/write")
	public void write() {
		log.info("write get...........");
	}
	
	@PostMapping("/write")
	public String writePost(BoardVO vo){
		log.info("write post.......");
		service.write(vo);
		return "redirect:/board/list";
	}
	
	@GetMapping("/modify")
	public void modify(BoardVO vo, Model model, Criteria cri) {
		log.info("modify get.........");
		model.addAttribute("boardVO", service.read(vo.getBno()));
		model.addAttribute("cri", cri);
		
	}
	
	@PostMapping("/modify")
	public String modifyPost(BoardVO vo, Criteria cri) {
		log.info("modify post...........");
		service.modify(vo);
		return "redirect:/board/read?page="+ cri.getPage() + "&perPageNum="+cri.getPerPageNum()+"&bno="+vo.getBno();	
	}
	@PostMapping("/delete")
	public String delete(@Param("bno") int bno) {
		service.remove(bno);
		return "redirect:/board/list";
	}
	
	
}
