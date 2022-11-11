package kh.semi.project.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.semi.project.member.model.service.DupService;

// 중복 검사용 컨트롤러
@Controller
public class DupController {
	
	@Autowired
	private DupService service;
	
	// 이메일 중복 검사
	@GetMapping("/emailDupCheck")
	@ResponseBody
	public int emailDupCheck(String memberEmail) {
		int result = service.emailDupCheck(memberEmail);
		return result;
	}
	
	@GetMapping("/nameDupCheck")
	@ResponseBody
	public int nameDupCheck(String memberName) {
		int result = service.nameDupCheck(memberName);
		return result;
	}

}
