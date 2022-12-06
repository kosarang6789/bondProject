package kh.semi.project.admin.model.service;

import java.util.List;

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
	public List<Statistic> selectWeeklyMembers() {
		return dao.selectWeeklyMembers();
	}
	
}
