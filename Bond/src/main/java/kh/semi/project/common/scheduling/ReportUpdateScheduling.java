package kh.semi.project.common.scheduling;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kh.semi.project.admin.controller.AdminReportController;

@Component
public class ReportUpdateScheduling {

	@Autowired
	private AdminReportController reportController;
	
	@Scheduled(cron = "0 0/1 * * * *")
	public void autoReportUpdate() {
		int result = reportController.autoReportUpdate();
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss z");
		
//		System.out.println("[Scheduler] autoReportUpdate 수행 (" + sdf.format(date) + ")");
		
		if(result > 0) {
			System.out.println("[autoReportUpdate] : " + result + "건의 정보가 업데이트되었습니다. (" + sdf.format(date) + ")");
		}
		
	}
}
