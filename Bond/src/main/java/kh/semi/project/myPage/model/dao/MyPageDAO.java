package kh.semi.project.myPage.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.member.model.vo.Member;
import kh.semi.project.member.model.vo.MemberImage;

@Repository
public class MyPageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// 회원 탈퇴
	public int secession(int memberNo) {

		return sqlSession.update("myPageMapper.secession", memberNo);
	}


	// 암호화 된 비밀번호 조회
	public String selectEncPw(int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectEncPw", memberNo);
	}


	// 비밀번호 변경
	public int changePw(Map<String, Object> map) {
		return sqlSession.update("memberMapper.changePw", map);
	}

	
	
	
	// 이미지가 있는지 조회
	public int checkImg(Member loginMember) {
		return sqlSession.selectOne("myPageMapper.checkImg", loginMember);
	}
	
	// 내 정보 수정 - 이미지 삽입
	public int insertImg(MemberImage img) {
		return sqlSession.insert("myPageMapper.insertImg", img);
	}

	
	// 내 정보 수정 - 이미지 수정
	public int updateImg(MemberImage img) {
		return sqlSession.update("myPageMapper.updateImg", img);
	}
	
	// 내 정보 수정 - 이름, 전화번호, 생일
	public int updateProfile(Member inputMember) {
		return sqlSession.update("myPageMapper.updateProfile", inputMember);
	}




}
