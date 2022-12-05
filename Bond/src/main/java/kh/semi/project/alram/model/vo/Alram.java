package kh.semi.project.alram.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Alram {
	
	private int groupNo; // 그룹 번호
	private int myNo; // 알림 받을 로그인 멤버 번호
	private int memberNo; // 알림 보낸 사람 번호
	
	private int postNo; // 좋아요 누른 게시글 번호
	private int commentNo; // 댓글 단

}
