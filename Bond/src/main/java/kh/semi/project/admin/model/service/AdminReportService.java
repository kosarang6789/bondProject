package kh.semi.project.admin.model.service;

import kh.semi.project.admin.model.vo.Report;

public interface AdminReportService {

	/** 신고 처리
	 * @param string
	 * @return result
	 */
	int reportProcess(Report report, String process);

}
