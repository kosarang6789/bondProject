package kh.semi.project.myPage.model.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kh.semi.project.member.model.vo.Member;

public interface MyPageService {

	// 회원 탈퇴
	int secession(String memberPw, int memberNo);

	// 비밀번호 변경
	int changePw(Map<String, Object> map);

	// 내 정보 수정 - 프로필 수정
	int updateImage(String webPath, String filePath, Member loginMember, MultipartFile profileImage) throws Exception;

	// 내 정보 수정 - 내 정보들
	int updateProfile(Member inputMember);




}
