package kh.semi.project.bond.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.bond.model.vo.Reply;

@Repository
public class ReplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 댓글 목록 조회
	 * @param postNo
	 * @return rList
	 */
	public List<Reply> selectReplyList(int postNo) {
		return sqlSession.selectList("postMapper.selectReplyList", postNo);
	}

	/** 댓글 등록
	 * @param reply
	 * @return result
	 */
	public int insertReply(Reply reply) {
		return sqlSession.insert("replyMapper.insertReply", reply);
	}

}
