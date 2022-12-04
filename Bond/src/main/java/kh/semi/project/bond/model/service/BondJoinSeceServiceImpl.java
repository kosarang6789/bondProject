package kh.semi.project.bond.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.semi.project.bond.model.dao.BondJoinSeceDAO;
import kh.semi.project.bond.model.vo.GroupMemberList;

@Service
public class BondJoinSeceServiceImpl implements BondJoinSeceService{
	
	@Autowired
	private BondJoinSeceDAO dao;

	
	// 그룹 가입하기
	@Override
	@Transactional
	public int bondJoin(int memberNo, int groupNo) {

		GroupMemberList join = new GroupMemberList();
		
		join.setGroupNo(groupNo);
		join.setMemberNo(memberNo);
		
		return dao.bondJoin(join);
	}

}
