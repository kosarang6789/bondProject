package kh.semi.project.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.admin.model.dao.AdminDetailDAO;
import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.member.model.vo.Member;
import kh.semi.project.report.model.vo.Report;

@Service
public class AdminDetailServiceImpl implements AdminDetailService{
	
	@Autowired
	private AdminDetailDAO dao;
	
	// 회원 상세 조회
	@Override
	public Map<String, Object> selectMemberDetail(int inputMemberNo) {
		
		// 1. 회원 정보 조회
		Member member = dao.selectMemberDetail(inputMemberNo); 
		
		// 2. 신고 기록을 조회하기 위한 map 생성
		Map<String, Object> infoMap = new HashMap<String, Object>();
		
		// 2-1. infoMap에 정보 저장
		infoMap.put("targetNo", member.getMemberNo());
		infoMap.put("targetType", 1);
		
		// 2. 해당 회원의 신고 기록 개수 조회
		int reportCount = dao.getReportListCount(infoMap);
		
		// 3. 해당 회원의 신고 내역 조회
		List<Report> reportList = dao.getReportList(infoMap);
		
		// 4. map에 저장
		Map<String, Object> memberInfo = new HashMap<String, Object>();
		
		memberInfo.put("member", member);
		memberInfo.put("reportCount", reportCount);
		memberInfo.put("reportList", reportList);
		
		// 5. map에 반환
		return memberInfo; 
	}

	// 모임 상세 조회
	@Override
	public Map<String, Object> selectGroupDetail(int inputGroupNo) {
		// 1. 회원 정보 조회
		Group group = dao.selectGroupDetail(inputGroupNo); 
		
		// 2. 신고 기록을 조회하기 위한 map 생성
		Map<String, Object> infoMap = new HashMap<String, Object>();
		
		// 2-1. infoMap에 정보 저장
		infoMap.put("targetNo", group.getGroupNo());
		infoMap.put("targetType", 2);
		
		// 2. 해당 회원의 신고 기록 개수 조회
		int reportCount = dao.getReportListCount(infoMap);
		
		// 3. 해당 회원의 신고 내역 조회
		List<Report> reportList = dao.getReportList(infoMap);
		
		// 4. map에 저장
		Map<String, Object> groupInfo = new HashMap<String, Object>();
		
		groupInfo.put("group", group);
		groupInfo.put("reportCount", reportCount);
		groupInfo.put("reportList", reportList);
		
		// 5. map에 반환
		return groupInfo; 
	}
	
	// 게시글 상세 조회
	@Override
	public Post selectPostDetail(int inputPostNo) {
		return dao.selectPostDetail(inputPostNo);
	}
	
	// 신고 내역 상세 조회
	@Override
	public Report selectReportDetail(int inputReportNo) {
		return dao.selectReportDetail(inputReportNo);
	}

}
