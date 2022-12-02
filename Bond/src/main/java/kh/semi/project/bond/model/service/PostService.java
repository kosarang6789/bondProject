package kh.semi.project.bond.model.service;

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

}
