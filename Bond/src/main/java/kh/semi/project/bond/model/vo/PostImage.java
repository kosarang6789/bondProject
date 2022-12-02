package kh.semi.project.bond.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PostImage {
	
	private int imageNo;
	private int postNo;
	private String imageOrigin;
	private String imageRename;
	private String imagePath;
	private int imageOrder;
	private String imageComment;
	
}
