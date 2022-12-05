package kh.semi.project.alram.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.alram.model.dao.AlramDAO;

@Service
public class AlramServiceImpl implements AlramService{
	
	@Autowired
	private AlramDAO dao;

}
