package kh.semi.project.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kh.semi.project.member.model.service.FindEPService;
import kh.semi.project.member.model.vo.Member;

// 이메일 비밀번호 찾기

@Controller
@RequestMapping("/member")
@SessionAttributes("authKey")
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
	
	// 인증번호 전송
	@GetMapping("/findPw/sendKey")
	@ResponseBody
	public int sendKey(Model model, String inputEmail, String inputName, String inputTel) {
		
		Member inputMember = new Member();
		
		inputMember.setMemberEmail(inputEmail);
		inputMember.setMemberName(inputName);
		inputMember.setMemberTel(inputTel);
		
		
		String sendEmail = service.findPw(inputMember);
		
		if(sendEmail != null) { // 일치 회원 있음
			String authKey = service.sendKey(sendEmail);
			if(authKey != null) { // 인증번호 O
				model.addAttribute("authKey", authKey);
				return 2;
			}else {
				return 1;
			}
		}else { // 일치 회원 없음
			return 0;
		}
	}
	
	// 인증번호 확인
    @GetMapping("/findPw/checkKey")
    @ResponseBody
    public int checkAuthKey(String inputKey, @SessionAttribute("authKey") String authKey, 
            SessionStatus status){
        
        if(inputKey.equals(authKey)) {
            status.setComplete();
            return 1;
        }
        
        return 0;
    }
	
//	@PostMapping("/findPw")
//	public String findPw(Member inputMember, Model model) {
//		
//		
//		
//		
//		return "member/findPw";
//	}
//	

	
}
