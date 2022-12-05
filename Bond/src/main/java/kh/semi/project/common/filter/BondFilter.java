package kh.semi.project.common.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.common.Util;
import kh.semi.project.member.model.vo.Member;

//@Component
//@WebFilter(filterName = "bondFilter",
//		   urlPatterns = "/bond/*")
//@Order(1)
public class BondFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("모임 이동 필터 생성");
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		// 필터는 클라이언트의 요청이 되자마자
		// 또는 응답이 되기 직전에 필터링 코드를 추가할 수 있는 기능
		
		// 다운캐스팅 진행
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		// 세션을 가져옴
		HttpSession session = req.getSession();
		
		// 세션에서 회원 로그인 객체를 꺼냄
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		// 돌려보낼 경로
		String sendPath = "";
		
		// 타당성 검사 (true)일때만 다음 필터로 진행
		boolean valid = false;
		
		// 로그인 여부
		if(loginMember != null) { // 로그인을 했으면
			// 세션에서 모임 리스트를 꺼냄
			List<Group> groupList = (List<Group>)session.getAttribute("myGroupList");
			
			// 이동하려는 주소를 가져옴
			String path = req.getRequestURI();
			
			// 비교에 사용할 groupNo 초기화
			int requestGroupNo = -1;
			
			try {
				// 주소에서 숫자를 꺼냄
				requestGroupNo = Util.getGroupNo(path);
				
				// 같으면 valid = true;
				for(Group group : groupList) {
					if(group.getGroupNo() == requestGroupNo) {
						valid = true;
					}
				}
				
			} catch (NumberFormatException e) {
				// 예외 발생 시 다음 필터를 진행하기 위해서 valid=true
				valid = true;
			}
			
			if(!valid) { // 가입하지 않은 경우
				System.out.println("가입하지 않은 모임입니다.");
				
				resp.sendRedirect(sendPath);
				
			} else { // 가입한 경우
				// 연결된 다음 필터로 이동(없으면 Servlet / JSP로 이동)
				chain.doFilter(request, response);
			}
			
		} else { // 로그인도 안했으면
			sendPath = "redirect:/";
			resp.sendRedirect(sendPath);
		}
		
	}

	@Override
	public void destroy() {
		System.out.println("모임 이동 필터 파괴");
		
	}

}
