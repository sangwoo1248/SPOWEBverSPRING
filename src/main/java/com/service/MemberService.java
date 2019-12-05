package com.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.dao.MemberDAO;
import com.dto.CartDTO;
import com.dto.MemberDTO;

@Controller
public class MemberService {

	@Autowired
	MemberDAO dao;
	
	public void memberAdd(MemberDTO dto) {
		
		dao.memberAdd(dto);
	}

	public MemberDTO login(Map<String, String> map) {
		MemberDTO dto = dao.login(map);
		return dto;
	}

	public MemberDTO myPage(String userid) {
		MemberDTO dto = dao.myPage(userid);
		return dto;
	}

	public void memberUpdate(MemberDTO dto) {
		dao.memberUpdate(dto);
	}
}
