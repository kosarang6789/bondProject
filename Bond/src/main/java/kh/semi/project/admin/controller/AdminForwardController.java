package kh.semi.project.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminForwardController {

	// 페이지 확인용 임시 컨트롤러입니다.
	
	/** 공지사항 리스트 페이지로 이동
	 * @return
	 */
	@GetMapping("/admin/noticeList/temp")
	public String goNoticeList(){
		return "/admin/noticeList";
	}
	
	@GetMapping("/admin/noticeDetail/temp")
	public String goNoticeDetail(){
		return "/admin/noticeDetail";
	}
	
	/** 회원 리스트 페이지로 이동
	 * @return
	 */
	@GetMapping("/admin/memberList/temp")
	public String goMemberList() {
		return "/admin/memberList";
	}
	
	@GetMapping("/admin/memberDetail/temp")
	public String goMemberDetail(){
		return "/admin/memberDetail";
	}
	
	/** 게시글 리스트 페이지로 이동
	 * @return
	 */
	@GetMapping("/admin/postList/temp")
	public String goPostList() {
		return "/admin/postList";
	}
	
	@GetMapping("/admin/postDetail/temp")
	public String goPostDetail(){
		return "/admin/postDetail";
	}
	
	/** 모임 리스트 페이지로 이동
	 * @return
	 */
	@GetMapping("/admin/groupList/temp")
	public String goGroupList() {
		return "/admin/groupList";
	}
	
	@GetMapping("/admin/groupDetail/temp")
	public String goGroupDetail(){
		return "/admin/groupDetail";
	}
	
	/** 신고 리스트 페이지로 이동
	 * @return
	 */
	@GetMapping("/admin/reportList/temp")
	public String reportLIst() {
		return "/admin/reportList";
	}
	
	@GetMapping("/admin/reportDetail/temp")
	public String goReportDetail(){
		return "/admin/reportDetail";
	}
	
	
	
}
