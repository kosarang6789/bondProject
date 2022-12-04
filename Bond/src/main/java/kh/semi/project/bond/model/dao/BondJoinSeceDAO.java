package kh.semi.project.bond.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.bond.model.vo.GroupMemberList;

@Repository
public class BondJoinSeceDAO {
	
	@Autowired 
	private SqlSessionTemplate sqlSession;

	
	// 본드 가입
	public int bondJoin(GroupMemberList join) {
		return sqlSession.insert("bondJoinSeceMapper.bondJoin", join);
	}

}
