package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.utils.UploadFileUtils;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@RequestMapping("/up/*")
@Controller
@Log4j
public class UploadController {

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@GetMapping("/upload")
	public void uploadAjax() {
		log.info("upload Ajax");
	}
	
	@PostMapping(value="/upload", produces="application/json")	//produces로 mime타입 지정
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		
		log.info("upload....................post");
		log.info("originalName: " + file.getOriginalFilename());
		log.info("size: " + file.getSize());
		log.info("contentType : " + file.getContentType());
		return new ResponseEntity<>(
				UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), 
						file.getBytes()),HttpStatus.CREATED);
		
	
	}
	
	
}
