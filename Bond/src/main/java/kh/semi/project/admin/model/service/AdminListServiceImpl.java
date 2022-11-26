package kh.semi.project.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.admin.AdminUtil;
import kh.semi.project.admin.model.dao.AdminListDAO;
import kh.semi.project.admin.model.vo.AdminPagination;
import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.member.model.vo.Member;

@Service
public class AdminListServiceImpl implements AdminListService{
	
	
	@Autowired
	private AdminListDAO dao;
	
	// 회원 목록 출력(ajax)
	@Override
	public Map<String, Object> selectMemberList(String keyword, int count, int opt, int cp) {
		
		// 1. 전체 게시글 개수를 확인
		int listCount = dao.getMemberListCount(keyword, opt);
		
		// 2. 가져온 listCount를 이용해서 페이지네이션 객체를 생성
		AdminPagination pagination = new AdminPagination(listCount, cp, count);
		
		// 3. 페이징 처리를 이용해서 게시글 목록을 조회
		List<Member> memberList = dao.selectMemberList(keyword, opt, pagination);
		
		// 5. 값을 넣어서 전송
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberList", memberList);
		map.put("pagination", pagination);
		
		return map;
	}	
	
	
	// 모임 목록 출력(ajax)
	@Override
	public Map<String, Object> selectGroupList(String keyword, int count, int opt, int cp) {
		
		// 1. 전체 게시글 개수를 확인
		int listCount = dao.getGroupListCount(keyword, opt);
		
		// 2. 가져온 listCount를 이용해서 페이지네이션 객체를 생성
		AdminPagination pagination = new AdminPagination(listCount, cp, count);
		
		// 3. 페이징 처리를 이용해서 게시글 목록을 조회
		List<Group> groupList = dao.selectGroupList(keyword, opt, pagination);
		
		// 5. 값을 넣어서 전송
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("groupList", groupList);
		map.put("pagination", pagination);
		
		return map;
	}	
	
	// 게시글 목록 출력(ajax)
	@Override
	public Map<String, Object> selectPostList(String keyword, int count, int opt, int cp) {
		
		// 1. 전체 게시글 개수를 확인
		int listCount = dao.getPostListCount(keyword, opt);
		
		// 2. 가져온 listCount를 이용해서 페이지네이션 객체를 생성
		AdminPagination pagination = new AdminPagination(listCount, cp, count);
		
		// 3. 페이징 처리를 이용해서 게시글 목록을 조회
		List<Post> postList = dao.selectPostList(keyword, opt, pagination);
		
		// 4. 게시글에서 개행문자 제거
		for( Post post : postList) {
			post.setPostContent(AdminUtil.newLineClear2(post.getPostContent()));
		}
		
		// 5. 값을 넣어서 전송
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("postList", postList);
		map.put("pagination", pagination);
		
		return map;
	}

}
