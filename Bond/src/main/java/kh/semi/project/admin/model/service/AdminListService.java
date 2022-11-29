package kh.semi.project.admin.model.service;

import java.util.Map;

public interface AdminListService {

	
	/** 회원 목록 출력(ajax)
	 * @param keyword
	 * @param count
	 * @param opt
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectMemberList(String keyword, int count, int opt, int cp);

	/** 모임 목록 출력(ajax)
	 * @param keyword
	 * @param count
	 * @param opt
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectGroupList(String keyword, int count, int opt, int cp);

	/** 게시글 목록 출력(ajax)
	 * @param keyword
	 * @param count
	 * @param opt
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectPostList(String keyword, int count, int opt, int cp);

	/** 신고 목록 출력(ajax)
	 * @param keyword
	 * @param count
	 * @param opt
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectReportList(String keyword, int count, int opt, int cp);
	
}
