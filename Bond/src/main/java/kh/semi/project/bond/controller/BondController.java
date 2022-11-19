package kh.semi.project.bond.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.semi.project.bond.model.service.BondService;
import kh.semi.project.bond.model.vo.Group;

@Controller
@SessionAttributes({"loginMember", "groupInfo"})
public class BondController {

	@Autowired 
	private BondService service;
	
	/** 본드 클릭 시 본드 페이지 이동
	 * @return
	 */
	@GetMapping("/bond/{groupNo}")
	public String meetingAfterLogin(
		@PathVariable("groupNo") int groupNo,
		Model model) {
		
		// 본드 기본정보 불러오기(이름, 사진, 멤버수, 소개글)
		Group groupInfo = service.selectGroupInfo(groupNo);
		
		model.addAttribute("groupInfo", groupInfo);
		
		return "bond/bond";
	}
	
	// 사진첩 페이지로 이동 
	@GetMapping("/bond/{groupNo}/album")
	public String albumPage() {
		return "bond/album";
	}
	
	
	
}

