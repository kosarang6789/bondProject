package kh.semi.project.bond.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BondMemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
