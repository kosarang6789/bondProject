package kh.semi.project.plan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.semi.project.plan.model.service.PlanService;
import kh.semi.project.plan.model.vo.Plan;

@Controller
public class PlanController {
	
	@Autowired
	private PlanService service;
	
	// 캘린더 페이지로 이동
	@GetMapping("/plan")
	public String goPlanPage() {
		return "plan/plan";
	}
	
	// 캘린더에 일정 등록
	@PostMapping("/plan/insert")
	@ResponseBody
	public String planInsert(
			@RequestParam(value="inputTitle") String inputTitle,
			@RequestParam(value="inputContent") String inputContent,
			@RequestParam(value="inputStartDate") String inputStartDate,
			@RequestParam(value="inputStartTime") String inputStartTime,
			@RequestParam(value="inputEndDate") String inputEndDate,
			@RequestParam(value="inputEndTime", required=false, defaultValue="NULL") String inputEndTime,
			@RequestParam(value="inputColor") String inputColor
			){
		
		Plan plan = new Plan();
		plan.setPostNo(1);
		plan.setPlanTitle(inputTitle);
		plan.setPlanContent(inputContent);
		plan.setPlanStart(inputStartDate);
		plan.setPlanEnd(inputEndDate);
		plan.setPlanColor(inputColor);
		
		int result = service.planInsert(plan);
		
		String message = "";
		
		if(result > 0) {
			message = "일정이 추가되었습니다.";
		} else {
			message = "데이터 전송 실패";
		}
		
		return new Gson().toJson(message);
		
	}
	
	// 캘린더에 일정 뿌리기
	@PostMapping("/plan/list")
	@ResponseBody
	public String getPlanList() {
		
		List<Plan> calendarList = service.getPlanList();
		
		return new Gson().toJson(calendarList);
	}
}
