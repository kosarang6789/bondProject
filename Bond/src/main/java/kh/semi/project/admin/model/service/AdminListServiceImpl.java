package kh.semi.project.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.admin.model.dao.AdminListDAO;
import kh.semi.project.member.model.vo.Member;

@Service
public class AdminListServiceImpl implements AdminListService{
	
	@Autowired
	private AdminListDAO dao;
	
	/** 회원 정보 출력(ajax)
	 * @param keyword
	 * @return
	 */
	@Override
	public List<Member> selectMemberList(String keyword) {
		return dao.selectMemberList(keyword);
	}

}
