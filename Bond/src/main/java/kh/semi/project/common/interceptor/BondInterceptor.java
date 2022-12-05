package kh.semi.project.common.interceptor;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.semi.project.bond.model.vo.Group;

public class BondInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 다운캐스팅 진행
			HttpServletRequest req = (HttpServletRequest)request;
			HttpServletResponse resp = (HttpServletResponse)response;
			
			// 로그인 여부 확인
			// -> session에 loginMember가 있는지 확인
			HttpSession session = req.getSession();
			
			if(session.getAttribute("myGroupList") == null) { // 모임 정보 없으면
				resp.sendRedirect("referer:/"); // 로그인 회원의 메인페이지로 리다이렉트
			} 
			// 로그인 O
			return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		
		// 세션을 얻어옴
		HttpSession session = request.getSession();
		
		
		// 세션에서 group 목록을 꺼냄
		List<Group> myGroupList = (List<Group>)session.getAttribute("myGroupList");
		
		// 현재 이동하려는 bond의 groupNo를 얻어옴. 어떻게?
		int thisGroupNo = (Integer)session.getAttribute("thisGroupNo");
		
		// 모임 그룹 목록에 그룹 번호가 있는지 검사
		boolean isContain = false;
		
		for( Group myGroup : myGroupList) {
			if(myGroup.getGroupNo() == thisGroupNo) {
				isContain = true; // 값이 있으면 true로
			}
		}
		
		if(!isContain) {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss z");
			
			System.out.println("[Scheduler] BondInterceptor postHandle (" + sdf.format(date) + ")");
			
			response.sendRedirect("referer:/");
			
		}
		
	}
	
}
