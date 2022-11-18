package kh.semi.project.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.semi.project.member.model.service.FindEPService;
import kh.semi.project.member.model.vo.Member;

// 이메일 비밀번호 찾기

@Controller
@RequestMapping("/member")
public class FindEPController {
	
	@Autowired
	private FindEPService service;

	
	/** 이메일 찾기 페이지 이동
	 * @return
	 */
	@GetMapping("/findEmail")
	public String GoFindEmail() {
		return "/member/findEmail";
	}
	
	@PostMapping("/findEmail")
	public String findEmail(Member inputMember, Model model) {
		
		Member selectMember = service.findEmail(inputMember);
		String memberEmail=null;
		if(selectMember != null) {
			memberEmail = selectMember.getMemberEmail();
			model.addAttribute("memberEmail", memberEmail);
		}
		model.addAttribute("emailCheck", 0);

		return "/member/findEmail";
	}
	
	
	/** 비밀번호 찾기
	 * @return
	 */
	@GetMapping("/findPw")
	public String goFindPw() {
		return "/member/findPw";
	}
	
//	@PostMapping("/findPw")
//	public String findPw(Model model, Member inputMember) {
//		
//		Member selectMember = service.findPw(inputMember);
//		
//		return "member/findPw";
//	}
	

	
}
