package kh.semi.project.bond.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GroupMemberList {
	
	private String memberName;
	private String memberImg;
	
	private int joinNo;
	private int groupNo;
	private int memberNo;
	private String leaderYN;
	private String joinDate;
	private String joinStatus;
	private String leaveDate;

}
