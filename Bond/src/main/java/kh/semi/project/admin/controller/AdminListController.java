package kh.semi.project.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.semi.project.admin.model.service.AdminListService;
import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.member.model.vo.Member;

@Controller
@RequestMapping("/admin")
public class AdminListController {
	
	@Autowired
	private AdminListService service;
	
	
	/** 회원 목록 출력(ajax)
	 * @param keyword
	 * @return memberList
	 */
	@GetMapping("/member/list")
	@ResponseBody
	public String selectMemberList(String keyword, int opt){
		
		List<Member> memberList = service.selectMemberList(keyword, opt);
		
		return new Gson().toJson(memberList);
	}
	
	
	/** 모임 목록 출력(ajax)
	 * @param keyword
	 * @return groupList
	 */
	@GetMapping("/group/list")
	@ResponseBody
	public String selectGroupList(String keyword, int opt){
		
		List<Group> groupList =  service.selectGroupList(keyword, opt);
		
		return new Gson().toJson(groupList);
		
	}
}
