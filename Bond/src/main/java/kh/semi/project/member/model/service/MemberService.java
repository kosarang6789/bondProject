package kh.semi.project.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.member.model.dao.MemberDAO;
import kh.semi.project.member.model.vo.Member;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	// 로그인
	public Member login(Member inputMember) {
		
		Member loginMember = dao.login(inputMember);
		
		return loginMember;
	}
}
