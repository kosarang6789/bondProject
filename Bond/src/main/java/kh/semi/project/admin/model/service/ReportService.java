package kh.semi.project.admin.model.service;

import java.util.List;
import java.util.Map;

import kh.semi.project.admin.model.vo.Report;
import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.member.model.vo.Member;

public interface ReportService {

	/** 스케줄러를 이용한 신고 테이블 자동 업데이트
	 * @return result
	 */
	int autoReportUpdate();
	
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



}
