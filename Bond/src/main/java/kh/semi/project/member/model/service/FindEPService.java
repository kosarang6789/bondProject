package kh.semi.project.member.model.service;

import kh.semi.project.member.model.vo.Member;

public interface FindEPService {

	// 이메일 찾기
	Member findEmail(Member inputMember);

	// 비밀번호 찾기
	Member findPw(Member inputMember);

	// 인증번호 보내기
	String sendKey(String memberEmail);
	
	// 인증번호 만들기
	String createAuthKey();
	

}
