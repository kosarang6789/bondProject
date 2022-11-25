package kh.semi.project.myPage.model.service;

import java.util.Map;

public interface MyPageService {

	// 회원 탈퇴
	int secession(String memberPw, int memberNo);

	// 비밀번호 변경
	int changePw(Map<String, Object> map);

}
