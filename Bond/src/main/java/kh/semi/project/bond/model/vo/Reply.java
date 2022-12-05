package kh.semi.project.bond.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Reply {
	private int replyNo;
	private String replyDelYN;
	private String replyDate;
	private String replyContent;
	private int postNo;
	private int parentNo;
	private int memberNo;
	
	private String memberName;
	private String memberImage;
	
}
