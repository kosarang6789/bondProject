package kh.semi.project.myPage.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/myPage")
@Controller
public class MyPageController {
	
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
	
	

}
