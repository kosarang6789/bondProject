package kh.semi.project.bond.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	// 댓글 등록
	@PostMapping("/insert")
	public int insertReply(Reply reply) {
		return service.insertReply(reply);
	}
	
	// 댓글 삭제
	@GetMapping("/delete")
	public int deleteReply(int replyNo) {
		return service.deleteReply(replyNo);
	}
	
	// 댓글 수정
	@PostMapping("/update")
	public int updateReply(Reply reply) {
		return service.updateReply(reply);
	}
}
