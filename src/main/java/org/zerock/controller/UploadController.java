package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

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

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@RequestMapping("/upload/*")
@Controller
@Log4j
public class UploadController {

	@GetMapping("/testupload")
	public void upload() {
		log.info("upload Ajax");
	}
	
	@ResponseBody
	@RequestMapping(value="/testupload", method=RequestMethod.POST ,produces="application/json")	//produces로 mime타입 지정
	public  ResponseEntity<String> uploadPOST(MultipartFile file)
			throws Exception {
		System.out.println("testupload.................................................");
		
		log.info(file.getOriginalFilename());
		log.info(file.getSize());
		log.info(file.getContentType());
		
		return new ResponseEntity<String>(file.getOriginalFilename(),HttpStatus.CREATED);
	}
	
}
