package org.zerock.controller;

import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.utils.MediaUtils;
import org.zerock.utils.UploadFileUtils;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class UploadController {

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Resource(name = "photoUploadPath")
	private String photoUploadPath;
	
	@ResponseBody
	@RequestMapping(value="/{path}/upload", 
	produces="application/json; charset=UTF-8",
	method=RequestMethod.POST)	//produces로 mime타입 지정
	public ResponseEntity<String> uploadAjax(@PathVariable("path")String path, MultipartFile file) throws Exception {		
		if(path.equalsIgnoreCase("img")) {
			return new ResponseEntity<>(
					UploadFileUtils.uploadFile(photoUploadPath, path+file.getOriginalFilename(), 
							file.getBytes()),HttpStatus.CREATED);
		}
		return new ResponseEntity<>(
				UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), 
						file.getBytes()),HttpStatus.CREATED);
	}
	
	@ResponseBody
	@GetMapping("/displayFile")
	public ResponseEntity<byte []> displayFile(String fileName)throws Exception{
		InputStream in  = null;
		ResponseEntity<byte[]> entity = null;
				
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1); // 확장
			
			MediaType mType = MediaUtils.getMediaType(formatName); 
			
			HttpHeaders headers = new HttpHeaders();
			
			if(fileName.contains("img")) {
				fileName = fileName.replace("s_", "");
				in = new FileInputStream(photoUploadPath + fileName);
			}else {
				in = new FileInputStream(uploadPath + fileName); // 풀 경로 
			}
			
			if(mType != null) {
				headers.setContentType(mType);
			}else {
				fileName = fileName.substring(fileName.indexOf("_")+1); // 순수한 파일이름 
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM); 
		        headers.add("Content-Disposition", "attachment; filename=\""+ 
		                new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), // 파일을 담는다 엔티티 
					headers, HttpStatus.CREATED);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
		return entity;
	}
	
	@ResponseBody
	@GetMapping("/displayImage")
	public ResponseEntity<byte []> displayImage(String fileName)throws Exception{
		InputStream in  = null;
		ResponseEntity<byte[]> entity = null;
				
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1); // 확장
			
			MediaType mType = MediaUtils.getMediaType(formatName); 
			
			HttpHeaders headers = new HttpHeaders();
			
			if(fileName.contains("img")) {
				String[] str = fileName.split("s_");
				String add = str[0] + str[1];
				in = new FileInputStream(photoUploadPath + add);
			}
			
			if(mType != null) {
				headers.setContentType(mType);
			}else {
				fileName = fileName.substring(fileName.indexOf("_")+1); // 순수한 파일이름 
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM); 
		        headers.add("Content-Disposition", "attachment; filename=\""+ 
		                new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), // 파일을 담는다 엔티티 
					headers, HttpStatus.CREATED);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
		return entity;
	}
	
}
