package kh.semi.project.member.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberImage {
	
	private int memberNo;
	private String memberImgOrigin;
	private String memberImgRename;
	private String memberImgPath;

}
