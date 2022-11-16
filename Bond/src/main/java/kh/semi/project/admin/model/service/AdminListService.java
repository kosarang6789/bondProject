package kh.semi.project.admin.model.service;

import java.util.List;

import kh.semi.project.member.model.vo.Member;

public interface AdminListService {

	
	/** 회원 정보 출력(ajax)
	 * @param keyword
	 * @return
	 */
	List<Member> selectMemberList(String keyword);
	
}
