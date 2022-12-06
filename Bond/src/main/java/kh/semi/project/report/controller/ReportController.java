package kh.semi.project.report.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Message;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.GroupMemberList;
import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.member.model.vo.Member;
import kh.semi.project.report.model.service.ReportService;
import kh.semi.project.report.model.vo.Report;

@Controller
@SessionAttributes({"loginMember", "message"})
@RequestMapping("report")
public class ReportController {
	
	@Autowired
	private ReportService service;
	
	// 임시 신고 페이지1로 이동
	@GetMapping("/tempReport")
	public String goTempReport() {
		return "report/tempReportPage";
	}
	
	// 신고하기 페이지로 정보 전달
	@GetMapping("/{target}/{input}")
	public String makeReportPage(
			@PathVariable("target") String target,
			@PathVariable("input") int input,
			Model model, HttpSession session
			) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int typeCode = 0;
		
		if(target.equals("member")) { // 타겟이 회원인 경우
			
			// 내가 리더인지 가져오기
			Member loginMember = (Member)session.getAttribute("loginMember");
			Group groupInfo = (Group)session.getAttribute("groupInfo");
			GroupMemberList getMyLeaderYN = service.getMyLeaderYN(loginMember.getMemberNo(), groupInfo.getGroupNo());
			map.put("getMyLeaderYN", getMyLeaderYN);
			
			// 회원 정보 불러오기
			Member member = service.getMemberInfo(input);
			map.put("member", member);
			typeCode = 1;
		}
		
		if(target.equals("group")) { // 타겟이 모임인 경우
			Group group = service.getGroupInfo(input);
			map.put("group", group);
			typeCode = 2;
		}
		
		if(target.equals("post")) { // 타겟이 게시글인 경우
			Post post = service.getPostInfo(input);
			map.put("post", post);
			typeCode = 3;
		}
		
		// 신고 사유 목록 가져오기
		List<Report> reasonList = service.getReportReasonList(typeCode);
		map.put("reasonList", reasonList);
	
		model.addAttribute("typeCode", typeCode);
		model.addAttribute("map", map);
		
		return "report/reportPage";
	}
	
	
	// 신고하기
	@PostMapping("/{target}/{targetNoStr}/{reasonCode}")
	public String makeReport(
			@PathVariable("target") String target,
			@PathVariable("targetNoStr") String targetNoStr,
			@PathVariable("reasonCode") int reasonCode,
			@RequestHeader("referer") String referer,
			RedirectAttributes ra,
			HttpSession session
			) {
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		int targetNo = Integer.parseInt(targetNoStr);
		
		int typeCode = 0;
		
		if(target.equals("member")) typeCode = 1;
		if(target.equals("group")) typeCode = 2;
		if(target.equals("post")) typeCode = 3;
		
		int memberNo = loginMember.getMemberNo();

		Map<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("targetNo", targetNo);
		infoMap.put("typeCode", typeCode);
		infoMap.put("reasonCode", reasonCode);
		infoMap.put("memberNo", memberNo);
		
		
		
		
		// 리더가 탈퇴시키기
		Group groupInfo = (Group)session.getAttribute("groupInfo");
		GroupMemberList getMyLeaderYN = service.getMyLeaderYN(loginMember.getMemberNo(), groupInfo.getGroupNo());
		
//		int result2 = 0;
//		int result = 0;
		String message = "";
		
		if(getMyLeaderYN.getLeaderYN().equals("Y")) { // 탈퇴시키기
			int groupNo = groupInfo.getGroupNo();
			int result2 = service.getout(targetNo, groupNo);
			
			if (result2>0) {
				message = "탈퇴되었습니다.";
			}else {
				message = "탈퇴 과정에서 오류가 발생했습니다.";
			}
		}else {
			
			// 회원 신고
			int result = service.makeReport(infoMap);
			
			if(result >= 0) {
				message = "신고가 접수되었습니다.";
			} else {
				message = "신고 접수 과정에서 오류가 발생했습니다.";
			}
		}
		
		
		// 트랜잭션 처리 필요
		
		String path = "";
		

		path = "report/{target}/{targetNoStr}";
//		
//		if(result >= 0) {
//			message = "신고가 접수되었습니다.";
//		} else if (result<0) {
//			message = "신고 접수 과정에서 오류가 발생했습니다.";
//		} else if (result2>0) {
//			message = "탈퇴되었습니다.";
//		}else {
//			message = "탈퇴 과정에서 오류가 발생했습니다.";
//		}
		
//		
//		if(result >= 0) {
//			message = "신고가 접수되었습니다.";
//		} else {
//			message = "신고 접수 과정에서 오류가 발생했습니다.";
//		}
//		
//		if(result2>0) {
//			message = "탈퇴되었습니다.";
//		}else { message = "탈퇴 과정에서 오류가 발생했습니다."; }
//		
		ra.addFlashAttribute("message", message);
		
		return "redirect:/" + path;
	}
	
	
	
	
}
