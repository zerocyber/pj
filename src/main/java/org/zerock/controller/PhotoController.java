package org.zerock.controller;


import java.util.Arrays;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.PhotoVO;
import org.zerock.service.PhotoService;
import org.zerock.utils.UploadFileUtils;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/photo/*")
@Log4j
public class PhotoController {

	@Autowired
	private PhotoService service;
	
	@Resource(name = "photoUploadPath")
	private String photoUploadPath;
	
	@GetMapping("/list")
	public void photoList(Model model,Criteria cri) {
		PageMaker pm = new PageMaker();
		cri.setPerPageNum(12);
		pm.setCri(cri);
		pm.setTotal(service.count(cri));
		model.addAttribute("join", service.joinList(cri));
		model.addAttribute("pageMaker", pm);	
	}
	
	@GetMapping("/write")
	public void photoWrite() {
	}
	
	@PostMapping("/write")
	public String writePOST(PhotoVO vo, Model model)throws Exception {
		service.write(vo);
		return "redirect:/photo/list";
	}
	

	@GetMapping("/read")
	public void photoRead(@Param("pno") int pno, Criteria cri, Model model) {
		model.addAttribute("PhotoVO", service.read(pno));
		model.addAttribute("cri", cri);
	}
	
	@GetMapping("/modify")
	public void photoModify(@Param("pno") int pno,Criteria cri, Model model) {
		model.addAttribute("images", service.searchImage(pno));
		model.addAttribute("PhotoVO", service.read(pno));
	}
	
	@PostMapping("/modify")
	public String modifyPOST(PhotoVO vo, Criteria cri, String[] imgList)throws Exception {
		service.modify(vo);
		if( imgList != null) {
		UploadFileUtils.deleteFile(photoUploadPath, imgList);
		service.removeImages(imgList);
		}
		return "redirect:/photo/read?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum()+"&pno="+vo.getPno();
	}
	
	@PostMapping("/delete")
	public String photoRemove(@Param("pno")int pno, String[] images)throws Exception {
		service.remove(pno);
		if(images != null) {
			UploadFileUtils.deleteFile(photoUploadPath, images);
		}
		return "redirect:/photo/list";
	}
}
