package kh.semi.project.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.Pagination;
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

	/** 가입X 본드 조회
	 * @param memberNo
	 * @return
	 */
	public List<Map<String, Object>> selectJoinNo(int memberNo) {
		return sqlSession.selectList("groupMapper.selectJoinNo", memberNo);
	}
	
	/** 본드 수 조회 
	 * @param groupNo
	 * @return
	 */
	public int getListCount(int groupNo, int cp) {
		return sqlSession.selectOne("groupMapper.getListCount", groupNo);
	}

	/** 본드 목록 조회 
	 * @param pm
	 * @param groupNo
	 * @return
	 */
	public List<Group> selectGroupList(Pagination pagination, int groupNo) {
		return sqlSession.selectList("groupMapper.selectGroupList", groupNo);
	}
	
	/** 검색 조건이 일치하는 본드 수 조회 
	 * @param pm
	 * @return
	 */
	public int getListCount(Map<String, Object> pm) {
		return sqlSession.selectOne("groupMapper.getListCount_search", pm);
	}

	
	/** 검색 조건이 일치하는 본드 목록 조회 
	 * @param pm
	 * @param pagination
	 * @return
	 */
	public List<Group> selectGroupList(Pagination pagination, Map<String, Object> pm) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("groupMapper.selectGroupList_search", pm, rowBounds);
	}

	public List<Group> allGroupList() {
		return sqlSession.selectList("groupMapper.allGroupList");
	}







}
