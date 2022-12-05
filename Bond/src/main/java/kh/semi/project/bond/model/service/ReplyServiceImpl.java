package kh.semi.project.bond.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.bond.model.vo.Reply;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDAO dao;
	
	// 댓글 목록 조회
	@Override
	public List<Reply> selectReplyList(int postNo) {
		return dao.selectReplyList(postNo);
	}

}
