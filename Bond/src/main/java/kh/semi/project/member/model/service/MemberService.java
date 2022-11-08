package kh.semi.project.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.member.model.dao.MemberDAO;
import kh.semi.project.member.model.vo.Member;


public interface MemberService {

	
	// 로그인
	public abstract Member login(Member inputMember);

	// 회원가입
	public abstract int signUp(Member inputMember);
}
