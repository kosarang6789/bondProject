package kh.semi.project.member.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.member.model.service.SearchService;

@Controller
public class SearchController {

	@Autowired
	private SearchService service;
	
	@GetMapping("/member/search")
	public String searchPage(
			@RequestParam Map<String,Object> pm,
			Model model
			) {
		
		if(pm.get("key") != null) {
			Map<String, Object> map = service.allGroupList(pm);
			model.addAttribute("map", map);
			
		}
		
		return "/member/search";
	}
	
}
