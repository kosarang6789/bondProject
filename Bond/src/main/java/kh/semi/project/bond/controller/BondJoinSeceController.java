package kh.semi.project.bond.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.semi.project.bond.model.service.BondJoinSeceService;
import kh.semi.project.bond.model.vo.GroupMemberList;
import kh.semi.project.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember", "groupInfo"})
public class BondJoinSeceController {
	
	@Autowired
	private BondJoinSeceService service;
	
	@GetMapping("/bond/{groupNo}/join")
	private String bondJoin(
			@SessionAttribute("loginMember") Member loginMember,
			@PathVariable("groupNo") int groupNo,
			Model model,
			@RequestHeader("referer") String referer) {
		
		int memberNo = loginMember.getMemberNo();
		
		int result = service.bondJoin(memberNo, groupNo);
		
		String path = null;
		String message = null;
		
		if(result > 0) { // 가입 성공
			
			message = "가입 성공";
			path = "/bond/"+groupNo;
		}else {
			message = "가입 실패";
			path = "/bond/"+groupNo;
		}
		
		
		return "redirect:"+path;
	}
}
