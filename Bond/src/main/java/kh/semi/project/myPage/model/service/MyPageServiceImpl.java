package kh.semi.project.myPage.model.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.semi.project.common.Util;
import kh.semi.project.member.model.vo.Member;
import kh.semi.project.member.model.vo.MemberImage;
import kh.semi.project.myPage.model.dao.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	
	// 회원 탈퇴
	@Override
	public int secession(String memberPw, int memberNo) {
		
		// 비밀번호 조회
		String encPw = dao.selectEncPw(memberNo);
		
		if(bcrypt.matches(memberPw, encPw)) {
			return dao.secession(memberNo);
		}
		
		return 0;
	}


	// 비밀번호 변경
	@Override
	public int changePw(Map<String, Object> map) {
		
		int memberNo = (int)map.get("memberNo");
		
		String encPw = dao.selectEncPw(memberNo);
		
		if(bcrypt.matches((String)map.get("currentPw"), encPw)) {
			String newPw = bcrypt.encode((String)map.get("newPw"));
			map.put("newPw", newPw);
			int result = dao.changePw(map);
			return result;
		}
		
		return 0;
	}


	
	
	// 내 정보 수정 - 이미지 변경
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateImage(String webPath, String filePath, Member loginMember, MultipartFile profileImage) throws Exception {

		MemberImage img = new MemberImage();
		
		int checkImg = dao.checkImg(loginMember);
		
		int result = 0;
		
		String rename = null;
		
		img.setMemberNo(loginMember.getMemberNo());
		
		if(checkImg>0) { // 이미지 있으면 수정
			
			String temp = loginMember.getProfileImage();
			
			if(profileImage.getSize()==0) {
				img.setMemberImgPath("/resources/images/member/profile/");
				img.setMemberImgRename("defaultProfile.png");
				img.setMemberImgOrigin("defaultProfile.png");
				
				loginMember.setProfileImage("/resources/images/member/profile/defaultProfile.png");
				
				result = dao.updateImg(img);
				
			}else {
				
				rename = Util.fileRename(profileImage.getOriginalFilename());
				
				img.setMemberImgPath(webPath);
				img.setMemberImgRename(rename);
				img.setMemberImgOrigin(profileImage.getOriginalFilename());
				
				loginMember.setProfileImage(webPath+rename);
				
				result = dao.updateImg(img);
				
				if(result>0) { // 수정 성공
					if(rename != null) {
						profileImage.transferTo(new File(filePath + rename));
						
					}else {
						loginMember.setProfileImage(temp);
//					throw new Exception("이미지 업로드 실패");
					}
				}
			}
			
			
		}else { // 이미지 없으면 추가
			
			if(profileImage.getSize() != 0) {
				
				rename = Util.fileRename(profileImage.getOriginalFilename());
	            
	            img.setMemberImgPath(webPath);
	            img.setMemberImgRename(rename);
	            img.setMemberImgOrigin(profileImage.getOriginalFilename());
	            
	            loginMember.setProfileImage(webPath+rename);
	            
				result = dao.insertImg(img);
				
				if(result>0) { // 추가 성공
					profileImage.transferTo(new File(filePath+rename));
				}
			}
		}
		
		return result;
	}


	
	
	// 내 정보 수정 - 내 정보들
	@Override
	public int updateProfile(Member inputMember) {
		return dao.updateProfile(inputMember);
	}




}
