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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@RequestMapping("/up/*")
@Controller
@Log4j
public class UploadController {

	@GetMapping("/ajax")
	public void uploadAjax() {
		log.info("upload Ajax");
	}
	
	@PostMapping(value="/ajax", produces="application/json")	//produces로 mime타입 지정
	public @ResponseBody ResponseEntity<List<String>> uploadAjaxFiles(MultipartFile[] file) throws Exception {
		log.info(Arrays.toString(file));
		
		List<String> uploadNames = new ArrayList<>();
		
		for (MultipartFile upfile : file) {
			
			log.info(upfile.getOriginalFilename());
			log.info("------------------------------");
			
			//파일 중복
			UUID uid = UUID.randomUUID();
			
			String  uploadFileName = uid.toString()+"_"+upfile.getOriginalFilename();
			
			//파일 업로드 경로 지정, UID 추가
			FileOutputStream fos = 
					new FileOutputStream(new File("C:\\zzz\\upload",
							uploadFileName	 ));
			//지정된 경로에 파일 업로드
			FileCopyUtils.copy(upfile.getInputStream(), fos);
			fos.close();
			
			
			//make thumbnail
			FileOutputStream thfos = 
					new FileOutputStream(
							new File("C:\\zzz\\upload", 
									"s_"+uploadFileName));
			
			Thumbnailator.createThumbnail(
					upfile.getInputStream(), thfos, 100, 100);	// 원본파일을 받아 썸네일로 저장
			
			thfos.close();
			
			uploadNames.add(uploadFileName);
		}
		return new ResponseEntity<List<String>>(uploadNames, HttpStatus.OK);
	}
	
	
}
