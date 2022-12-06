package kh.semi.project.bond.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class PostImage {
	
	public PostImage(int postNo, String imageRename, String imagePath) {
		super();
		this.postNo = postNo;
		this.imageRename = imageRename;
		this.imagePath = imagePath;
	}
	private int imageNo;
	private int postNo;
	private String imageRename;
	private String imagePath;
	
	// 관리자 페이지 게시글 사진 출력용입니다..
	private String imageFullName;
}
