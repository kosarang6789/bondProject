package kh.semi.project.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.member.model.dao.DupDAO;

@Service
public class DupServiceImpl implements DupService {

	@Autowired
	private DupDAO dao;
	
	/**
	 * 회원가입 이메일 중복 검사
	 */
	@Override
	public int emailDupCheck(String memberEmail) {
		return dao.emailDupCheck(memberEmail);
	}

	/**
	 * 회원가입 이름 중복 검사
	 */
	@Override
	public int nameDupCheck(String memberName) {
		return dao.nameDupCheck(memberName);
	}
	
	
		
	
	

}
