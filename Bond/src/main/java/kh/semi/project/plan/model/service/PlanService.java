package kh.semi.project.plan.model.service;

import java.util.List;

import kh.semi.project.plan.model.vo.Plan;

public interface PlanService {

	// 일정 목록 가져오기
	List<Plan> planSelectList();

	// 일정 상세 조회
	Plan planSelectDetail(int planNo);
	
	// 일정 추가하기
	int planInsert(Plan plan);
	
	// 일정 삭제하기
	int planDelete(int planNo);
	

}
