package kh.semi.project.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//페이지 이동(forward)용 컨트롤러
@Controller
@RequestMapping("/admin") // 공통 링크 작성
public class AdminController {
	
	/** 관리자 메인 화면(noticeList)
	 * @return
	 */
	@GetMapping("/mainPage")
	public String adminMainPage() {
		return "redirect:notice/list";
	}

	/** 공지사항 리스트 페이지로 이동
	 * @return
	 */
	@GetMapping("/notice/list")
	public String goNoticeList(){
		return "admin/noticeList";
	}

	/** 회원 리스트 페이지로 이동
	 * @return
	 */
	@GetMapping("/member/list")
	public String goMemberList() {
		return "admin/memberList";
	}
	
	/** 게시글 리스트 페이지로 이동(postList)
	 * @return
	 */
	@GetMapping("/post/list")
	public String goPostList() {
		return "admin/postList";
	}
	
	/** 모임 리스트 페이지로 이동(groupList)
	 * @return
	 */
	@GetMapping("/group/list")
	public String goGroupList() {
		return "admin/groupList";
	}
	
	/** 신고 리스트 페이지로 이동(reportList)
	 * @return
	 */
	@GetMapping("/report/list")
	public String goReportLIst() {
		return "admin/reportList";
	}
	
	/** 통계 페이지로 이동
	 * @return
	 */
	@GetMapping("/statistic")
	public String goStatisticPage() {
		return "admin/statistic";
	}
}
