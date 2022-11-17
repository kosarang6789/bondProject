package kh.semi.project.bond.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BondController {
	
	// 사진첩 페이지로 이동 
	@GetMapping("/bond/album")
	public String albumPage() {
		return "/bond/album";
	}
	
	@GetMapping("/bond/{}")
	
	
}

