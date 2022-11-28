package kh.semi.project.scheduler;

import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kh.semi.project.admin.controller.AdminReportController;

@Component
public class Scheduler {
	
	@Autowired
	private AdminReportController reportController;
	
	/** 신고 테이블 자동 업데이트
	 *  - 신고 기간이 지난 회원을 찾아 신고를 만료시킴
	 */
	@Scheduled(cron = "0 0/1 * * * *")
	public void autoReportUpdate() {
		
		int result = reportController.autoReportUpdate();
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss z");
		
		System.out.println("[Scheduler] autoReportUpdate 수행 (" + sdf.format(date) + ")");
		
		if(result > 0) {
			System.out.println("[autoReportUpdate] : " + result + "건의 정보가 업데이트되었습니다.");
		}
		
		
	}
}
