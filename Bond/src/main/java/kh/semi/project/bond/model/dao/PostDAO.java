package kh.semi.project.bond.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.bond.model.vo.Post;

@Repository
public class PostDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	

	/** 게시글 조회
	 * @param postNo
	 * @return
	 */
	public Post selectPostDetail(int postNo) {
		
		return sqlSession.selectOne("postMapper.selectPostDetail", postNo);
	}

	
	/** 게시글 작성
	 * @param post
	 * @return
	 */
	public int postWrite(Post post) {
		
		return sqlSession.insert("postMapper.postWrite", post);
	}

	
}
