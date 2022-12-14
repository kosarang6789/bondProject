package kh.semi.project.bond.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class GroupImage {

	private int groupImageNo;
	private int groupNo;
	private String groupImageOrigin;
	private String groupImageRename;
	private String groupImagePath;
	
}
