package kh.semi.project.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.admin.model.vo.Report;

@Repository
public class AdminReportDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

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
	public int reportProcess(Report report) {
		return sqlSession.update("adminMapper.reportProcess", report);
	}
}
