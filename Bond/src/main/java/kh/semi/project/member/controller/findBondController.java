package kh.semi.project.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.member.model.service.FindBondService;
import kh.semi.project.member.model.vo.Member;

@Controller
@SessionAttributes("map")
public class findBondController {
	
	@Autowired
	private FindBondService service;
	
//	@GetMapping("/member/groupTopic")
//	public String groupTopic() {
//		return "member/groupTopic";
//	}
	
	@GetMapping("/member/groupTopic/{topicCode}")
	public String groupTopicPage(	
			@PathVariable("topicCode") int topicCode,
			@SessionAttribute("loginMember") Member loginMember,
			Model model) {
		
		// 카테고리별 본드 조회(topicCode)
		List<Map<String, Object>> groupTopic = service.groupTopic(topicCode);
		
		if(groupTopic != null) { // 본드가 있을 경우 
			model.addAttribute("groupTopic", groupTopic);
			
		}
		
		return "member/groupTopic";
	}
	
//	@ResponseBody
//	@PostMapping("/member/groupTopic/{topicCode}")
//	public String groupTopicPage(	
//			@PathVariable("topicCode") int topicCode,
//			@SessionAttribute("loginMember") Member loginMember,
//			Model model,
//			@RequestParam(value="cp", required=false, defaultValue= "1") int cp) {
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		// 카테고리별 본드 조회(topicCode)
//		
//		if(map != null) { // 본드가 있을 경우 
//			Map<String, Object> groupTopic = service.groupTopic(topicCode, cp);
//			map.put("groupTopic", groupTopic);
//			
//		}
//		
//		return new Gson().toJson(map);
//	}

	
	

}
