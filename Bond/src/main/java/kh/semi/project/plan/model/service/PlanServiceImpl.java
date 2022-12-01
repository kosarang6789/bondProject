package kh.semi.project.plan.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.plan.model.dao.PlanDAO;
import kh.semi.project.plan.model.vo.Plan;

@Service
public class PlanServiceImpl implements PlanService {
	
	@Autowired
	private PlanDAO dao;

	// 일정 목록 가져오기
	@Override
	public List<Plan> getPlanList() {
		return dao.getPlanList();
	}
	
	// 일정 추가하기
	@Override
	public int planInsert(Plan plan) {
		return dao.planInsert(plan);
	}
}
