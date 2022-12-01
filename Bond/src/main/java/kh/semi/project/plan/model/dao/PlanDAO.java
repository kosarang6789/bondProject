package kh.semi.project.plan.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.plan.model.vo.Plan;

@Repository
public class PlanDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 일정 목록 가져오기
	public List<Plan> getPlanList() {
		return sqlSession.selectList("planMapper.getPlanList");
	}
	
	// 일정 추가하기
	public int planInsert(Plan plan) {
		return sqlSession.insert("planMapper.planInsert", plan);
	}
}
