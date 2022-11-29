package kh.semi.project.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.member.model.vo.Member;

@Repository
public class MemberDAO {

	// DBCP + 마이바티스 이용 객체 DI(의존성 주입)
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member login(String memberEmail) {
		return sqlSession.selectOne("memberMapper.login", memberEmail);
	}

	public int signUp(Member inputMember) {
		return sqlSession.insert("memberMapper.signUp", inputMember);
	}

	public List<Map<String, Object>> selectMyGroup(int memberNo) {
		return sqlSession.selectList("groupMapper.selectMyGroup", memberNo);
	}

	/** 신고 여부 조회
	 * @return result(조회한 컬럼 개수)
	 */
	public String checkReport(int memberNo) {
		return sqlSession.selectOne("memberMapper.checkReport", memberNo);
	}

}
