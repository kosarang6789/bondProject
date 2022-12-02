package kh.semi.project.bond.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import kh.semi.project.bond.model.service.PostService;
import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember"})
public class PostController {

	@Autowired
	private PostService service;
	
	// 게시물 상세조회
	@ResponseBody
	@GetMapping("bond/{groupNo}/{postNo}")
	public String postSelect(@PathVariable("postNo") int postNo,
			@SessionAttribute("loginMember") Member loginMember) {
		
		Post post = service.selectPostDetail(postNo);
		
		return new Gson().toJson(post);
	}
	
	// 게시물 작성
	@GetMapping("/bond/postWrite")
	public String postWrite() {
		return "post/postWrite";
	}
	
	
}
