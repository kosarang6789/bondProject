package kh.semi.project.bond.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.semi.project.bond.model.service.BondMemberService;
import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.GroupMemberList;
import kh.semi.project.member.model.vo.Member;


@Controller
@SessionAttributes({"loginMember", "groupInfo", "memberList"})
public class BondMemberController {
	
	@Autowired
	private BondMemberService serivce;
	
//	
//	// 그룹 멤버 리스트 페이지 이동
//	@GetMapping("/bondMemberList")
//	public String goMemberList() {
//		return "bond/bondMemberList";
//	}
//	
	
	// 그룹 멤버 리스트 가져오기
	@GetMapping("/bondMemberList")
	public String memberList(
//			@SessionAttribute("loginMember") Member loginMember,
			@SessionAttribute("groupInfo") Group groupInfo,
			Model model) {
		
		int groupNo = groupInfo.getGroupNo();
		
		Map<String, Object> memMap = serivce.selectMemberList(groupNo);
		
		model.addAttribute("memMap", memMap);

		
		return "bond/bondMemberList";
	}
	
	

}
