package kh.semi.project.common.filter;

import java.io.IOException;

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

import org.springframework.stereotype.Component;

@Component
@WebFilter(filterName = "loginFilter",
		   urlPatterns = {"/member/*", "/bond/*", "/logout", "/admin/*", "/report/*", "/myPage/*"})
public class LoginFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("로그인 필터 생성");
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("[Login Filter] 로그인 필터 ");
		// org.springframework.web.servlet
		
		// 필터는 클라이언트의 요청이 되자마자
		// 또는 응답이 되기 직전에 필터링 코드를 추가할 수 있는 기능
		
		// 다운캐스팅 진행
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		// 로그인 여부 확인
		// -> session에 loginMember가 있는지 확인
		HttpSession session = req.getSession();
		
		if(session.getAttribute("loginMember") == null) { // 로그인 X
			
			System.out.println("[LoginFilter] 로그인 안됨");
			
			session.setAttribute("message", "로그인 후 이용해주세요.");
			resp.sendRedirect("/login"); // 메인페이지로 리다이렉트
		}else { // 로그인 O
			// 연결된 다음 필터로 이동(없으면 Servlet / JSP로 이동)
			
			System.out.println("[LoginFilter] 로그인 확인");
			
			chain.doFilter(request, response);
		}
		
	}

	@Override
	public void destroy() {
		System.out.println("로그인 필터 파괴");
		
	}

}
