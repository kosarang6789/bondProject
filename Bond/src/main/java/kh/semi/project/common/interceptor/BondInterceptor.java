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

// 존재하지 않는 모임에 접근 시
public class BondInterceptor implements HandlerInterceptor{
	
	@Autowired
	private BondService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.print("[BondInterceptor] 모임 주소 검사 : ");
		
		// 다운캐스팅 진행
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		
		// 타당성 검사 (true)일때만 다음 필터로 진행
//		boolean valid = false;
		
		// 이동하려는 주소를 가져옴
		String path = req.getRequestURI();
		
		// 보낼 주소
		String sendPath = "";
		// 비교에 사용할 groupNo 초기화
		int requestGroupNo = -1;
		
		
		// 주소에서 숫자를 꺼냄
		try {
			requestGroupNo = Util.getGroupNo(path);
		} catch(NumberFormatException numberE) {
			// 주소가 아니면 진행시켜!
			return true;
		}
		
			
		// 존재하는 주소인지 확인
		int count = service.isExist(requestGroupNo);
			
		if(count > 0) {
			System.out.print("정상적인 경로입니다\n");
			
			return true;
		} else {
			System.out.print("비정상적인 경로입니다(page not found)\n");
			sendPath = "/pageNotFound";
			resp.sendRedirect(sendPath);
			return false;
		}
	}
	
	
}
