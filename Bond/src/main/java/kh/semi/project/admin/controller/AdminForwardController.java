package kh.semi.project.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

// 페이지 이동(forward)용 컨트롤러
@Controller
@RequestMapping("/admin") // 공통 링크 작성
public class AdminForwardController {

	// 페이지 이동
	
	// 확인용 임시 포워드
	@GetMapping("/temp")
	public String goTempPage() {
		return "admin/temp";
	}
	
	// 임시 상세 페이지 포워드
	@GetMapping("/temp/noticeDetail")
	public String goNoticeDetailPage() {
		return "admin/noticeDetail";
	}
	
	@GetMapping("/temp/memberDetail")
	public String goMemberDetailPage() {
		return "admin/memberDetail";
	}
	
	@GetMapping("/temp/groupDetail")
	public String goGroupDetailPage() {
		return "admin/groupDetail";
	}
	
	@GetMapping("/temp/postDetail")
	public String goPostDetailPage() {
		return "admin/postDetail";
	}
	
	@GetMapping("/temp/reportDetail")
	public String goReportDetailPage() {
		return "admin/reportDetail";
	}
	
	
	// ==================================================================== //
	
	
	/** 관리자 메인 화면(noticeList)
	 * @return
	 */
	@GetMapping("/mainPage")
	public String adminMainPage() {
		return "redirect:noticeList";
	}

	/** 공지사항 리스트 페이지로 이동
	 * @return
	 */
	@GetMapping("/noticeList")
	public String goNoticeList(){
		return "admin/noticeList";
	}

	/** 회원 리스트 페이지로 이동
	 * @return
	 */
	@GetMapping("/memberList")
	public String goMemberList() {
		return "admin/memberList";
	}
	
	/** 게시글 리스트 페이지로 이동(postList)
	 * @return
	 */
	@GetMapping("/postList")
	public String goPostList() {
		return "admin/postList";
	}
	
	/** 모임 리스트 페이지로 이동(groupList)
	 * @return
	 */
	@GetMapping("/groupList")
	public String goGroupList() {
		return "admin/groupList";
	}
	
	/** 신고 리스트 페이지로 이동(reportList)
	 * @return
	 */
	@GetMapping("/reportList")
	public String goReportLIst() {
		return "admin/reportList";
	}
	
	@GetMapping("/memberDetail")
	public String goMemberDetail() {
		return "admin/memberDetail";
	}
	
}
