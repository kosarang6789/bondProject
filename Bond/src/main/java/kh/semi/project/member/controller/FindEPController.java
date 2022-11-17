package kh.semi.project.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

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
	@ResponseBody
	public String findEmail(String inputName, String inputTel) {
		
		Member member = service.findEmail(inputName, inputTel);

		return new Gson().toJson(member);
	}
	

	
}
