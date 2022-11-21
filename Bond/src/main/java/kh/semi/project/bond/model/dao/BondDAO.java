package kh.semi.project.bond.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.bond.model.vo.Group;

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

}
