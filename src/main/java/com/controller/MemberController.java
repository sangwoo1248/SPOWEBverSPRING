package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@RequestMapping(value = "/memberAdd")
	public String memberAdd(MemberDTO dto, Model model) {
		System.out.println(dto);
		service.memberAdd(dto);
		System.out.println(dto);
		model.addAttribute("s", "성공"); 
		return "Main";
	}
	
	@RequestMapping(value = "/loginCheck/myPage")
	public String myPage(HttpSession session) {
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		String userid = dto.getUserid();
		dto = service.myPage(userid);
		session.setAttribute("login", dto);
		
		return "redirect:../myPage";
	}
	
	@RequestMapping(value = "/loginCheck/memberUpdate")
	public String memberUpdate(MemberDTO dto) {
		service.memberUpdate(dto);
		return "redirect:../loginCheck/myPage";
	}
	
	@RequestMapping(value="/idDuplicateCheck",produces ="text/plain;charset=UTF-8" )
	@ResponseBody
	public String idDuplicateCheck(@RequestParam("id") String userid) {
		MemberDTO dto = service.myPage(userid);
		String mesg = "아이디 사용 가능";
		if(dto!=null) {
			mesg = "아이디 중복";
		}
		return mesg; 
	}
}
