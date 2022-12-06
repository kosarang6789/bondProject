package kh.semi.project.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.bond.model.vo.Group;

@Repository
public class SearchDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Group> allGroupList(Map<String, Object> pm) {
		
		return sqlSession.selectList("groupMapper.allGroupList", pm);
	}
	
}