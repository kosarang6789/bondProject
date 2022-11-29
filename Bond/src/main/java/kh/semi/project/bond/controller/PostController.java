package kh.semi.project.bond.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kh.semi.project.bond.model.service.PostService;

@Controller
public class PostController {

	@Autowired
	private PostService service;
	
	// 게시물 상세조회
	
	// 게시물 작성
	@GetMapping("/bond/postWrite")
	public String postWrite() {
		return "post/postWrite";
	}
	
	
	
}
