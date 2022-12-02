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

	// 일정 목록 조회
	public List<Plan> planSelectList() {
		return sqlSession.selectList("planMapper.planSelectList");
	}
	
	// 일정 상세 조회
	public Plan planSelectDetail(int planNo) {
		return sqlSession.selectOne("planMapper.planSelectDetail", planNo);
	}
	
	// 일정 추가하기
	public int planInsert(Plan plan) {
		return sqlSession.insert("planMapper.planInsert", plan);
	}
	
	// 일정 삭제하기
	public int planDelete(int planNo) {
		return sqlSession.delete("planMapper.planDelete", planNo);
	}


}
