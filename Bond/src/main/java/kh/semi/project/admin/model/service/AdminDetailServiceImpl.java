package kh.semi.project.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.admin.model.dao.AdminDetailDAO;
import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.member.model.vo.Member;
import kh.semi.project.report.model.vo.Report;

@Service
public class AdminDetailServiceImpl implements AdminDetailService{
	
	@Autowired
	private AdminDetailDAO dao;
	
	// 회원 상세 조회
	@Override
	public Member selectMemberDetail(int inputMemberNo) {
		return dao.selectMemberDetail(inputMemberNo);
	}

	// 모임 상세 조회
	@Override
	public Group selectGroupDetail(int inputGroupNo) {
		return dao.selectGroupDetail(inputGroupNo);
	}
	
	// 게시글 상세 조회
	@Override
	public Post selectPostDetail(int inputPostNo) {
		return dao.selectPostDetail(inputPostNo);
	}
	
	// 신고 내역 상세 조회
	@Override
	public Report selectReportDetail(int inputReportNo) {
		return dao.selectReportDetail(inputReportNo);
	}

}
