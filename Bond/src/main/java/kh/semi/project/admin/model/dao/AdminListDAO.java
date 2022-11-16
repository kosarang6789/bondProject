package kh.semi.project.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.member.model.vo.Member;

@Repository
public class AdminListDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 회원 정보 출력(ajax)
	 * @param keyword
	 * @return
	 */
	public List<Member> selectMemberList(String keyword) {
		
		return sqlSession.selectList("adminMapper.selectMemberList", keyword);
	}

}
