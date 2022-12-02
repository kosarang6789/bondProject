package kh.semi.project.bond.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kh.semi.project.bond.model.service.BondMemberService;
import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.GroupMemberList;
import kh.semi.project.member.model.vo.Member;


@Controller
@SessionAttributes({"loginMember", "groupInfo"})
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
//	@ResponseBody
	public String memberList(
			@SessionAttribute("loginMember") Member loginMember,
			@SessionAttribute("groupInfo") Group groupInfo,
			Model model) {
		
		int groupNo = groupInfo.getGroupNo();
		
		Map<String, Object> memMap = serivce.selectMemberList(groupNo);
		
		memMap.put("loginMember", loginMember);
		
		model.addAttribute("memMap", memMap);
		
//		System.out.println(memMap);

		
		return "bond/bondMemberList";
//		return new Gson().toJson(memMap);
	}
	
	@GetMapping("/bondMemberList/scroll")
	@ResponseBody
	public String memberListScroll(
			Model model,
			@RequestParam(value="cp", required=false, defaultValue= "1") int cp,
			HttpServletRequest req, HttpServletResponse resp,
			@SessionAttribute(value="loginMember", required=false) Member loginMember,
			@SessionAttribute("groupInfo") Group groupInfo,
			RedirectAttributes ra) {
		
		int groupNo = groupInfo.getGroupNo();
		
		Map<String, Object> memMap = serivce.memberListScroll(groupNo, cp);
		
		model.addAttribute("memMap", memMap);
		
		return new Gson().toJson(memMap);
	}
	
	
	

}
