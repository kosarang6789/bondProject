package kh.semi.project.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.admin.model.dao.OldAdminDAO;
import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.member.model.vo.Member;

@Service
public class OldAdminService {
	
	@Autowired
	private OldAdminDAO dao;

	
	/** 회원 리스트
	 * @return
	 */
	public List<Member> printMemberList() {
		List<Member> memberList = dao.printMemberList();
		
		return memberList;
	}


	/** 게시글 리스트
	 * @return
	 */
	public List<Post> printPostList() {
		return dao.printPostList();
	}


	/** 모임 리스트
	 * @return
	 */
	public List<Group> printGroupList() {
		return dao.printGroupList();
	}
	
	
}
