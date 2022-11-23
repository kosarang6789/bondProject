package kh.semi.project.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.admin.model.dao.AdminDetailDAO;
import kh.semi.project.member.model.vo.Member;

@Service
public class AdminDetailServiceImpl implements AdminDetailService{
	
	@Autowired
	private AdminDetailDAO dao;
	
	// 회원 상세 조회
	@Override
	public Member selectMemberDetail(int inputMemberNo) {
		return dao.selectMemberDetail(inputMemberNo);
	}

}
