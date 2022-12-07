package kh.semi.project.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.bond.model.vo.Group;

@Repository
public class FindBondDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Map<String, Object>> groupTopic(int topicCode) {
		return sqlSession.selectList("groupMapper.groupTopic", topicCode);
	}
	
//	public int groupCount(int topicCode) {
//		return sqlSession.selectOne("groupMapper.groupCount", topicCode);
//	}
//
//	public List<Group> groupTopic(int topicCode, int cp) {
//		RowBounds rowBounds = new RowBounds((cp-1) * 10, 10);
//		return sqlSession.selectList("groupMapper.groupTopic", topicCode, rowBounds);
//	}

//	public List<Group> groupTopic(int topicCode, int cp) {
//		RowBounds rowBounds = new RowBounds((cp-1) * 10, 10); 
//		
//		return sqlSession.selectList("groupMapper.groupTopic", topicCode, rowBounds);
//	}
//
//	public int groupCount(int topicCode) {
//		return sqlSession.selectOne("groupMapper.groupCount", topicCode);
//	}
	

}
