package kh.semi.project.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.member.model.vo.Member;
import kh.semi.project.report.model.vo.Report;

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

	/** 게시글 상세 조회
	 * @param inputPostNo
	 * @return
	 */
	public Post selectPostDetail(int inputPostNo) {
		return sqlSession.selectOne("adminMapper.selectPostDetail", inputPostNo);
	}
	
	public List<Post> selectPostDetail_imageList(int inputPostNo) {
		return sqlSession.selectList("adminMapper.selectPostDetail_imageList", inputPostNo);
	}

	/** 신고 내역 상세 조회
	 * @param inputReportNo
	 * @return
	 */
	public Report selectReportDetail(int inputReportNo) {
		return sqlSession.selectOne("adminMapper.selectReportDetail", inputReportNo);
	}
	
	
	/** 신고 기록 개수 조회(detail 페이지용)
	 * @param targetNo
	 * @return
	 */
	public int getReportListCount(Map<String, Object> infoMap) {
		return sqlSession.selectOne("adminMapper.getReportListCount_detail", infoMap);
	}
	
	/** 신고 기록 내역 조회(detail 페이지용)
	 * @param targetNo
	 * @return
	 */
	public List<Report> getReportList(Map<String, Object> infoMap) {
		return sqlSession.selectList("adminMapper.getReportList_detail", infoMap);
	}
	
	
	
	

}
