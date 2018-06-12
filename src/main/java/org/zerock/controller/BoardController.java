package org.zerock.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.service.BoardService;
import org.zerock.utils.UploadFileUtils;

import com.mysql.jdbc.StringUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RequestMapping("/board/*")
@Controller
@Log4j
public class BoardController {

	@Setter(onMethod_= {@Autowired})
	private BoardService service;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model,HttpServletRequest request)throws Exception {
		
		model.addAttribute("bestList", service.bestList());
		model.addAttribute("BoardVO", service.searchList(cri));
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotal(service.count(cri));
		model.addAttribute("pm", pm);
	}
	
	@GetMapping("/read")
	public void read(Model model, @Param("bno") int bno, Criteria cri) {	
		BoardVO vo = service.read(bno);
		vo.setFiles(service.searchFile(bno));
		
		model.addAttribute("BoardVO", vo);
		model.addAttribute("cri",cri);	
	}
	
	@GetMapping("/write")
	public void write() {

	}
	
	@PostMapping("/write")
	public String writePost(BoardVO vo, Model model, RedirectAttributes rttr) throws Exception{
		service.write(vo);
		rttr.addFlashAttribute("msg", "regist");
		return "redirect:/board/list";
	}

	
	@GetMapping("/modify")
	public void modify(@Param("bno")int bno, Model model, Criteria cri, HttpSession session) {
		log.info("modify get.........");

		BoardVO vo = service.read(bno);
		
		vo.setFiles(service.searchFile(bno));
		model.addAttribute("BoardVO", vo);
		model.addAttribute("cri", cri);
	}
	
	@PostMapping("/modify")
	public String modifyPost(BoardVO vo, Criteria cri, String[] deleteFiles)throws Exception {
		if(deleteFiles != null) {
			service.removeFiles(deleteFiles);
			UploadFileUtils.deleteFile(uploadPath, deleteFiles);
		}
		service.modify(vo);
		return "redirect:/board/read?page="+ cri.getPage() + "&perPageNum="+cri.getPerPageNum()+"&bno="+vo.getBno();	
	}
	
	@PostMapping("/delete")
	public String delete(@Param("bno") int bno)throws Exception {
		String[] deleteFiles = service.searchFile(bno);
		int success = service.remove(bno);
		if(success > 0) { 
		UploadFileUtils.deleteFile(uploadPath, deleteFiles);	
		}
		return "redirect:/board/list";
	}

}
