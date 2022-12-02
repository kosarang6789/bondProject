package kh.semi.project.bond.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.bond.model.dao.BondMemberDAO;
import kh.semi.project.bond.model.vo.GroupMemberList;

@Service
public class BondMemberServiceImpl implements BondMemberService{

	@Autowired
	private BondMemberDAO dao;

	
	// 본드 멤버 리스트 가져오기
	@Override
	public Map<String, Object> selectMemberList(int groupNo) {

		List<GroupMemberList> memList = dao.selectMemberList(groupNo);
		
		Map<String, Object> memMap = new HashMap<String, Object>();
		memMap.put("memList", memList);
		
		return memMap;
	}


	
}
