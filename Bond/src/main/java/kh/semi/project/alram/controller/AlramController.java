package kh.semi.project.alram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kh.semi.project.alram.model.service.AlramService;

@Controller
public class AlramController {
	
	@Autowired
	private AlramService service;

}
