package kh.semi.project.bond.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.GroupMemberList;
import kh.semi.project.member.model.vo.Member;
import kh.semi.project.plan.model.vo.Plan;

public interface BondService {

	// 본드 만들기
	int createGroup(Group newGroup, MultipartFile groupImage, String webPath, String folderPath, int memberNo) throws Exception;
	
	// 본드 정보 불러오기
	Group selectGroupInfo(int groupNo);

	// 게시물 불러오기
	Map<String, Object> selectBoardDetail(int groupNo, int cp);

	// 신고 기록 조회
	String checkReport(int groupNo);

	int selectMemberInfo(GroupMemberList member);
	
	// 다가오는 일정 목록 불러오기
	List<Plan> planSelectListSoon(int groupNo);

	// 존재하는 본드인가요?
	int isExist(int groupNo);
	
	// 모임 이미지 리스트
	List<String> selectBondImageList();


}
