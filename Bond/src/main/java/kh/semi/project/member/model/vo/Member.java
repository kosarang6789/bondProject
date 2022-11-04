package kh.semi.project.member.model.vo;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@NoArgsConstructor
@Setter
@Getter
public class Member {
	
	private int memberNo;
	private String memberEmail;
	private String memberPw;
	private String memberName;
	private String memberBirth;
	private String memberTel;
	private String profileImage;
	private String authority;
	private String memberStatus;
	private String signUpDate;
	private String delDate;
	
	
}
