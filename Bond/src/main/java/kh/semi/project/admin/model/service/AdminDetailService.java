package kh.semi.project.admin.model.service;

import kh.semi.project.member.model.vo.Member;

public interface AdminDetailService {

	/** 회원 상세 조회
	 * @param memberNo
	 * @return
	 */
	Member selectMemberDetail(int inputMemberNo);

}
