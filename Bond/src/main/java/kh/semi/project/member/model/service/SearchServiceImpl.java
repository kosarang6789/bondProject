package kh.semi.project.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.member.model.dao.SearchDAO;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDAO dao;

	@Override
	public Map<String, Object> allGroupList(Map<String, Object> pm) {
		
		List<Group> groupList = dao.allGroupList(pm);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("groupList", groupList);
		return map;
	}

	
}
