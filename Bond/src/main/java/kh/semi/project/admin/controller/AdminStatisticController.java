package kh.semi.project.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.semi.project.admin.model.service.AdminStatisticService;
import kh.semi.project.admin.model.vo.Statistic;

@Controller
@RequestMapping("/admin")
public class AdminStatisticController {
	
	@Autowired
	private AdminStatisticService service;
	
	/** 게시글 작성 개수 리스트 가져오기
	 * @return
	 */
	@GetMapping("/statistic/weekely/post")
	@ResponseBody
	public String selectWeeklyPost() {
		
		List<Statistic> weekelyPostList = service.selectWeeklyPost();
		
		return new Gson().toJson(weekelyPostList);
	}
	
	
	/** 모임 통계 가져오기
	 * @return
	 */
	@GetMapping("/statistic/topic/doughnut")
	@ResponseBody
	public String selectTopicDoghunt() {
		
		List<Statistic> topicDoughnutList = service.selectTopicDoughnut();
		
		return new Gson().toJson(topicDoughnutList);
	}
	
	@GetMapping("/statistic/weekely/members")
	@ResponseBody
	public String selectWeeklyMembers() {
		
		List<Statistic> weeklyMembers = service.selectWeeklyMembers();
		
		return new Gson().toJson(weeklyMembers);
	}
}
