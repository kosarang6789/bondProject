package kh.semi.project.bond.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.semi.project.bond.model.service.BondMemberService;


@Controller
@SessionAttributes({"loginMember", "groupInfo"})
public class BondMemberController {
	
	@Autowired
	private BondMemberService serivce;
	
	@GetMapping("/bond/memberList")
	public String goMemberList() {
		return "bond/bondMemberList";
	}

}
