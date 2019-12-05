package com.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.dto.MemberDTO;
@Controller
public class MemberDAO {

	@Autowired
	SqlSessionTemplate template;
	public void memberAdd(MemberDTO dto) {
		int n = template.insert("MemberMapper.memberAdd", dto);
	}
	public MemberDTO login(Map<String, String> map) {
		MemberDTO dto = template.selectOne("MemberMapper.login", map);
		return dto;
	}
	public MemberDTO myPage(String userid) {
		MemberDTO dto = template.selectOne("MemberMapper.mypage", userid);
		return dto;
	}
	public void memberUpdate(MemberDTO dto) {
		int n = template.update("MemberMapper.memberUpdate", dto);
		
	}
}
