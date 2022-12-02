package kh.semi.project.bond.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.bond.model.vo.Post;

@Repository
public class PostDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Post selectPostDetail(int postNo) {
		
		return sqlSession.selectOne("postMapper.selectPostDetail", postNo);
	}

	
}
