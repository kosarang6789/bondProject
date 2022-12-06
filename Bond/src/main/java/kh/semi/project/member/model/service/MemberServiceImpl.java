package kh.semi.project.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.semi.project.member.model.dao.MemberDAO;
import kh.semi.project.member.model.vo.Member;
import kh.semi.project.plan.model.vo.Plan;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;

	@Override
	public Member login(Member inputMember) {
		
		Member loginMember = dao.login(inputMember.getMemberEmail());
		
		if(loginMember != null) {
			if(bcrypt.matches(inputMember.getMemberPw(), loginMember.getMemberPw())) {
				loginMember.setMemberPw(null);
			}else {
				loginMember = null;
			}
		}
		return loginMember;
	}

	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int signUp(Member inputMember) {
		
		String encPw = bcrypt.encode(inputMember.getMemberPw());
		inputMember.setMemberPw(encPw);
		int result = dao.signUp(inputMember);
		return result;
	}


	@Override
	public List<Map<String, Object>> selectMyGroup(int memberNo) {

		return dao.selectMyGroup(memberNo);
	}


	// 신고 여부 조회
	@Override
	public String checkReport(int memberNo) {
		return dao.checkReport(memberNo);
	}


	// 가입X 본드 조회
	@Override
	public List<Map<String, Object>> selectJoinNo(int memberNo) {
		return dao.selectJoinNo(memberNo);
	}
	
	// 가입중인 모임의 모든 일정 목록 가져오기
	@Override
	public List<Plan> getMyAllPlans(int memberNo) {
		return dao.getMyAllPlans(memberNo);
	}

	// 모든 회원의 이미지 리스트를 가져옴
	@Override
	public List<String> selectMemberImageList() {
		return dao.selectMemberImageList();
	}

	
	
	
	
}
