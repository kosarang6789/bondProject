package kh.semi.project.admin.model.service;

import kh.semi.project.report.model.vo.Report;

public interface AdminReportService {

	/** 스케줄러를 이용한 신고 테이블 자동 업데이트
	 * @return result
	 */
	int autoReportUpdate();
	
	/** 신고 처리
	 * @param string
	 * @return result
	 */
	int reportProcess(Report report, String process);

	
	/** 미처리 신고 업무 확인
	 * @return
	 */
	int findWaitingReports();

}
