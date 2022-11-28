package kh.semi.project.admin.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
public class Report {
	// REPORT 테이블
	private int reportNo; // 신고 번호
	private int reasonCode; // 신고 사유 코드
	private int typeCode; // 신고 대상 유형(1:회원, 2:모임, 3:게시글)
	private int memberNo; // 신고자 회원 번호
	private int targetNo; // 신고 대상 고유 번호
	private String reportDate; // 신고날짜
	private int resultCode; // 신고 결과 코드
	private String processYN; // 처리 결과 코드
	private String processDate; // 처리 날짜
	private String expireDate; // 신고 만료 날짜
	private String expireYN; // 신고 만료 여부
	
	// REPORT 테이블 기타 FOREIGN KEY
	private String memberName; // 회원 이름
	private String groupName; // 모임 이름
	private String postContent; // 게시글 내용
	
	// REPORT_REASON 테이블
	private String reasonDetails; // 신고 사유 내용(1**:회원, 2**:모임, 3**:게시글)
	
	// REPORT_TYPE 테이블
	private String typeDetails; // 신고 유형 세부 내용
	
	// REPORT_RESULT 테이블
	private String resultDetails; // 신고 결과 세부 내용
	
	// 기타
	private String targetName; // 신고 대상 이름
	
	
	// mapper에 추가하세요
	
//	<!-- ReportVO -->
//	<resultMap type="Report" id="report_rm">
//		<id property="reportNo" column="REPORT_NO" />
//		
//		<result property="reasonCode" column="REASON_CODE" />
//		<result property="typeCode" column="TYPE_CODE" />
//		<result property="memberNo" column="MEMBER_NO" />
//		<result property="targetNo" column="TARGET_NO" />
//		<result property="reportDate" column="REPORT_DATE" />
//		<result property="resultCode" column="RESULT_CODE" />
//		<result property="processYN" column="PROCESS_YN" />
//		<result property="processDate" column="PROCESS_DATE" />
//		<result property="expireDate" column="EXPIRE_DATE" />
//		<result property="expireYN" column="EXPIRE_YN" />
//		
//		<result property="memberName" column="MEMBER_NAME" />
//		<result property="groupName" column="GROUP_NAME" />
//		<result property="postContent" column="POST_CONTENT" />
//		
//		<result property="reasonDetails" column="REASON_DETAILS" />
//
//		<result property="typeDetails" column="TYPE_DETAILS" />
//
//		<result property="resultDetails" column="RESULT_DETAILS" />
//		
//		<result property="targetName" column="TARGET_NAME" />
//	
//	</resultMap>
	
}
