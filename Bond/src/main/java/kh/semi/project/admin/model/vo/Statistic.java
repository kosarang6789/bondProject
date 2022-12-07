package kh.semi.project.admin.model.vo;

public class Statistic {
	
	private int statisticNo;
	
	private String todayDate;
	private String weeklyDate;
	private int postCount;
	
	// 모임 통계
	private String topicName;
	private int groupCount;
	
	// 주간 회원 가입 / 탈퇴 통계
	private String memberSignUpCount;
	private String memberDelCount;
	
	// 전체 통계용
	private int totalMemberCount;
	private int totalGroupCount;
	private int totalPostCount;
	
	// 일일 통계용
	private int todayMemberCount;
	private int todayGroupCount;
	private int todayPostCount;
	
}
