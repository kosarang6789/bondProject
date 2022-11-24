package kh.semi.project.bond.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.bond.model.dao.BondDAO;
import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.Pagination;
import kh.semi.project.bond.model.vo.Post;

@Service
public class BondServiceImpl implements BondService{
	
	@Autowired
	private BondDAO dao;
	
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

	
	
	
}
