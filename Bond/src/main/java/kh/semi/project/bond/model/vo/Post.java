package kh.semi.project.bond.model.vo;

import java.util.List;

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
	private String memberName;
	private String memberImage;
	
	private List<Post> postList;
}
