package kh.semi.project.admin.controller;

import java.util.List;
import java.util.Map;

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
	@GetMapping("/statistic/weekly/post")
	@ResponseBody
	public String selectWeeklyPost() {
		
		List<Statistic> weeklyPostList = service.selectWeeklyPost();
		
		return new Gson().toJson(weeklyPostList);
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
	
	/** 주간 회원 가져오기
	 * @return
	 */
	@GetMapping("/statistic/weekly/members")
	@ResponseBody
	public String selectWeeklyMembers() {
		
		Map<String, Object> weeklyMembersMap = service.selectWeeklyMembers();
		
		return new Gson().toJson(weeklyMembersMap);
	}
	
	/** 전체 수 가져오기(회원, 모임, 게시글)
	 * @return
	 */
	@GetMapping("/statistic/allPeriod/general")
	@ResponseBody
	public String selectAllPeriodGeneral() {
		
		List<Statistic> allPeriodGeneral = service.selectAllPeriodGeneral();
		
		return new Gson().toJson(allPeriodGeneral);
	}
	
	/** 일일 수 가져오기(회원, 모임, 게시글)
	 * @return
	 */
	@GetMapping("/statistic/today/general")
	@ResponseBody
	public String selectTodayGeneral() {
		
		List<Statistic> todayGeneral = service.selectTodayGeneral();
		
		return new Gson().toJson(todayGeneral);
		
	}
}
