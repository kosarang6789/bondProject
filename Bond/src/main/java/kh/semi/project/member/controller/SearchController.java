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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.member.model.service.SearchService;

@Controller
@SessionAttributes("map")
public class SearchController {

	@Autowired
	private SearchService service;
	
	@GetMapping("/member/search")
	public String searchPage(
			@RequestParam Map<String,Object> pm,
			Model model
			) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(pm.get("key") != null) {
			Map<String, Object> allGroupList = service.allGroupList(pm);
			map.put("allGroupList", allGroupList);
			model.addAttribute("map",map);
		}
		
		return "/member/search";
	}
	
	
	
	@ResponseBody
	@PostMapping("/member/search")
	public String searchPageScroll(
			@RequestParam Map<String,Object> pm,
			@RequestParam(value="cp", required=false, defaultValue= "1") int cp
			) {
		Map<String, Object> map2 = new HashMap<String, Object>();
		
		if(pm.get("key") != null) {
			Map<String, Object> allGroupList = service.allGroupList(pm, cp);
			map2.put("allGroupList", allGroupList);
		}
		return new Gson().toJson(map2);
	}
	
		
		
//	@ResponseBody
//	@PostMapping("/member/search")
//	public String searchPageScroll(
//			@RequestParam Map<String,Object> pm,
//			@RequestParam(value="cp", required=false, defaultValue= "1") int cp,
//			Model model
//			) {
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		if(pm.get("key") != null) {
//			map = service.allGroupList(pm,cp);
//			model.addAttribute("map", map);
//		}
//		
//		return new Gson().toJson(map);
//	}
	
	
	
}
