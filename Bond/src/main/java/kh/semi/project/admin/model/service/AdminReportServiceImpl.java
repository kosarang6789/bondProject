package kh.semi.project.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.admin.model.dao.AdminReportDAO;
import kh.semi.project.admin.model.vo.Report;

@Service
public class AdminReportServiceImpl implements AdminReportService {
	
	@Autowired
	private AdminReportDAO dao;
	
	// 신고 처리
	@Override
	public int reportProcess(Report report, String process) {
		
		// 처리 결과 = 반려 아님
		if(process.equals("suspend")) {
			if(report.getTypeCode() == 1 || report.getTypeCode() == 2) { // 신고 대상이 게시글이 아닌 경우
				int count = dao.getReportRecordCount(report); // 신고 기록 개수를 가져옴
				report.setResultCode(count + 2);
			}
			
			if(report.getTypeCode() == 3) { // 신고 대상이 게시글인 경우
				report.setResultCode(5);
			}
		}
		
		// 처리 결과 = 반려됨
		if(process.equals("reject")) {
			report.setResultCode(1);
		}
		
		// 처리
		return dao.reportProcess(report);
		
	}
}
