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
	
	
	// 캘린더에 일정 뿌리기
	@PostMapping("/plan/select/list")
	@ResponseBody
	public String planSelectList() {
		
		List<Plan> planList = service.planSelectList();
		
		return new Gson().toJson(planList);
	}
	
	// 캘린더 일정 하나 정보 가져오기
	@PostMapping("/plan/select/detail")
	@ResponseBody
	public String planSelectDetail(
			@RequestParam(value="planNo", required=false) int planNo
			) {
		
		Plan plan = service.planSelectDetail(planNo);
		
		return new Gson().toJson(plan);
	}
	
	
	// 캘린더에 일정 등록
	@PostMapping("/plan/insert")
	@ResponseBody
	public String planInsert(
			@RequestParam(value="groupNo", required=false) int groupNo,
			@RequestParam(value="inputTitle", required=false, defaultValue="-1") String inputTitle,
			@RequestParam(value="inputContent", required=false, defaultValue="-1") String inputContent,
			@RequestParam(value="inputStart", required=false, defaultValue="-1") String inputStart,
			@RequestParam(value="inputEnd", required=false, defaultValue="NULL") String inputEnd,
			@RequestParam(value="inputColor", required=false, defaultValue="-1") String inputColor,
			@RequestParam(value="inputAllday", required=false, defaultValue="Y") String inputAllday
			){
		
		String message = "데이터 전송 실패";
		
		
		if(!inputTitle.equals("-1") || !inputContent.equals("-1") || !inputStart.equals("-1") || !inputColor.equals("1") ) {
			
			Plan plan = new Plan();
			plan.setGroupNo(groupNo);
			plan.setPlanTitle(inputTitle);
			plan.setPlanContent(inputContent);
			plan.setPlanStart(inputStart);
			plan.setPlanEnd(inputEnd);
			plan.setPlanColor(inputColor);
			plan.setPlanAllday(inputAllday);
			
			int result = service.planInsert(plan);
			
			
			if(result > 0) {
				message = "일정이 추가되었습니다.";
			}
			
		}
		
		return new Gson().toJson(message);
		
	}
	
//	// 캘린더 일정 업데이트
//	@PostMapping("/plan/update")
//	@ResponseBody
//	public String planUpdate() {
//		
//	}
//	
	// 캘린더 일정 삭제
	@PostMapping("/plan/delete")
	@ResponseBody
	public String planDelete(
			@RequestParam(value="planNo", required=false) int planNo
			) {
		
		String message = "데이터 전송 실패";
		
		int result = service.planDelete(planNo);
		
		if(result > 0) {
			message = "일정이 삭제되었습니다.";
		}
		
		return new Gson().toJson(message);
		
	}
	

}
