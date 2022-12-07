package kh.semi.project.admin.model.service;

import java.util.List;
import java.util.Map;

import kh.semi.project.admin.model.vo.Statistic;

public interface AdminStatisticService {

	/** 작성된 게시글 개수를 가져옴
	 * @return
	 */
	List<Statistic> selectWeeklyPost();

	/** 모임 통계 현황 가져오기
	 * @return
	 */
	List<Statistic> selectTopicDoughnut();

	/** 회원 가입현황 가져오기
	 * @return
	 */
	Map<String, Object> selectWeeklyMembers();

	/** 전체 수 가져오기(회원, 모임, 게시글)
	 * @return
	 */
	List<Statistic> selectAllPeriodGeneral();

	
	/** 일일 수 가져오기(회원, 모임, 게시글)
	 * @return
	 */
	List<Statistic> selectTodayGeneral();

}
