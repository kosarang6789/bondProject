package kh.semi.project.bond.model.service;

import java.util.List;
import java.util.Map;

import kh.semi.project.bond.model.vo.GroupMemberList;

public interface BondMemberService {

	
	// 본드 멤버 리스트 가져오기
	Map<String, Object> selectMemberList(int groupNo);

	// 본드 멤버 리스트 가져오기
	List<GroupMemberList> selectMemList(int groupNo);

}
