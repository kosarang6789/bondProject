package kh.semi.project.member.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.semi.project.member.model.service.FindEPService;
import kh.semi.project.member.model.vo.Member;

// 이메일 비밀번호 찾기

@Controller
@SessionAttributes({"authKey"})
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
	public int sendKey(Model model, String inputEmail, String inputName, String inputTel,
			HttpSession session) {
		
		Member inputMember = new Member();
		
		inputMember.setMemberEmail(inputEmail);
		inputMember.setMemberName(inputName);
		inputMember.setMemberTel(inputTel);
		
		
		Member selectMem = service.findPw(inputMember);
		
		if(selectMem != null) { // 일치 회원 있음
//			model.addAttribute("selectMem", selectMem);
			session.setAttribute("selectMem", selectMem);
			String authKey = service.sendKey(selectMem.getMemberEmail());
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
    public int checkAuthKey(String inputKey, 
    		@SessionAttribute("authKey") String authKey, 
    		HttpSession session,
            SessionStatus status, Model model){
        
        if(inputKey.equals(authKey)) {
//        	model.addAttribute("pwCheck", 0);
            status.setComplete();

//            String pwCheck = "ok";
//            session.setAttribute("pwCheck", pwCheck);
            return 1;
        }
        
        return 0;
    }
	
    // 비밀번호 찾기 -> 변경
	@PostMapping("/changePw")
	public String changePw(Model model,
			@RequestParam Map<String, Object> paramMap,
			RedirectAttributes ra,
//			@SessionAttribute(value="selectMem", required = false) Member selectMem
			HttpSession session
			) {
		
//		int memNo = selectMem.getMemberNo();
		Member selectMem = (Member)session.getAttribute("selectMem");
		int memberNo = selectMem.getMemberNo();
		paramMap.put("memberNo", memberNo);
		
		int result = service.changePw(paramMap);
		
		
		String message = null;
		
		if(result>0) {
			
		}else {
			message = "비밀번호 변경에 실패했습니다.";
		}
		ra.addFlashAttribute("message", message);

		return "member/login";
	}
	

	
}
