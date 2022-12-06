package kh.semi.project.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.member.model.dao.FindBondDAO;

@Service
public class FindBondServiceImpl implements FindBondService {

	@Autowired
	private FindBondDAO dao;
	
	@Override
	public List<Map<String, Object>> groupTopic(int topicCode) {
		return dao.groupTopic(topicCode);
	}


}
