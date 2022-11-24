package kh.semi.project.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.admin.model.dao.AdminListDAO;
import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.member.model.vo.Member;

@Service
public class AdminListServiceImpl implements AdminListService{
	
	@Autowired
	private AdminListDAO dao;
	
	// 회원 목록 출력(ajax)
	@Override
	public List<Member> selectMemberList(String keyword, int opt) {
		return dao.selectMemberList(keyword, opt);
	}
	
	// 모임 목록 출력(ajax)
	@Override
	public List<Group> selectGroupList(String keyword, int opt) {
		return dao.selectGroupList(keyword, opt);
	}

}
