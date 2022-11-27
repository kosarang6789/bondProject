package kh.semi.project.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.semi.project.admin.model.dao.ReportDAO;
import kh.semi.project.admin.model.vo.Report;
import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.member.model.vo.Member;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private ReportDAO dao;
	
	// 스케줄러를 이용한 신고 테이블 자동 업데이트
	@Override
	public int autoReportUpdate() {
		return dao.autoReportUpdate();
	}
	
	// 신고 대상이 회원인 경우
	@Override
	public Member getMemberInfo(int input) {
		return dao.getMemberInfo(input);
	}
	
	// 신고 대상이 모임인 경우
	@Override
	public Group getGroupInfo(int input) {
		return dao.getGroupInfo(input);
	}
	
	// 신고 대상이 게시글인 경우
	@Override
	public Post getPostInfo(int input) {
		return dao.getPostInfo(input);
	}
	
	// 신고 사유 목록 가져오기
	@Override
	public List<Report> getReportReasonList(int typeCode) {
		return dao.getReportReasonList(typeCode);
	}

	// 신고하기
	@Transactional
	@Override
	public int makeReport(Map<String, Object> infoMap) {
		return dao.makeReport(infoMap);
		
	}



}
