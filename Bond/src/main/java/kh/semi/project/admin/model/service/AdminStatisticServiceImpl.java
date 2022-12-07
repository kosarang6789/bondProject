package kh.semi.project.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.admin.model.dao.AdminStatisticDAO;
import kh.semi.project.admin.model.vo.Statistic;

@Service
public class AdminStatisticServiceImpl implements AdminStatisticService{

	@Autowired
	private AdminStatisticDAO dao;
	
	// 작성된 게시글 개수를 가져옴
	@Override
	public List<Statistic> selectWeeklyPost() {
		return dao.selectWeeklyPost();
	}

	// 모임 통계 현황 가져오기
	@Override
	public List<Statistic> selectTopicDoughnut() {
		return dao.selectTopicDoughnut();
	}

	// 회원 가입 현황 가져오기
	@Override
	public Map<String, Object> selectWeeklyMembers() {
		
		List<Statistic> signUpCounts = dao.selectWeeklysignUpMembers();
		List<Statistic> delCounts = dao.selectWeeklyDelMembers();
		
		Map<String, Object> weeklyMembersMap = new HashMap<String, Object>();
		
		weeklyMembersMap.put("signUpCounts", signUpCounts);
		weeklyMembersMap.put("delCounts", delCounts);
		
		return weeklyMembersMap;
	}

	// 전체 수 가져오기(회원, 모임, 게시글)
	@Override
	public List<Statistic> selectAllPeriodGeneral() {
		return dao.selectAllPeriodGeneral();
	}

	// 일일 수 가져오기(회원, 모임, 게시글)
	@Override
	public List<Statistic> selectTodayGeneral() {
		return dao.selectTodayGeneral();
	}
	
}
