package kh.semi.project.bond.model.service;

import java.util.Map;

import kh.semi.project.bond.model.vo.Group;

public interface BondService {
	
	// 본드 정보 불러오기
	Group selectGroupInfo(int groupNo);

}
