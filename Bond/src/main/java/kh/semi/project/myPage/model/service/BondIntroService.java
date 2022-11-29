package kh.semi.project.myPage.model.service;

import org.springframework.web.multipart.MultipartFile;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.member.model.vo.Member;

public interface BondIntroService {

	
	// 본드 소개 수정
	int bondIntro(Group groupInfo, String webPath, String filePath, Group newGroup,
			MultipartFile groupImage2)  throws Exception ;

}
