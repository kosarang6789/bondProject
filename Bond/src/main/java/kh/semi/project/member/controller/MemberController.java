package kh.semi.project.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kh.semi.project.bond.model.service.BondService;
import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.member.model.service.MemberService;
import kh.semi.project.member.model.vo.Member;
import kh.semi.project.plan.model.vo.Plan;

@Controller
@SessionAttributes({"loginMember", "message", "myGroupList", "groupInfo"})
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BondService bondService;
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
		return "common/indexMain";
	}
	
	// 로그인 화면
	@GetMapping("/login")
	public String loginPage() {
		return "member/login";
	}
	
	// 로그인 하기
	@PostMapping("/login")
	public String login(/*@ModelAttributes*/ Member inputMember // Member 객체를 얻어옴
					  , Model model // Model : 데이터를 Map 형태로 저장, 전달하는 객체로 request scope를 기본값으로 가짐
					  , RedirectAttributes ra // redirect 시 값을 전달할 때 사용하는 객체로 request scope에 위치하나, redirect 시에만 session scope로 이동함
					  , @RequestHeader(value="referer") String referer
					  , @RequestParam(value="saveId", required = false) String saveId
					  , HttpServletResponse resp) {
		Member loginMember = service.login(inputMember); // ModelAttribute를 사용하고 있어서, 별도의 세팅 작업이 필요하지 않음
		
		String path = null;
		
		if(loginMember != null) {
			if(loginMember.getAuthority().equals("1")) { // 관리자
				path= "/admin/mainPage"; 
				model.addAttribute("loginMember", loginMember);
			}
			
			if(loginMember.getAuthority().equals("0")) { // 회원
				// 신고 여부 조회
				String checkReport = service.checkReport(loginMember.getMemberNo());
				
				if(checkReport == null) { // 신고 기록이 없으면
					path= "/member/mainPage";
					model.addAttribute("loginMember", loginMember);
					
					Cookie cookie = new Cookie("saveId", loginMember.getMemberEmail());
					if(saveId != null) {
						cookie.setMaxAge(60*60*24*90); // 90일 동안 유지
					}else {
						cookie.setMaxAge(0);
					}
					cookie.setPath("/");
					resp.addCookie(cookie);
					
				} else { // 신고 기록이 있으면
					path = referer;
					
					String notice = "계정 사용 중지됨"
							+ "(기간 : " + checkReport
							+ ") 자세한 사항은 고객센터(help@kosaran)으로 문의 바랍니다.";
					ra.addFlashAttribute("message", notice);
				}
			}
//				model.addAttribute("loginMember", loginMember);
			
			
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
	
	
	/** 로그아웃 하기
	 * @return
	 */
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:/";
	}
	
	/** 회원가입 페이지 이동
	 * @return
	 */
	@GetMapping("/signUp")
	public String signUpPage() {
		return "/member/signUp";
	}
	
	@PostMapping("/signUp")
	public String signUp(Member inputMember, RedirectAttributes ra, 
				@RequestHeader("referer") String referer) {
		
		int result = service.signUp(inputMember);
		
		String path = null;
		String message = null;
		
		if(result>0) {
			path = "/signUpOk";
//			message="회원 가입 성공!";
		}else { // 실패 시
			path=referer;
			message="회원 가입 실패...";
			
			// 이전 페이지로 돌아갔을 때 입력했던 값을 같이 전달
			inputMember.setMemberPw(null); // 비밀번호 삭제
			ra.addFlashAttribute("tempMember",inputMember);
		}
		
		ra.addFlashAttribute("message",message);
		
		return "redirect:"+path;
		
	}
	
	/** 회원가입 후 페이지 이동
	 * @return
	 */
	@GetMapping("/signUpOk")
	public String goSignUpOkPage() {
		return "member/signUpOk";
	}
	
	
	/** 로그인 후 회원 메인 페이지로 이동
	 * @return
	 */
	@GetMapping("/member/mainPage")
	public String goMainPage(@SessionAttribute("loginMember") Member loginMember,
							Model model) {
		// 가입한 그룹(본드) 리스트 정보 불러오기(조회)
		List<Map<String, Object>> myGroupList = service.selectMyGroup(loginMember.getMemberNo());
		
		if(myGroupList != null) {
			model.addAttribute("myGroupList", myGroupList);
		}
		
		return "member/mainPage";
	}
	
	@GetMapping("/member/findBond")
	public String findBondPage(			
			@SessionAttribute("loginMember") Member loginMember,
			Model model) {
		
		// 가입X 본드 조회(groupNo)
		List<Map<String, Object>> groupJoinNo = service.selectJoinNo(loginMember.getMemberNo());
		
		if(groupJoinNo != null) { // 가입X 본드가 있을 경우 
			model.addAttribute("groupJoinNo", groupJoinNo);
		}
		return "member/findBond";
	}
	
	// 로그인 시 해당 회원이 가입한 모임의 모든 일정 목록 조회
	@GetMapping("/myAllPlans")
	@ResponseBody
	public String getMyAllPlans(HttpSession session) {
		// 1. 세션에서 회원 정보를 가져옴
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		// 2. 해당 회원의 회원 번호를 이용, 가입한 모임의 모든 일정 목록을 가져옴
		List<Plan> myAllPlanList = service.getMyAllPlans(loginMember.getMemberNo());
		
		// 3. 가져온 목록을 json형식으로 반환(feat. Gson)
		return new Gson().toJson(myAllPlanList);
	}
	
	// 일정 클릭 시 리다이렉트
	@GetMapping("/goBondPlan/{groupNo}")
	public String goBondPlanPage(
			@PathVariable("groupNo") int groupNo,
			Model model
			) {
		
		Group groupInfo = bondService.selectGroupInfo(groupNo);
		
		model.addAttribute("groupInfo", groupInfo);
		
		return "redirect:/bond/" + groupNo + "/plan";
	}
	
	

	
}
