package kh.semi.project.band.model.vo;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@NoArgsConstructor
@Setter
@Getter
public class Post {
	
	private int postNo;
	private int groupNo;
	private int memberNo;
	private String postContent;
	private int postView;
	private String replyYN;
	private String postDate;
	private String editDate;
	private String informYN;
	private String postDelYN;
	
	
}
