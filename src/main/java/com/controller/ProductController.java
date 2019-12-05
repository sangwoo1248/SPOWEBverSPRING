package com.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.CartDTO;
import com.dto.MemberDTO;
import com.dto.OrderDTO;
import com.dto.PageDTO;
import com.dto.ProductDTO;
import com.service.MemberService;
import com.service.ProductService;

@Controller
public class ProductController {

@Autowired
ProductService service;

@Autowired
MemberService mService;

	@RequestMapping("/productList")
	public ModelAndView productList(@RequestParam("sCategory") String sCategory) {
		
		List<ProductDTO> list =service.productList(sCategory);
		ModelAndView m = new ModelAndView();
		m.addObject("productList", list);
		m.setViewName("Main");
		return m; 
	}
	
	@RequestMapping("/productList/sCategory/{category}")
	public String productList2(@PathVariable("category")String sCategory,
			Model model) {
		List<ProductDTO> list =service.productList(sCategory);
		model.addAttribute("productList", list);
		return "redirect:../../productList?sCategory="+sCategory;
	}
	
	@RequestMapping("/productList/curPage")
	public String productList3(@RequestParam(defaultValue = "1") String curPage, 
			Model model,String sCategory){ 
		if(curPage == null) { 
			curPage = "1";
		}
		
		PageDTO pDTO = service.selectAll(Integer.parseInt(curPage));
		System.out.println("=>=>=>=>"+pDTO);
			
		model.addAttribute("productList", curPage);
		return "redirect:../../productList?curPage="+curPage; 
	}
	
	@RequestMapping("/productRetrieve")  
	@ModelAttribute("productRetrieve")
	public ProductDTO productRetrieve(@RequestParam("sCode") String sCode) {
		ProductDTO dto = service.productRetrieve(sCode);
		System.out.println(sCode);
		return dto;
	}
	
	@RequestMapping("/loginCheck/cartAdd")
	public String cartAdd(CartDTO dto, HttpSession session) {
		MemberDTO m = (MemberDTO)session.getAttribute("login");
		dto.setUserid(m.getUserid());
		service.cartAdd(dto);
		return "redirect:../productRetrieve?sCode="+dto.getsCode();
	}
	
	@RequestMapping("/loginCheck/cartList")
	public String cartList(RedirectAttributes attr,  HttpSession session) {
		MemberDTO m = (MemberDTO)session.getAttribute("login");
		String userid = m.getUserid();
		List<CartDTO> list = service.cartList(userid);
		attr.addFlashAttribute("cartList", list);
		
		return "redirect:../cartList";
	}
	
	@RequestMapping("/loginCheck/cartUpdate")
	@ResponseBody
	public void cartUpdate(@RequestParam Map<String, String> map) {
	service.cartUpdate(map);
	}
	
	@RequestMapping("/loginCheck/cartDelete")
	@ResponseBody
	public void cartDelete(@RequestParam("num") int num) {
	service.cartDelete(num);
	}
	
	@RequestMapping("/loginCheck/delAllCart")
	public String delAllCart(@RequestParam("check") ArrayList<String> list) {
		System.out.println(list);
		service.delAllCart(list);
		return "redirect:../loginCheck/cartList";
	}
	
	@RequestMapping("/loginCheck/orderConfirm")
	public String orderConfirm(@RequestParam("num")int num, HttpSession session,
							RedirectAttributes r) {
	MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
	String userid = mDTO.getUserid();
	
	mDTO = mService.myPage(userid);
	CartDTO cDTO = service.orderConfirmByNum(num);
	
	r.addFlashAttribute("mDTO", mDTO);
	r.addFlashAttribute("cDTO", cDTO);
	return "redirect:../orderConfirm";
	}
	
	@RequestMapping("/loginCheck/orderDone")
	public String orderDone(OrderDTO oDTO ,int orderNum, HttpSession session,
							RedirectAttributes r) {
		System.out.println(orderNum + "" + oDTO);
		
		MemberDTO dto =(MemberDTO)session.getAttribute("login");
		
		oDTO.setUserid(dto.getUserid());
		oDTO.setNum(orderNum);
		service.orderDone(oDTO, orderNum);
		
		r.addFlashAttribute("oDTO", oDTO);
		return "redirect:../orderDone";
	}
	 
	@RequestMapping("/loginCheck/orderAllConfirm")
	public String orderAllConfirm(@RequestParam("check") List<String> list,
			HttpSession session,RedirectAttributes r) {
	
		
		MemberDTO mDTO = (MemberDTO)session.getAttribute("login"); 
		String userid = mDTO.getUserid();
		
		mDTO = mService.myPage(userid);  
		  
		List<CartDTO> cList = service.orderAllConfirm(list);
		
		
		r.addFlashAttribute("mDTO", mDTO);
		r.addFlashAttribute("cList", cList);
		
		return "redirect:../orderAllConfirm";
	}
	 
	@RequestMapping("loginCheck/orderAllDone")
	public String orderAllDone(@RequestParam("num") ArrayList<String> oList, 
		 HttpSession session, RedirectAttributes r) {
		
		MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
		System.out.println("!!!!!!!!!!!");
		
		String userid = mDTO.getUserid();
		mDTO = mService.myPage(userid);  
	
		
		//service.orderAllDone(oList, list);
	
		System.out.println("^^^^^^^");
		r.addFlashAttribute("orderAllDone",oList);
		return "redirect:../orderAllDone";
	}	
}
