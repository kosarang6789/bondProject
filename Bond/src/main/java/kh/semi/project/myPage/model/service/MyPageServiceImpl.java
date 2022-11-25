package kh.semi.project.myPage.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kh.semi.project.myPage.model.dao.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	
	// 회원 탈퇴
	@Override
	public int secession(String memberPw, int memberNo) {
		
		// 비밀번호 조회
		String encPw = dao.selectEncPw(memberNo);
		
		if(bcrypt.matches(memberPw, encPw)) {
			return dao.secession(memberNo);
		}
		
		return 0;
	}


	// 비밀번호 변경
	@Override
	public int changePw(Map<String, Object> map) {
		
		int memberNo = (int)map.get("memberNo");
		
		String encPw = dao.selectEncPw(memberNo);
		
		if(bcrypt.matches((String)map.get("currentPw"), encPw)) {
			String newPw = bcrypt.encode((String)map.get("newPw"));
			map.put("newPw", newPw);
			int result = dao.changePw(map);
			return result;
		}
		
		return 0;
	}

}
