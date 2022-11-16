package kh.semi.project.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.semi.project.admin.model.service.AdminListService;
import kh.semi.project.member.model.vo.Member;

@Controller
public class AdminListController {
	
	@Autowired
	private AdminListService service;
	
	
	/** 회원 정보 출력(ajax)
	 * @param keyword
	 * @return
	 */
	@PostMapping("/selectMemberList")
	@ResponseBody
	public String selectMemberList(String keyword){
		
		List<Member> memberList = service.selectMemberList(keyword);
		
		return new Gson().toJson(memberList);
	}
}
