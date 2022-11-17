package kh.semi.project.member.model.service;

import kh.semi.project.member.model.vo.Member;

public interface FindEPService {

	// 이메일 찾기
	Member findEmail(String inputName, String inputTel);

}
