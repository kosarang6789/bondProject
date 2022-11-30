package kh.semi.project.bond.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.bond.model.dao.BondMemberDAO;

@Service
public class BondMemberServiceImpl implements BondMemberService{

	@Autowired
	private BondMemberDAO dao;
}
