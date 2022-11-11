package kh.semi.project.member.model.service;

public interface DupService {

	// 회원가입 이메일 중복 검사
	int emailDupCheck(String memberEmail);

	// 회원가입 이름 중복 검사
	int nameDupCheck(String memberName);

}
