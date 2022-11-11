package kh.semi.project.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DupDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 회원가입 이메일 중복 검사
	public int emailDupCheck(String memberEmail) {
		return sqlSession.selectOne("dupMapper.emailDupCheck", memberEmail);
	}

	/** 회원가입 이름 중복 검사
	 * @param memberName
	 * @return result
	 */
	public int nameDupCheck(String memberName) {
		return sqlSession.selectOne("dupMapper.nameDupCheck", memberName);
	}

}
