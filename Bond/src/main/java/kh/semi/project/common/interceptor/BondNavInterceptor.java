package kh.semi.project.common.interceptor;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kh.semi.project.bond.model.service.BondService;
import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.GroupMemberList;
import kh.semi.project.common.Util;
import kh.semi.project.member.model.vo.Member;

// 가입 안한 상태에서, nav 메뉴 사용하려고 한 경우
public class BondNavInterceptor implements HandlerInterceptor{
	
	@Autowired
	private BondService service;
	
	
	
	// 가입 안한 경우 확인
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		System.out.println("[BondNavInterceptor] 모임 미가입 여부 확인 : ");
		
		// 다운캐스팅 진행
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		// 세션 준비
		HttpSession session = req.getSession();
		
		// 세션에서 로그인 멤버 정보 가져옴
		Member loginMember = (Member)session.getAttribute("loginMember");
		Group groupInfo = (Group)session.getAttribute("groupInfo");
		
		// 공개 여부 가져옴
		String openYN = groupInfo.getOpenYN();
		
		// 이동하려는 주소를 가져옴
		String path = req.getRequestURI();
		
		// 보낼 주소
		String sendPath = "";
		
		// 비교에 사용할 groupNo 초기화
		int groupNo = -1;
		
		// 주소에서 숫자를 꺼냄
		try {
			groupNo = Util.getGroupNo(path);
		} catch(NumberFormatException numberE) {
			
		}
		
		GroupMemberList member = new GroupMemberList();
		
		member.setGroupNo(groupNo);
		member.setMemberNo(loginMember.getMemberNo());
		
		int result = service.selectMemberInfo(member);
		
		// 결과가 있으면
		if(result > 0) {
			System.out.print("nav 사용 가능!\n");
			

		} else {
			System.out.print("nav 사용 불가....\n ");
			sendPath = "redirect:/";
			resp.sendRedirect(sendPath);
		}
		
		
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
		
	
}
