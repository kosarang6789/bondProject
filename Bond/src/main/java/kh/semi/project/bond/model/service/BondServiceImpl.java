package kh.semi.project.bond.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.bond.model.dao.BondDAO;
import kh.semi.project.bond.model.vo.Group;

@Service
public class BondServiceImpl implements BondService{
	
	@Autowired
	private BondDAO dao;
	
	// 본드 정보 불러오기
	@Override
	public Group selectGroupInfo(int groupNo) {
		
		return dao.selectGroupInfo(groupNo);
	}

}
