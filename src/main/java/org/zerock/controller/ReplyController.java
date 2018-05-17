package org.zerock.controller;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/replies")
public class ReplyController {

	@PostMapping("/new")
	public void register() {
		
	}
	
	@GetMapping("/{bno}/{page}")
	public void listReplies() {
		
	}
	
	@PutMapping("/{bno}/{rno}")
	public void updateReplies() {
		
	}
	
	@DeleteMapping("/{bno}/{rno}")
	public void removeReplies() {
		
	}
}
