package kh.semi.project.bond.model.service;

import java.util.List;

import kh.semi.project.bond.model.vo.Reply;

public interface ReplyService {
	
	/** 댓글 목록 조회
	 * @param postNo
	 * @return rList
	 */
	List<Reply> selectReplyList(int postNo);

}
