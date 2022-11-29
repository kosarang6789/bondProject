package kh.semi.project.myPage.model.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.GroupImage;
import kh.semi.project.common.Util;
import kh.semi.project.member.model.vo.Member;
import kh.semi.project.myPage.model.dao.BondIntroDAO;

@Service
public class BondIntroServiceImpl implements BondIntroService{
	
	@Autowired
	private BondIntroDAO dao;

	
	// 본드 소개 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int bondIntro(Group groupInfo, String webPath, String filePath, Group newGroup,
			MultipartFile groupImage2) throws Exception {


//		groupInfo.setGroupName(inputGroup.getGroupName());
//		groupInfo.setGroupComment(inputGroup.getGroupComment());

		// XSS처리
//		newGroup.setGroupNo(groupInfo.getGroupNo());
		newGroup.setGroupName(Util.XSSHandling(newGroup.getGroupName()));
		if(newGroup.getGroupComment()!=null) {
			newGroup.setGroupComment(Util.XSSHandling(newGroup.getGroupComment()));
			newGroup.setGroupComment(Util.newLineHandling(newGroup.getGroupComment()));
		}
		
		
		int result = dao.bondIntro(newGroup);
		
		int result2 = 0;		
		if(result>0) {
			
			String temp = groupInfo.getGroupImage(); // 실패 대비 값 저장
			
			GroupImage img = new GroupImage();
			String rename = null;
			
			if(groupImage2.getSize() == 0) { // 업로드 파일 x
				groupInfo.setGroupImage(null);
			}else {
				
				rename = Util.fileRename(groupImage2.getOriginalFilename());
				
				img.setGroupNo(newGroup.getGroupNo());
				img.setGroupImagePath(webPath);
				img.setGroupImageRename(rename);
				img.setGroupImageOrigin(groupImage2.getOriginalFilename());
				
				groupInfo.setGroupImage(webPath+rename);
			}
			
			result2 = dao.updateImg(img);
			
			if(result2>0) { // 이미지 수정 성공
				if(rename != null) {
					groupImage2.transferTo(new File(filePath+rename));
				}
			}else { // 이미지 수정 실패
				groupInfo.setGroupImage(temp);
				throw new Exception("이미지 업로드 실패");
			}
			
		}

		return result2;
	}
	


}
