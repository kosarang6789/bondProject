package kh.semi.project.bond.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.Pagination;
import kh.semi.project.bond.model.vo.Post;

@Repository
public class BondDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	/**
	 * @param groupNo
	 * @return
	 */
	public Group selectGroupInfo(int groupNo) {
		
		return sqlSession.selectOne("groupMapper.selectGroup", groupNo);
	}
	
	/** 게시글 수 조회
	 * @param postNo
	 * @return listCount
	 */
	public int getPostCount(int groupNo) {
		return sqlSession.selectOne("postMapper.getPostCount", groupNo);
	}

	/** 게시물 목록 조회
	 * @param pagination
	 * @param groupNo
	 * @return
	 */
//	public List<Post> selectBoardDetail(Pagination pagination, int groupNo) {
//		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
//		
//		RowBounds rowBounds = new  RowBounds(offset, pagination.getLimit());
//		
//		return sqlSession.selectList("postMapper.selectBoardDetail", groupNo, rowBounds);
//	}

	public List<Post> selectBoardDetail(int groupNo) {
		return sqlSession.selectList("postMapper.selectBoardDetail", groupNo);
	}
	public List<Post> selectBoardDetail(int groupNo, int cp) {
		RowBounds rowBounds = new RowBounds((cp-1) * 20, 20); 
				
		return sqlSession.selectList("postMapper.selectBoardDetail", groupNo, rowBounds);
	}

}
