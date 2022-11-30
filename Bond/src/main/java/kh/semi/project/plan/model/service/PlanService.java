package kh.semi.project.plan.model.service;

import java.util.List;

import kh.semi.project.plan.model.vo.Plan;

public interface PlanService {

	// 일정 목록 가져오기
	List<Plan> getPlanList();

	// 일정 추가하기
	int planInsert(Plan plan);

}
