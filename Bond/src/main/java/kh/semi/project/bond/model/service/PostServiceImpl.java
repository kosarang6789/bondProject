package kh.semi.project.bond.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.bond.model.dao.PostDAO;

@Service
public class PostServiceImpl implements PostService{
	
	@Autowired
	private PostDAO dao;
}
