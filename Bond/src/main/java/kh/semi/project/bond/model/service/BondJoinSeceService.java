package kh.semi.project.bond.model.service;

import kh.semi.project.bond.model.vo.GroupMemberList;

public interface BondJoinSeceService {

	// 본드 가입
	int bondJoin(int memberNo, int groupNo);

	
	// 본드 탈퇴
	int bondSecession(int memberNo, int groupNo);

}
