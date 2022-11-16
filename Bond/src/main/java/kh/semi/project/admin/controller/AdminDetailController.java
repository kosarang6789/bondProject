package kh.semi.project.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.semi.project.member.model.vo.Member;

@Controller
@RequestMapping("/admin") // 공통 링크 작성
public class AdminDetailController {
	
	@PostMapping("/selectMemberDetail")
	public String selectMemberDetail(Member inputMember) {
		
		int memberNo = inputMember.getMemberNo();
		
		System.out.println(memberNo);
		return "redirect:memberDetail";
	}
}
