package kh.semi.project.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.semi.project.admin.model.dao.AdminReportDAO;
import kh.semi.project.report.model.vo.Report;

@Service
public class AdminReportServiceImpl implements AdminReportService {
	
	@Autowired
	private AdminReportDAO dao;
	
	// 스케줄러를 이용한 신고 테이블 자동 업데이트
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int autoReportUpdate() {
		return dao.autoReportUpdate();
	}
	
	// 신고 처리
	@Transactional(rollbackFor = Exception.class)
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
		int result = 0;
		int reportProcess = dao.updateResultCode(report);
		
		if(reportProcess > 0) {
			result = dao.updateExpireDate(report);
		}
		
		return result;
		
	}
}
