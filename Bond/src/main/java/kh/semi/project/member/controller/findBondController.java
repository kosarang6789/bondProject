package kh.semi.project.member.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.member.model.service.FindBondService;
import kh.semi.project.member.model.vo.Member;

@Controller
public class findBondController {
	
	@Autowired
	private FindBondService service;
	
	@GetMapping("/member/groupTopic/{topicCode}")
	public String groupTopicPage(	
			@PathVariable("topicCode") int topicCode,
			@SessionAttribute("loginMember") Member loginMember,
			Model model) {
		
		// 카테고리별 본드 조회(topicCode)
		List<Map<String, Object>> groupTopic = service.groupTopic(topicCode);
		
		return "member/groupTopic";
	}

	
	

}
