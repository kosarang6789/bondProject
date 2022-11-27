package kh.semi.project.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.admin.model.vo.Report;
import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.member.model.vo.Member;

@Repository
public class ReportDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 스케줄러를 이용한 신고 테이블 자동 업데이트
	 * @return
	 */
	public int autoReportUpdate() {
		return sqlSession.update("reportMapper.autoReportUpdate");
	}

	/** 신고 대상이 회원인 경우
	 * @param input
	 * @return memberName, memberNo
	 */
	public Member getMemberInfo(int input) {
		return sqlSession.selectOne("reportMapper.getMemberInfo", input);
	}

	/** 신고 대상이 모임인 경우
	 * @param input
	 * @return groupNo, groupName, groupComment
	 */
	public Group getGroupInfo(int input) {
		return sqlSession.selectOne("reportMapper.getGroupInfo", input);
	}

	/** 신고 대상이 게시글인 경우
	 * @param input
	 * @return postNo, postContent
	 */
	public Post getPostInfo(int input) {
		return sqlSession.selectOne("reportMapper.getPostInfo", input);
	}

	/** 신고 사유 목록 가져오기
	 * @param target
	 * @return reasonList
	 */
	public List<Report> getReportReasonList(int typeCode) {
		List<Report> reportList = sqlSession.selectList("reportMapper.getReportReasonList", typeCode);
		return reportList;
	}

	/** 회원 신고하기
	 * @param typeCode
	 * @param reasonCode
	 * @param memberNo
	 * @return
	 */
	public int makeReport(Map<String, Object> infoMap) {
		return sqlSession.insert("reportMapper.makeReport", infoMap);
	}


}
