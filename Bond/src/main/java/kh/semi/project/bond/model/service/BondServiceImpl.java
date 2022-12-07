package kh.semi.project.bond.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.semi.project.bond.model.dao.BondDAO;
import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.GroupImage;
import kh.semi.project.bond.model.vo.GroupMemberList;
import kh.semi.project.bond.model.vo.Pagination;
import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.bond.model.vo.PostImage;
import kh.semi.project.common.Util;
import kh.semi.project.member.model.vo.Member;
import kh.semi.project.plan.model.vo.Plan;

@Service
public class BondServiceImpl implements BondService{
	
	@Autowired
	private BondDAO dao;
	
	// 본드 만들기
	@Transactional
	@Override
	public int createGroup(Group newGroup, MultipartFile groupImage, 
			String webPath, String folderPath, int memberNo) throws Exception {
		int groupNo = dao.createGroup(newGroup);
		
		if(groupNo>0) {
			GroupImage img = new GroupImage();
			String rename = null;
			
			Map<String, Object> leaderMember = new HashMap<String, Object>();
			leaderMember.put("memberNo", memberNo);
			leaderMember.put("groupNo", groupNo);
			
			int leaderResult = dao.insertJoinMember(leaderMember);
			if(leaderResult>0) {
				if(groupImage.getSize()!=0) {
					img.setGroupImagePath(webPath);
					
					rename = Util.fileRename(groupImage.getOriginalFilename());
					
					img.setGroupImageRename(rename);
					img.setGroupImageOrigin(groupImage.getOriginalFilename());
					img.setGroupNo(groupNo);
					
					int result = dao.updateGroupImage(img);
					
					if(result>0) {
						groupImage.transferTo(new File(folderPath+rename));
					}		
				}
			}
		}
		return groupNo;
	}
	
	// 본드 정보 불러오기
	@Override
	public Group selectGroupInfo(int groupNo) {
		
		return dao.selectGroupInfo(groupNo);
	}


    // 게시물 불러오기
	@Override
	public Map<String, Object> selectBoardDetail(int groupNo, int cp) {
//		// 1. 전체 게시물 수 조회
//		int listCount = dao.getPostCount(groupNo);
//		
//		// 2. 전체 게시글 수  + cp 이용해서 페이징 처리 객체 생성
//		Pagination pagination = new Pagination(listCount, cp);
//		
		// 3. 페이징 처리 객체를 이용해서 게시글 조회
//		List<Post> postList = dao.selectBoardDetail(groupNo);
		List<Post> postList = dao.selectBoardDetail(groupNo, cp);
		
		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("pagination", pagination);
		map.put("postList", postList);
		
		return map;
	}

	// 신고 여부 조회
	@Override
	public String checkReport(int groupNo) {
		return dao.checkReport(groupNo);
	}

	@Override
	public int selectMemberInfo(GroupMemberList member) {
		
		int result =0;
		String st= dao.selectMemberInfo(member);
		// 가입O 상태 0
		if(st != null ) {
			if(st.equals("2")) {
				result =-1;
			} result = 1;
		} else { // 가입 X
			result = -1;
		}
		return result;
	}
	
	// 다가오는 일정 목록 불러오기
	@Override
	public List<Plan> planSelectListSoon(int groupNo) {
		return dao.planSelectListSoon(groupNo);
	}

	// 본드가 존재하나요?
	@Override
	public int isExist(int groupNo) {
		return dao.isExist(groupNo);
	}
	
	
	// 모든 모임의 이미지 리스트를 가져옴
	@Override
	public List<String> selectBondImageList() {
		return dao.selectBondImageList();
	}

	// 그룹 내 이미지 리스트
	@Override
	public Map<String, Object> selectImageList(int groupNo) {
		
		
		return null;
	}






	
	



	
	
	
}
