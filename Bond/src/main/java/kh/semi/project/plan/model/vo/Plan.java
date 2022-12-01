package kh.semi.project.plan.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
public class Plan {
	
	private int planNo;				// 일정 번호
	private int postNo;				// 일정이 있는 모임 번호
	private String planTitle;		// 일정 이름
	private String planContent;		// 일정 내용
	private String planStart;		// 일정 시작 날짜
	private String planEnd;			// 일정 종료 날짜
	private String planColor;		// 일정 색깔
	
}
