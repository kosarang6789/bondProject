package kh.semi.project.bond.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.bond.model.vo.Reply;
import kh.semi.project.common.Util;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDAO dao;
	
	// 댓글 목록 조회
	@Override
	public List<Reply> selectReplyList(int postNo) {
		return dao.selectReplyList(postNo);
	}

	// 댓글 작성
	@Override
	public int insertReply(Reply reply) {
		reply.setReplyContent(Util.XSSHandling(reply.getReplyContent()));
		reply.setReplyContent(Util.newLineHandling(reply.getReplyContent()));
		
		return dao.insertReply(reply);
	}

	// 댓글 삭제
	@Override
	public int deleteReply(int replyNo) {
		return dao.deleteReply(replyNo);
	}

}
