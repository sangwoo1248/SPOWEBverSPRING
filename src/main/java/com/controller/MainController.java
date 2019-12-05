package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dto.ProductDTO;
import com.service.ProductService;

@Controller
public class MainController {
	
	@Autowired
	ProductService service;
	
	@RequestMapping("/")
	public ModelAndView productList() {
		List<ProductDTO> list = service.productList("TOP");
		ModelAndView m = new ModelAndView();
		m.addObject("productList", list);
		//request.setAttribute("goodsList", list); 동일
		System.out.println(list);
		m.setViewName("Main"); //goodsList.jsp
		return m;
	}
	
}
