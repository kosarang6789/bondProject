package kh.semi.project.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.bond.model.vo.Group;

@Repository
public class SearchDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Group> allGroupList(Map<String, Object> pm) {
		RowBounds rowBounds = new RowBounds(0, 20); 
		return sqlSession.selectList("groupMapper.allGroupList", pm, rowBounds);
	}

	public int bondCount(Map<String, Object> pm) {
		return sqlSession.selectOne("groupMapper.bondCount", pm);
	}

	public List<Group> allGroupList(Map<String, Object> pm, int cp) {
		RowBounds rowBounds = new RowBounds((cp-1) * 20, 20); 
		return sqlSession.selectList("groupMapper.allGroupList", pm, rowBounds);
	}

	
}
