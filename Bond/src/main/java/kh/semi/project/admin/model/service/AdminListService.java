package kh.semi.project.admin.model.service;

import java.util.List;
import java.util.Map;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.member.model.vo.Member;

public interface AdminListService {

	
	/** 회원 목록 출력(ajax)
	 * @param keyword
	 * @param opt
	 * @return
	 */
	List<Member> selectMemberList(String keyword, int opt);

	/** 모임 목록 출력(ajax)
	 * @param keyword
	 * @param opt
	 * @return
	 */
	List<Group> selectGroupList(String keyword, int opt);

	/** 게시글 목록 출력(ajax)
	 * @param keyword
	 * @param opt
	 * @return
	 */
	Map<String, Object> selectPostList(String keyword, int opt, int cp);
	
}
