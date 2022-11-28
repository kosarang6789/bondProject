package kh.semi.project.myPage.Controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.semi.project.member.model.vo.Member;
import kh.semi.project.myPage.model.service.MyPageService;



@RequestMapping("/myPage")
@SessionAttributes({"loginMember"})
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
	
	
	// 마이페이지 탈퇴
	@PostMapping("/secession")
	public String secession(
			String memberPw,
			SessionStatus status,
			@SessionAttribute("loginMember") Member loginMember,
			RedirectAttributes ra,
			@RequestHeader("referer") String referer) {
		
		int result = service.secession(memberPw, loginMember.getMemberNo());
		
		String message = null;
		String path = null;
		
		if(result>0) { // 탈퇴 성공
			message = "탈퇴 성공";
			path = "/";
			status.setComplete();
		}else {
			message = "비밀번호가 일치하지 않습니다.";
			path = referer;
		}
		
		ra.addFlashAttribute("message", message);
		
		return "redirect:" + path;
	}
	
	
	// 마이페이지 비밀번호 변경
	@PostMapping("/changePw")
	public String changePw(
			@RequestParam Map<String, Object> map,
			RedirectAttributes ra,
			@SessionAttribute("loginMember") Member loginMember) {
		
		map.put("memberNo", loginMember.getMemberNo());
		
		int result = service.changePw(map);
		
		
		String message = null;
		
		if(result>0) { // 비밀번호 변경 성공
			message = "비밀번호 변경에 성공하셨습니다.";
		}else {
			message = "현재 비밀번호가 일치하지 않습니다.";
		}
		
		ra.addFlashAttribute("message", message);
		
		return "redirect:/myPage/myPage-changePw";
	}
	
	
	// 마이페이지 내 정보 수정 - 이미지
	@PostMapping("/myPageImage")
	public String updateImage(
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam(value = "profileImage") MultipartFile profileImage,
			RedirectAttributes ra,
			HttpServletRequest req) throws Exception {
		
		String webPath = "/resources/images/member/profile/";
		String filePath = req.getSession().getServletContext().getRealPath(webPath);
		
		int result = service.updateImage(webPath, filePath, loginMember, profileImage);
		
		String message = null;
		
		if(result>0) {

			message = "프로필 이미지가 변경되었습니다.";
		}
		else		message = "프로필 이미지 변경이 실패했습니다.";
		
		ra.addFlashAttribute("message", message);
		
		return "redirect:myPage";
	}
	
	// 마이페이지 내 정보 수정 - 내 정보들
	@PostMapping("/myPageProfile")
	public String updateProfile(
			@SessionAttribute("loginMember") Member loginMember,
			Member inputMember,
			RedirectAttributes ra) {
		
		inputMember.setMemberNo(loginMember.getMemberNo());
		int result = service.updateProfile(inputMember);
		
		String message = null;
		
		if(result>0) {
			loginMember.setMemberName(inputMember.getMemberName());
			loginMember.setMemberTel(inputMember.getMemberTel());
			loginMember.setMemberBirth(inputMember.getMemberBirth());
			message = "내 정보가 수정되었습니다.";
		}
		else		 message = "내 정보 수정이 실패되었습니다.";
		
		ra.addFlashAttribute("message", message);
		
		return "redirect:myPage";
	}
	

}
