package kh.semi.project.report.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.GroupMemberList;
import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.member.model.vo.Member;
import kh.semi.project.report.model.dao.ReportDAO;
import kh.semi.project.report.model.vo.Report;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private ReportDAO dao;
	
	// 신고 대상이 회원인 경우
	@Override
	public Member getMemberInfo(int input) {
		return dao.getMemberInfo(input);
	}
	
	// 신고 대상이 모임인 경우
	@Override
	public Group getGroupInfo(int input) {
		return dao.getGroupInfo(input);
	}
	
	// 신고 대상이 게시글인 경우
	@Override
	public Post getPostInfo(int input) {
		return dao.getPostInfo(input);
	}
	
	// 신고 사유 목록 가져오기
	@Override
	public List<Report> getReportReasonList(int typeCode) {
		return dao.getReportReasonList(typeCode);
	}

	// 신고하기
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int makeReport(Map<String, Object> infoMap) {
		return dao.makeReport(infoMap);
		
	}

	// 내 리더 여부 불러오기
	@Override
	public GroupMemberList getMyLeaderYN(int memberNo, int groupNo) {
		GroupMemberList myInfo = new GroupMemberList();
		
		myInfo.setGroupNo(groupNo);
		myInfo.setMemberNo(memberNo);
		
		return dao.getMyLeaderYN(myInfo);
	}

	// 리터가 탈퇴시키기
	@Override
	public int getout(int targetNo, int groupNo) {
		GroupMemberList out = new GroupMemberList();
		out.setGroupNo(groupNo);
		out.setMemberNo(targetNo);
		
		return dao.getout(out);
	}



}
