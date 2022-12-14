package kh.semi.project.report.model.service;

import java.util.List;
import java.util.Map;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.GroupMemberList;
import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.member.model.vo.Member;
import kh.semi.project.report.model.vo.Report;

/**
 * @author user1
 *
 */
public interface ReportService {

	/** 신고 대상이 회원인 경우
	 * @param input
	 * @return memberNo, memberName
	 */
	Member getMemberInfo(int input);

	/** 신고 대상이 모임인 경우
	 * @param input
	 * @return groupNo, groupName, groupComment
	 */
	Group getGroupInfo(int input);

	/** 신고 대상이 게시글인 경우
	 * @param input
	 * @return postNo, postContent,
	 */
	Post getPostInfo(int input);

	/** 신고 사유 목록 가져오기
	 * @param target
	 * @return reasonList
	 */
	List<Report> getReportReasonList(int typeCode);

	/** 신고하기
	 * @param target
	 * @param reasonCode
	 * @param memberNo
	 * @return
	 */
	int makeReport(Map<String, Object> infoMap);

	/** 내 리더 여부 불러오기
	 * @param input
	 * @param groupNo
	 * @return
	 */
	GroupMemberList getMyLeaderYN(int memberNo, int groupNo);

	
	
	/** 리더가 탈퇴시키기
	 * @param targetNo
	 * @param groupNo
	 * @return
	 */
	int getout(int targetNo, int groupNo);



}
