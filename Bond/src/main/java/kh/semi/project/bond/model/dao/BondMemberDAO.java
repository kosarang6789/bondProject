package kh.semi.project.bond.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.bond.model.vo.GroupMemberList;

@Repository
public class BondMemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 멤버 리스트 가져오기
	public List<GroupMemberList> selectMemberList(int groupNo, int cp) {
		
		RowBounds rowBounds = new RowBounds((cp-1)*15, 15);
		
		return sqlSession.selectList("bondMemberListMapper.selectMemberList", groupNo, rowBounds);
	}


	// 본드 멤버 리스트 무한 스크롤
	public List<GroupMemberList> memberListScroll(int groupNo, int cp) {

		RowBounds rowBounds = new RowBounds((cp-1)*15, 15);
		
		return sqlSession.selectList("bondMemberListMapper.selectMemberList",groupNo, rowBounds);
	}


	// 본드 멤버 프로필 클릭
	public GroupMemberList selecMemPro(GroupMemberList memPro) {
		return sqlSession.selectOne("bondMemberListMapper.selectMemPro", memPro);
	}




}
