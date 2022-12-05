package kh.semi.project.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import kh.semi.project.member.model.vo.Member;

// 관리자 로그인 여부 인터셉터
public class AdminInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 세션을 얻어옴
		HttpSession session = request.getSession();
		
		Member member = (Member)session.getAttribute("loginMember");
		
		
		if(!member.getAuthority().equals("1")) { // 관리자가 맞으면
			response.sendRedirect("referer:/"); // 로그인 회원의 메인페이지로 리다이렉트
			return false;
		} else {
			return true;
		}
		
		
	}
}
