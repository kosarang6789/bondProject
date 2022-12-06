package kh.semi.project.member.model.service;

import java.util.List;
import java.util.Map;

import kh.semi.project.bond.model.vo.Group;

public interface SearchService {

	Map<String, Object> allGroupList(Map<String, Object> pm);
	
	Map<String, Object> allGroupList(Map<String, Object> pm, int cp);


	
}
