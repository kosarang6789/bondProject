package kh.semi.project.bond.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GroupMemberList {
	
	private String memberName;
	private String memberImage;
	private String memberBirth;
	
	private int joinNo;
	private int groupNo;
	private int memberNo;
	private String leaderYN; 
	private int leaderNo; 
	private String joinDate;
	private String joinStatus;
	private String leaveDate;

}
