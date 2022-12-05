package kh.semi.project.bond.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import kh.semi.project.bond.model.service.ReplyService;
import kh.semi.project.bond.model.vo.Reply;

@RestController
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private ReplyService service;
	
	// 댓글 목록 조회
	@GetMapping("/list")
	public String selectReplyList(int postNo) {
		
		List<Reply> rList = service.selectReplyList(postNo);
		return new Gson().toJson(rList);
	}
	
	
}
