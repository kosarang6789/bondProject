package kh.semi.project.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.member.model.dao.FindEPDAO;
import kh.semi.project.member.model.vo.Member;

@Service
public class FindPWServiceImpl implements FindEPService{

	@Autowired
	private FindEPDAO dao;

	/**
	 * 이메일 찾기
	 */
	@Override
	public Member findEmail(Member inputMember) {
		return dao.findEmail(inputMember);
	}
	
	
}
