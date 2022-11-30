package kh.semi.project.calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CalendarController {
	
	@GetMapping("/calendar")
	public String goCalendarPage() {
		return "calendar/calendar";
	}
}
