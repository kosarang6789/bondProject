package kh.semi.project.bond.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Group {

	private int groupNo;
	private int topicCode;
	private int memberCount;
	private String groupName;
	private String groupDate;
	private String groupImage;
	private String groupComment;
	private String openYN;
	private String groupStatus;
	
	// 추가
	private String topicName;
	private String leaderName;
	private int postCount;
	
}
