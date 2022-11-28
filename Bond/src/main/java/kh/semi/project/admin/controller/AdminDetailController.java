package kh.semi.project.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.semi.project.admin.model.service.AdminDetailService;
import kh.semi.project.admin.model.vo.Report;
import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.member.model.vo.Member;

@Controller
@RequestMapping("/admin") // 공통 링크 작성
@SessionAttributes("report")
public class AdminDetailController {
	
	@Autowired
	private AdminDetailService service;
	
	/** 회원 상세 조회
	 * @param memberNo
	 * @param model
	 * @return
	 */
	@GetMapping("/member/{memberNo}")
	public String selectMemberDetail(
			@PathVariable("memberNo") String memberNo, 
			Model model
			) {
		
		int inputMemberNo = Integer.parseInt(memberNo);
		
		Member member = service.selectMemberDetail(inputMemberNo);
		
		model.addAttribute("member", member);
		return "admin/memberDetail";
	}
	
	/** 모임 상세 조회
	 * @param groupNo
	 * @param model
	 * @return
	 */
	@GetMapping("/group/{groupNo}")
	public String selectGroupDetail(
			@PathVariable("groupNo") String groupNo,
			Model model
			) {
		
		int inputGroupNo = Integer.parseInt(groupNo);
		
		Group group = service.selectGroupDetail(inputGroupNo);
		
		model.addAttribute("group", group);
		return "admin/groupDetail";
		
	}
	
	/** 게시글 상세 조회
	 * @param groupNo
	 * @param model
	 * @return
	 */
	@GetMapping("/post/{postNo}")
	public String selectPostDetail(
			@PathVariable("postNo") String postNo,
			Model model
			) {
		
		int inputPostNo = Integer.parseInt(postNo);
		
		Post post = service.selectPostDetail(inputPostNo);
		
		model.addAttribute("post", post);
		return "admin/postDetail";
		
	}
	
	/** 신고 내역 상세 조회
	 * @param groupNo
	 * @param model
	 * @return
	 */
	@GetMapping("/report/{reportNo}")
	public String selectReportDetail(
			@PathVariable("reportNo") String reportNo,
			Model model
			) {
		
		int inputReportNo = Integer.parseInt(reportNo);
		
		Report report = service.selectReportDetail(inputReportNo);
		
		model.addAttribute("report", report);
		
		return "admin/reportDetail";
		
	}
	
}
