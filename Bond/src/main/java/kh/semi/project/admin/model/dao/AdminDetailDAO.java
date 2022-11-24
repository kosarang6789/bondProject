package kh.semi.project.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.member.model.vo.Member;

@Repository
public class AdminDetailDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 회원 상세 조회
	 * @param inputMemberNo
	 * @return
	 */
	public Member selectMemberDetail(int inputMemberNo) {
		return sqlSession.selectOne("adminMapper.selectMemberDetail", inputMemberNo);
	}

	/** 모임 상세 조회
	 * @param inputGroupNo
	 * @return
	 */
	public Group selectGroupDetail(int inputGroupNo) {
		return sqlSession.selectOne("adminMapper.selectGroupDetail", inputGroupNo);
	}
	
	

}
