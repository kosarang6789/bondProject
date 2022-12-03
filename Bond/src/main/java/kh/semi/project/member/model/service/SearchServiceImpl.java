package kh.semi.project.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.member.model.dao.SearchDAO;

@Service
public class SearchServiceImpl {

	@Autowired
	private SearchDAO dao;
}
