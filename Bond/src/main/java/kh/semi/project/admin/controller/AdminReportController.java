package kh.semi.project.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import kh.semi.project.admin.model.service.AdminReportService;
import kh.semi.project.report.model.vo.Report;

@Controller
@RequestMapping("/admin")
@SessionAttributes("report")
public class AdminReportController {
	
	@Autowired
	private AdminReportService service;
	
	// 스케줄러를 이용한 자동 업데이트
	public int autoReportUpdate() {
		return service.autoReportUpdate();
	}
	
	/** 신고 처리
	 * @return
	 */
	@PostMapping("/report/process")
	public String reportProcess(
			@RequestParam(value="process") String process,
			HttpSession session
			) {
		
		Report report = (Report)session.getAttribute("report");
		
		int reportNo = report.getReportNo();
		
		// 신고 처리
		int result = service.reportProcess(report, process);
		
		return "redirect:/admin/report/" + reportNo;
	}
	
	
	@PostMapping("/report/find/waiting")
	@ResponseBody
	public String findWaitingReports() {
		// 미처리 신고 업무가 있는지 확인
		int waitingReports = service.findWaitingReports();
		
		return new Gson().toJson(waitingReports);
	}
	
	
}
