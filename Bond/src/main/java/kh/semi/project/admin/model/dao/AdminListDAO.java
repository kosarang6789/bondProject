package kh.semi.project.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.admin.model.vo.AdminPagination;
import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.Pagination;
import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.member.model.vo.Member;

@Repository
public class AdminListDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/** 회원 목록 개수 확인
	 * @param keyword
	 * @param opt
	 * @return
	 */
	public int getMemberListCount(String keyword, int opt) {
		String condition = null;
		
		if(opt==1) condition = "MEMBER_NO = '" + keyword + "'";
		if(opt==2) condition = "MEMBER_NAME LIKE '%' || '" +  keyword + "' || '%'";
		if(opt==3) condition = "MEMBER_EMAIL LIKE '%' || '" +  keyword + "' || '%'";
		
		return sqlSession.selectOne("adminMapper.getMemberListCount", condition);
	}
	
	/** 회원 목록 검색(ajax)
	 * @param keyword
	 * @param opt
	 * @return memberList
	 */
	public List<Member> selectMemberList(String keyword, int opt, AdminPagination pagination) {
		
		int offset = ( pagination.getCurrentPage() - 1 ) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		String condition = null;
		
		if(opt==1) condition = "MEMBER_NO = '" + keyword + "'";
		if(opt==2) condition = "MEMBER_NAME LIKE '%' || '" +  keyword + "' || '%'";
		if(opt==3) condition = "MEMBER_EMAIL LIKE '%' || '" +  keyword + "' || '%'";
		
		return sqlSession.selectList("adminMapper.selectMemberList", condition, rowBounds);
	}
	
	/** 모임 목록 개수 확인
	 * @param keyword
	 * @param opt
	 * @return
	 */
	public int getGroupListCount(String keyword, int opt) {
		
		String condition = null;
		
		if(opt==1) condition = "GROUP_NO = '" + keyword + "'";
		if(opt==2) condition = "GROUP_NAME LIKE '%' || '" +  keyword + "' || '%'";
		
		return sqlSession.selectOne("adminMapper.getGroupListCount", condition);
	}

	/** 모임 목록 출력(ajax)
	 * @param keyword
	 * @param opt
	 * @return groupList
	 */
	public List<Group> selectGroupList(String keyword, int opt, AdminPagination pagination) {
		
		int offset = ( pagination.getCurrentPage() - 1 ) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		String condition = null;
		
		if(opt==1) condition = "GROUP_NO = '" + keyword + "'";
		if(opt==2) condition = "GROUP_NAME LIKE '%' || '" +  keyword + "' || '%'";
		
		return sqlSession.selectList("adminMapper.selectGroupList", condition, rowBounds);
	}
	
	
	/** 게시글 목록 개수 확인
	 * @param keyword
	 * @param opt
	 * @return
	 */
	public int getPostListCount(String keyword, int opt) {
		String condition = null;
		
		if(opt==1) condition = "POST_CONTENT LIKE '%' || '" +  keyword + "' || '%'";
		if(opt==2) condition = "GROUP_NAME LIKE '%' || '" +  keyword + "' || '%'";
		if(opt==3) condition = "MEMBER_NAME LIKE '%' || '" +  keyword + "' || '%'";
		
		return sqlSession.selectOne("adminMapper.getPostListCount", condition);
	}

	/** 게시글 목록 검색 (ajax)
	 * @param keyword
	 * @param opt
	 * @return
	 */
	public List<Post> selectPostList(String keyword, int opt, AdminPagination pagination) {
		
		// RowBounds 객체 (마이바티스)
		// - 여러 행 조회 결과 중 특정 위치부터 지정된 행의 개수만 조회
		//                    (몇 행을 건너 뛸 것인가?)
		
		int offset = ( pagination.getCurrentPage() - 1 ) * pagination.getLimit();
	
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		String condition = null;
		
		if(opt==1) condition = "POST_CONTENT LIKE '%' || '" +  keyword + "' || '%'";
		if(opt==2) condition = "GROUP_NAME LIKE '%' || '" +  keyword + "' || '%'";
		if(opt==3) condition = "MEMBER_NAME LIKE '%' || '" +  keyword + "' || '%'";
		
		return sqlSession.selectList("adminMapper.selectPostList", condition, rowBounds);
	}



}
