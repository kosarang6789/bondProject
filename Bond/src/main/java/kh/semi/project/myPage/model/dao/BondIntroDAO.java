package kh.semi.project.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.GroupImage;

@Repository
public class BondIntroDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 본드 소개 - 이름, 글 수정
	public int bondIntro(Group newGroup) {
		return sqlSession.update("bondIntroMapper.bondIntro", newGroup);
	}

	// 본드 소개 - 이미지 수정
	public int updateImg(GroupImage img) {
		return sqlSession.update("bondIntroMapper.updateImg", img);
	}

	// 본드 소개 - 이미지 삽입
	public int insertImg(GroupImage img) {
		return sqlSession.insert("bondIntroMapper.insertImg", img);
	}
}
