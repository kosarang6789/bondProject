package kh.semi.project.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.member.model.vo.Member;

@Repository
public class AdminListDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 회원 목록 출력(ajax)
	 * @param keyword
	 * @return memberList
	 */
	public List<Member> selectMemberList(String keyword, int opt) {
		
		String condition = null;
		
		if(opt==1) condition = "MEMBER_NO = '" + keyword + "'";
		if(opt==2) condition = "MEMBER_NAME LIKE '%' || '" +  keyword + "' || '%'";
		if(opt==3) condition = "MEMBER_EMAIL LIKE '%' || '" +  keyword + "' || '%'";
		
		return sqlSession.selectList("adminMapper.selectMemberList", condition);
	}

	/** 모임 목록 출력(ajax)
	 * @param keyword
	 * @return groupList
	 */
	public List<Group> selectGroupList(String keyword, int opt) {
		
		String condition = null;
		
		if(opt==1) condition = "GROUP_NO = '" + keyword + "'";
		if(opt==2) condition = "GROUP_NAME LIKE '%' || '" +  keyword + "' || '%'";
		
		return sqlSession.selectList("adminMapper.selectGroupList", condition);
	}

}
