package kh.semi.project.myPage.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.semi.project.member.model.vo.Member;
import kh.semi.project.myPage.model.service.MyPageService;



@RequestMapping("/myPage")
@SessionAttributes("loginMember")
@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
	// 마이페이지 프로필 수정 페이지 이동
	@GetMapping("/myPage")
	public String goMyPage() {
		return "myPage/myPage";
	}
	
	// 마이페이지 비밀번호 변경 수정 페이지 이동
	@GetMapping("/myPage-changePw")
	public String changePw() {
		return "myPage/myPage-changePw";
	}
	
	// 마이페이지 탈퇴 페이지 이동
	@GetMapping("/myPage-secession")
	public String memberDelete() {
		return "myPage/myPage-secession";
	}
	
	
	// 마이페이지 비밀번호 변경
	@PostMapping("/secession")
	public String secession(
			String memberPw,
			SessionStatus status,
			@SessionAttribute("loginMember") Member loginMember,
			RedirectAttributes ra) {
		
		int result = service.secession(memberPw, loginMember.getMemberNo());
		
		String message = null;
		String path = null;
		
		if(result>0) { // 탈퇴 성공
			message = "탈퇴 성공";
			path = "/";
			status.setComplete();
		}else {
			message = "비밀번호가 일치하지 않습니다.";
			path = "myPage/myPage-secession";
		}
		
		ra.addFlashAttribute("message", message);
		
		return "redirect:" + path;
	}

}
