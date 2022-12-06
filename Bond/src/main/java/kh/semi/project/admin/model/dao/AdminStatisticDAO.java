package kh.semi.project.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.admin.model.vo.Statistic;

@Repository
public class AdminStatisticDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 작성된 게시글의 개수를 가져옴
	 * @return
	 */
	public List<Statistic> selectWeeklyPost() {
		return sqlSession.selectList("statisticMapper.selectWeeklyPost");
	}

	/** 모임 통계 현황 가져오기
	 * @return
	 */
	public List<Statistic> selectTopicDoughnut() {
		return sqlSession.selectList("statisticMapper.selectTopicDoughnut");
	}

	/** 주간 가입 통계
	 * @return
	 */
	public List<Statistic> selectWeeklyMembers() {
		return sqlSession.selectList("statisticMapper.selectWeeklyMembers");
	}
	
	
}
