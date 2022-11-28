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
	public int bondIntro(Group groupInfo, String webPath, String filePath, Group inputGroup,
			MultipartFile groupImage) throws Exception {

//		groupInfo.setGroupName(inputGroup.getGroupName());
//		groupInfo.setGroupComment(inputGroup.getGroupComment());
		
		
//		String image = groupInfo.getGroupImage();

		inputGroup.setGroupNo(groupInfo.getGroupNo());
		GroupImage img = new GroupImage();
		String rename = null;
		
		int result = dao.bondIntro(inputGroup);
		
		rename = Util.fileRename(groupImage.getOriginalFilename());
		img.setGroupNo(groupInfo.getGroupNo());
		img.setGroupImagePath(webPath);
		img.setGroupImageRename(rename);
		img.setGroupImageOrigin(groupImage.getOriginalFilename());
		
		groupInfo.setGroupImage(webPath+rename);
		
		if(result>0) {
			
			String temp = groupInfo.getGroupImage();
			
			result = dao.updateImg(img);
			
			if(result>0) { // 이미지 수정 성공
				if(rename != null) {
					groupImage.transferTo(new File(filePath+rename));
				}else { // 이미지 수정 실패
					groupInfo.setGroupImage(temp);
					throw new Exception("이미지 업로드 실패");
				}
			}
			
		}

		return result;
	}
	


}
