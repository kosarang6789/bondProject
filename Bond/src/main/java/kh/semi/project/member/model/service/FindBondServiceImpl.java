package kh.semi.project.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.member.model.dao.FindBondDAO;

@Service
public class FindBondServiceImpl implements FindBondService {

	@Autowired
	private FindBondDAO dao;

	
	@Override
	public List<Map<String, Object>> groupTopic(int topicCode) {
		return dao.groupTopic(topicCode);
	}
	
//	@Override
//	public Map<String, Object> groupTopic(int topicCode, int cp) {
//		int groupCount = dao.groupCount(topicCode);
//		
//		List<Group> groupTopic = dao.groupTopic(topicCode, cp);
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("groupCount", groupCount);
//		map.put("groupTopic", groupTopic);
//		
//		return map;
//	}

//	@Override
//	public Map<String, Object> groupTopic(int topicCode, int cp) {
//		int groupCount = dao.groupCount(topicCode);
//		
//		List<Group> groupTopic1 = dao.groupTopic(topicCode, cp);
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("groupCount", groupCount);
//		map.put("groupTopic1", groupTopic1);
//		
//		return map;
//	}



}
