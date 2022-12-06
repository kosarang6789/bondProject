package kh.semi.project.common.scheduling;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kh.semi.project.bond.model.service.BondService;
import kh.semi.project.bond.model.service.PostService;
import kh.semi.project.member.model.service.MemberService;

@Component
public class ImageDeleteScheduling {
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BondService bondService;
	
	@Autowired
	private PostService postService;
	
	@Scheduled(cron="0 0/1 * * * *") // 정시마다 이미지 삭제
	public void autoDeleteImageFile() {
		// 1. DB에서 이미지가 저장된 테이블의 모든 이미지 변경명을 조회함
		
		// 1-A. 회원의 이미지 in DB
		List<String> memberImageDBList = memberService.selectMemberImageList();
		// * defailtProfile.png
		
		// 1-B. 모임의 이미지 in DB
		List<String> groupImageDBList = bondService.selectBondImageList();
		// * friendship.jpg, no-profile.png, select-photo.jpg, travel.jpg
		
		// 1-C. 게시물의 이미지 in DB
//		List<String> postImageDBList = postService.selectPostImageList();
		// * none

		
		
		
		// 2. 지정된 경로에 존재하는 파일 목록을 배열로 반환
		
		// 2-A. 서버에서 회원 이미지를 조회, 배열로 반환 후 List로 변환
		String memberImageStoragePath = application.getRealPath("/resources/images/member/profile");
		File[] memberArr = new File(memberImageStoragePath).listFiles();
		List<File> memberFileList = Arrays.asList(memberArr);
		
		// 2-B. 서버에서 모임 이미지를 조회, 배열로 반환 후 List로 변환
		String groupImageStoragePath = application.getRealPath("/resources/images/bond/profile");
		File[] groupArr = new File(groupImageStoragePath).listFiles();
		List<File> groupFileList = Arrays.asList(groupArr);
		
		// 2-C. 서버에서 게시글 이미지를 조회, 배열로 반환 후 List로 변환
//		String postImageStoragePath = application.getRealPath("/resources/images/post");
//		File[] postArr = new File(postImageStoragePath).listFiles();
//		List<File> postFileList = Arrays.asList(postArr);

		
		// 3. 삭제하면 안되는 이미지 리스트
		
		// 3-B. 모임 이미지 중 삭제하면 안되는 목록
		List<String> protectedGroupImage = new ArrayList<String>();
		protectedGroupImage.add("friendship.jpg");
		protectedGroupImage.add("no-profile.png");
		protectedGroupImage.add("select-photo.jpg");
		protectedGroupImage.add("travel.jpg");
		// * friendship.jpg, no-profile.png, select-photo.jpg, travel.jpg
		
		
		// 4. 이미지 비교, 삭제 반복문
		
		// 4-A. 회원 이미지를 삭제함
		// * defailtProfile.png
		if(!memberFileList.isEmpty()) { // 서버 - 회원 이미지 저장소에 파일이 있다면
			for(File file : memberFileList) {
				String fileName = file.getName();
				if(!fileName.equals("defaultProfile.png")) {
					if(memberImageDBList.indexOf(fileName) == -1) {
						System.out.println("[회원 이미지] " + fileName + "삭제댐");
						file.delete();
					}
					
				}
			}
		}
		
		// 4-B. 모임 이미지 비교함
		if(!groupFileList.isEmpty()) { // 서버 - 모임 이미지 저장소에 파일이 있다면
			for(File file : groupFileList) {
				String fileName = file.getName();
				
				if(!protectedGroupImage.contains(fileName)) {
					if(groupImageDBList.indexOf(fileName) == -1) {
						System.out.println("[모임 이미지] " + fileName + "삭제댐");
						file.delete();
					}
					
				}
			}
		}
		
		// 4-C. 게시글 이미지 비교함
//		if(!postFileList.isEmpty()) { // 서버 - 게시글 이미지 저장소에 파일이 있다면
//			for(File file : postFileList) {
//				String fileName = file.getName();
//				if(postImageDBList.indexOf(fileName) == -1) {
//					System.out.println("[게시글 이미지] " + fileName + "삭제댐");
//					file.delete();
//				}
//			}
//		}
	}
}
