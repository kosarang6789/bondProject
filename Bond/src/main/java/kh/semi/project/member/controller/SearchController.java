//package kh.semi.project.member.controller;
//
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import kh.semi.project.member.model.service.SearchService;
//
//@Controller
//public class SearchController {
//
//	@Autowired
//	private SearchService service;
//	
//	@GetMapping("/group/{groupNo}")
//	public String searchPage(
//			@PathVariable("groupNo") int groupNo,
//			@RequestParam Map<String, Object> pm,
//			Model model
//			) {
//		
//		// 검색인 경우
//		pm.put("groupNo", groupNo); // 본 번호를 pm에 추가
//		// pm == {groupNo, key, query}
//		Map<String, Object> map = service.selectGroupList(pm);
//		model.addAttribute("map", map);
//		
//		return null;
//	}
//	
//}
