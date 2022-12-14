package kh.semi.project.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.member.model.dao.MemberDAO;
import kh.semi.project.member.model.vo.Member;
import kh.semi.project.plan.model.vo.Plan;

public interface MemberService {

	// 로그인
	public abstract Member login(Member inputMember);

	// 회원가입
	public abstract int signUp(Member inputMember);

	// 가입한 그룹 조회
	public abstract List<Map<String, Object>> selectMyGroup(int memberNo);
	
	// 신고 여부 조회
	public abstract String checkReport(int memberNo);

	// 가입X 본드 조회
	public abstract List<Map<String, Object>> selectJoinNo(int memberNo);

	// 본드 목록 조회 
	public abstract Map<String, Object> selectGroupList(int groupNo, int cp);

	// 검색 조건 일치 본드 목록 조회 
	public abstract Map<String, Object> selectGroupList(Map<String, Object> pm, int cp);



	
	// 가입중인 모임의 모든 일정 목록 가져오기
	List<Plan> getMyAllPlans(int memberNo);

	// 모든 회원 이미지를 가져옴
	public abstract List<String> selectMemberImageList();
}
