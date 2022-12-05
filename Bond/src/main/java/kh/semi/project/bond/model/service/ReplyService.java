package kh.semi.project.bond.model.service;

import java.util.List;

import kh.semi.project.bond.model.vo.Reply;

public interface ReplyService {
	
	/** 댓글 목록 조회
	 * @param postNo
	 * @return rList
	 */
	List<Reply> selectReplyList(int postNo);

	/** 댓글 작성
	 * @param reply
	 * @return result
	 */
	int insertReply(Reply reply);

	/** 댓글 삭제
	 * @param replyNo
	 * @return result
	 */
	int deleteReply(int replyNo);

	/** 댓글 수정
	 * @param reply
	 * @return result
	 */
	int updateReply(Reply reply);

}
