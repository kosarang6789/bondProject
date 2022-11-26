package kh.semi.project.admin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.semi.project.admin.model.service.AdminListService;
import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.member.model.vo.Member;

@Controller
@RequestMapping("/admin")
public class AdminListController {
	
	@Autowired
	private AdminListService service;
	
	/** 회원 목록 출력(ajax)
	 * @param keyword
	 * @param opt
	 * @param cp
	 * @return
	 */
	@PostMapping("/member/list")
	@ResponseBody
	public String selectMemberList(
			String keyword, 
			@RequestParam(value="count", required=false, defaultValue="10") int count, // 현재 페이지 번호, 얻어온 파라미터가 없는 경우 기본값으로 1 부여
			@RequestParam(value="opt", required=false, defaultValue="1") int opt,
			@RequestParam(value="cp", required=false, defaultValue="1") int cp, // 현재 페이지 번호, 얻어온 파라미터가 없는 경우 기본값으로 1 부여
			@RequestParam Map<String, Object> pm
			) {
		
		Map<String, Object> map = service.selectMemberList(keyword, count, opt, cp);
		
		return new Gson().toJson(map);
	}
	
	/** 모임 목록 출력(ajax)
	 * @param keyword
	 * @param opt
	 * @param cp
	 * @return
	 */
	@PostMapping("/group/list")
	@ResponseBody
	public String selectGroupList(
			String keyword, 
			@RequestParam(value="count", required=false, defaultValue="10") int count, // 현재 페이지 번호, 얻어온 파라미터가 없는 경우 기본값으로 1 부여
			@RequestParam(value="opt", required=false, defaultValue="1") int opt,
			@RequestParam(value="cp", required=false, defaultValue="1") int cp, // 현재 페이지 번호, 얻어온 파라미터가 없는 경우 기본값으로 1 부여
			@RequestParam Map<String, Object> pm
			) {
		
		Map<String, Object> map = service.selectGroupList(keyword, count, opt, cp);
		
		return new Gson().toJson(map);
	}
	
	/** 게시글 목록 출력(ajax)
	 * @param keyword
	 * @param opt
	 * @return
	 */
	@PostMapping("/post/list")
	@ResponseBody
	public String selectPostList(
			String keyword, 
			@RequestParam(value="count", required=false, defaultValue="10") int count, // 현재 페이지 번호, 얻어온 파라미터가 없는 경우 기본값으로 1 부여
			@RequestParam(value="opt", required=false, defaultValue="1") int opt,
			@RequestParam(value="cp", required=false, defaultValue="1") int cp, // 현재 페이지 번호, 얻어온 파라미터가 없는 경우 기본값으로 1 부여
			@RequestParam Map<String, Object> pm
			) {
		
		Map<String, Object> map = service.selectPostList(keyword, count, opt, cp);
		
		return new Gson().toJson(map);
	}
}
