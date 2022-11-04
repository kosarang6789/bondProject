package kh.semi.project.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.semi.project.member.model.service.MemberService;
import kh.semi.project.member.model.vo.Member;

@Controller
public class MainController {
	
	// 메인화면(로그인 전 화면)으로 이동
	@GetMapping("/")
	public String main() {
		return "redirect:/index/main";
	}
	

}
