package kh.semi.project.alram.model.websocket;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kh.semi.project.alram.model.service.ChatService;

public class AlramWebsocketHandelr extends TextWebSocketHandler{
	
	private Logger logger = LoggerFactory.getLogger(AlramWebsocketHandelr.class);
	
	@Autowired
	private ChatService service;
	
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());

}
