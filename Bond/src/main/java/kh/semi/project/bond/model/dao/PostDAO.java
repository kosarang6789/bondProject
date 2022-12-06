package kh.semi.project.bond.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.bond.model.vo.PostImage;

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

	/** 좋아요 체크 확인
	 * @param map
	 * @return result
	 */
	public int postLikeCheck(Map<String, Object> map) {
		return sqlSession.selectOne("postMapper.postLikeCheck", map);
	}

	
	/** 좋아요
	 * @param paramMap
	 * @return
	 */
	public int postLikeUp(Map<String, Object> paramMap) {
		return sqlSession.insert("postMapper.postLikeUp", paramMap);
	}

	/** 좋아요 취소
	 * @param paramMap
	 * @return
	 */
	public int postLikeDown(Map<String, Object> paramMap) {
		return sqlSession.delete("postMapper.postLikeDown", paramMap);
	}
	
	/** 회원 1명 조회 여부 확인
	 * @param map
	 * @return
	 */
	public int selectViewCount(Map<String, Object> map) {
		return sqlSession.selectOne("postMapper.selectViewCount", map);
	}

	/** 조회 결과 없으면 조회 목록 삽입
	 * @param map
	 * @return
	 */
	public int insertPostView(Map<String, Object> map) {
		return sqlSession.insert("postMapper.insertPostView", map);
	}
	
	/** 게시글 작성
	 * @param post
	 * @return postNo
	 */
	public int postWrite(Post post) {	
		return sqlSession.insert("postMapper.postWrite", post);
	}


	/** DB에 이미지 삽입
	 * @param uploadImages
	 * @return result
	 */
	public int insertPostImages(List<PostImage> uploadImages) {
		return sqlSession.insert("postMapper.insertPostImages", uploadImages);
	}

	/** 게시글 삭제
	 * @param postNo
	 * @return
	 */
	public int deletePost(int postNo) {
		return sqlSession.update("postMapper.deletePost", postNo);
	}

	/** 게시글만 조회
	 * @param postNo
	 * @return
	 */
	public Post selectPostContent(int postNo) {
		return sqlSession.selectOne("postMapper.selectPostContent", postNo);
	}

	
	


	
}
