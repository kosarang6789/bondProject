package kh.semi.project.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.semi.project.admin.model.service.AdminDetailService;
import kh.semi.project.member.model.vo.Member;

@Controller
@RequestMapping("/admin") // 공통 링크 작성
public class AdminDetailController {
	
	@Autowired
	private AdminDetailService service;
	
	/** 회원 상세 조회
	 * @param memberNo
	 * @param model
	 * @return
	 */
	@GetMapping("/selectMember/{memberNo}")
	public String selectMemberDetail(@PathVariable("memberNo") String memberNo, Model model) {
		
		System.out.println(memberNo);
		
		int inputMemberNo = Integer.parseInt(memberNo);
		
		Member member = service.selectMemberDetail(inputMemberNo);
		
		model.addAttribute("member", member);
		return "admin/memberDetail";
	}
	
}
