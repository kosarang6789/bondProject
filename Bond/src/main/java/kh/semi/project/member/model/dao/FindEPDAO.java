package kh.semi.project.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.member.model.vo.Member;

@Repository
public class FindEPDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member findEmail(Member inputMember) {
		return sqlSession.selectOne("memberMapper.findEmail", inputMember);
	}

}
