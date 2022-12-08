package kh.semi.project.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.report.model.vo.Report;


@Repository
public class AdminReportDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 스케줄러를 이용한 신고 테이블 자동 업데이트
	 * @return
	 */
	public int autoReportUpdate() {
		return sqlSession.update("adminMapper.autoReportUpdate");
	}

	/** 대상의 피신고 기록 개수 조회
	 * - 처리 결과가 반려가 아니고, 신고 유형(대상)이 회원 또는 모임인 경우
	 * @param report
	 */
	public int getReportRecordCount(Report report) {
		return sqlSession.selectOne("adminMapper.getReportRecordCount", report);
	}

	
	/** 신고 처리
	 * @param report
	 * @return
	 */
	public int updateResultCode(Report report) {
		return sqlSession.update("adminMapper.updateResultCode", report);
	}


	/** 신고 : 정지 기간 업데이트
	 * @param report
	 * @return
	 */
	public int updateExpireDate(Report report) {
		return sqlSession.update("adminMapper.updateExpireDate", report);
	}

	/** 신고 : 게시글 삭제
	 * @param targetNo
	 * @return
	 */
	public int deleteReportedPost(int targetNo) {
		return sqlSession.update("adminMapper.deleteReportedPost", targetNo);
	}
	
	/** 미처리 신고업무 확인
	 * @return
	 */
	public int findWaitingReports() {
		return sqlSession.selectOne("adminMapper.findWaitingReports");
	}

}
