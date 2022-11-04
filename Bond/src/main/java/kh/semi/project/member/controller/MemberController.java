package kh.semi.project.member.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.semi.project.member.model.service.MemberService;
import kh.semi.project.member.model.vo.Member;

@SessionAttributes("loginMember")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	// bean을 의존성 주입받음
	// Service 클래스에서 @Service 어노테이션을 작성해서 bean으로 만들었음!
	
	/*    
	 * @ModelAttribute 어노테이션 사용
	 * 
	 * [작성법]
	 * @ModeAttribute VO타입 매개변수명
	 * -> 파라미터의 name 속성 값이
	 * 	  지정된 VO의 필드명과 같으면
	 *    해당 VO 객체의 필드에 파라미터를 세팅
	 *    
	 * [조건]
	 * 1. name 속성 값과 필드 명이 같아야 함. -> 값을 얻어오지 못한다면 jsp 파일에서 name 확인
	 * 2. VO에 반드시 기본 생성자가 존재해야 함.
	 * 3. VO에 반드시 setter가 존재해야 함.
	 * 
	 **/
	
	// Model : 데이터 전달용 객체
	// - 데이터를 Map 형식(K:V)으로 저장하여 전달하는 객체로써
	// - request scope가 기본값
	// + @SessionAttributes 어노테이션과 함께 작성 시
	//   session scope로 변환 가능
	
	// 로그인 전 화면
	@GetMapping("/index/main")
	public String main() {
		return "/common/indexMain";
	}
	
	// 로그인 화면
	@GetMapping("/login")
	public String loginPage() {
		return "/member/login";
	}
	
	// 로그인 하기
	@PostMapping("/login")
	public String login(/*@ModelAttributes*/ Member inputMember // Member 객체를 얻어옴
					  , Model model // Model : 데이터를 Map 형태로 저장, 전달하는 객체로 request scope를 기본값으로 가짐
					  , RedirectAttributes ra // redirect 시 값을 전달할 때 사용하는 객체로 request scope에 위치하나, redirect 시에만 session scope로 이동함
					  , @RequestHeader(value="referer") String referer ) {
		Member loginMember = service.login(inputMember); // ModelAttribute를 사용하고 있어서, 별도의 세팅 작업이 필요하지 않음
		
		String path = null;
		
		if(loginMember != null) {
			if(loginMember.getAuthority().equals("1")) { 
				path= "/admin/memberList"; 
			};
			
			if(loginMember.getAuthority().equals("0")) { 
				path= "/member/mainPage";
			};
			
			model.addAttribute("loginMember", loginMember);
			
		} else {
			path = referer;
			
			ra.addFlashAttribute("message", "아이디, 비밀번호를 확인해주세요");
			// session scope를 없애야함 왜?
			// RedirectAttributes의 특징 때문에! 
			// -> redirect중에만 session scope에 위치하고, 그 외에는 request scope 단에 위치함
			// -> jsp로 넘어간 후에는 request scope에 위치하기 때문에, request scope로 바꾸거나 message라고 입력
		}
		
		return "redirect:" + path;
		
	}
	
	/** 로그인 후 회원 메인 페이지로 이동
	 * @return
	 */
	@GetMapping("/member/mainPage")
	public String goMainPage() {
		return "/member/mainPage";
	}
	
	/** 로그아웃 하기
	 * @return
	 */
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:/";
	}
}
