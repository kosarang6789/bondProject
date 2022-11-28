package kh.semi.project.admin.model.service;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.member.model.vo.Member;
import kh.semi.project.report.model.vo.Report;

public interface AdminDetailService {

	/** 회원 상세 조회
	 * @param memberNo
	 * @return
	 */
	Member selectMemberDetail(int inputMemberNo);

	/** 모임 상세 조회
	 * @param inputGroupNo
	 * @return
	 */
	Group selectGroupDetail(int inputGroupNo);

	/** 게시글 상세 조회
	 * @param inputPostNo
	 * @return
	 */
	Post selectPostDetail(int inputPostNo);

	/** 신고 내역 상세 조회
	 * @param inputReportNo
	 * @return
	 */
	Report selectReportDetail(int inputReportNo);

}
