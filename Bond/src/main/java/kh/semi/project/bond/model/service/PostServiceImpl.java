package kh.semi.project.bond.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.bond.model.dao.PostDAO;
import kh.semi.project.bond.model.vo.Post;

@Service
public class PostServiceImpl implements PostService{
	
	@Autowired
	private PostDAO dao;

	// 게시글 상세조회
	@Override
	public Post selectPostDetail(int postNo) {
		
		return dao.selectPostDetail(postNo);
	}
}
