package kh.semi.project.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FindBondDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Map<String, Object>> groupTopic(int topicCode) {
		return sqlSession.selectList("groupMapper.groupTopic", topicCode);
	}

}
