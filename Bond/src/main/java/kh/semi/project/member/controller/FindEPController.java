package kh.semi.project.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

// 이메일 비밀번호 찾기

@Controller
public class FindEPController {

	
	/** 이메일 찾기 페이지 이동
	 * @return
	 */
	@GetMapping("/member/findEmail")
	public String GoFindEmail() {
		return "/member/findEmail";
	}
	

	
}
