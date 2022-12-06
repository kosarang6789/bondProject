package kh.semi.project.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.member.model.vo.Member;
import kh.semi.project.plan.model.vo.Plan;

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

	/** 가입X 본드 조회
	 * @param memberNo
	 * @return
	 */
	public List<Map<String, Object>> selectJoinNo(int memberNo) {
		return sqlSession.selectList("groupMapper.selectJoinNo", memberNo);
	}

	// 가입중인 모임의 모든 일정 목록 가져오기
	public List<Plan> getMyAllPlans(int memberNo) {
		return sqlSession.selectList("planMapper.getMyAllPlans", memberNo);
	}
}
