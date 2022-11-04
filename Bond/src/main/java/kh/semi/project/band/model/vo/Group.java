package kh.semi.project.band.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Group {

	private int groupNo;
	private int topicCode;
	private String groupName;
	private String groupDate;
	private String groupImage;
	private String groupComment;
	private String openYN;
	private String groupStatus;
	
}
