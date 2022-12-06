package kh.semi.project.alram.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.alram.model.dao.ChatDAO;

@Service
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	private ChatDAO dao;

}
