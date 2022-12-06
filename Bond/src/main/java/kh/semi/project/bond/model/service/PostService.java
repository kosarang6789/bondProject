package kh.semi.project.bond.model.service;

import java.util.List;
import java.util.Map;

import kh.semi.project.bond.model.vo.Post;

public interface PostService {

	/** 게시글 상세조회
	 * @param postNo
	 * @return post
	 */
	Post selectPostDetail(int postNo);

	/** 게시글 작성
	 * @param post
	 * @return postNo
	 */
	int postWrite(Post post);

	/** 좋아요체크
	 * @param map
	 * @return result
	 */
	int postLikeCheck(Map<String, Object> map);

	/** 좋아요
	 * @param paramMap
	 * @return
	 */
	int postLikeUp(Map<String, Object> paramMap);

	/** 좋아요 취소
	 * @param paramMap
	 * @return
	 */
	int postLikeDown(Map<String, Object> paramMap);

	/** 조회수 증가
	 * @param map
	 * @return viewResult
	 */
	int postViewUpdate(Map<String, Object> map);

	/** 게시글 삭제
	 * @param postNo
	 * @return result
	 */
	int deletePost(int postNo);

	/** 게시글 내용만 조회
	 * @param postNo
	 * @return
	 */
	Post selectPostContent(int postNo);

	/** 게시글 수정
	 * @param post
	 * @return result
	 */
	int postUpdate(Post post);
	
	/** 모든 게시글 이미지 목록을 조회
	 * @return
	 */
	List<String> selectPostImageList();

}
