package com.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ProductDAO;
import com.dto.CartDTO;
import com.dto.OrderDTO;
import com.dto.PageDTO;
import com.dto.ProductDTO;

@Controller
public class ProductService {

	@Autowired
	ProductDAO dao;
	
	public List<ProductDTO> productList(String sCategory) {
		List<ProductDTO> list = dao.productList(sCategory);
		return list;
	}

	public ProductDTO productRetrieve(String sCode) {
		ProductDTO dto =dao.productRetrieve(sCode);
		return dto;
	}

	public void cartAdd(CartDTO dto) {
		dao.cartAdd(dto);
		
	}

	public List<CartDTO> cartList(String userid) {
		List<CartDTO> list = dao.cartList(userid);
		return list;
	}

	public void cartUpdate(Map<String, String> map) {
		dao.cartUpdate(map);
	}

	public void cartDelete(int num) {
		dao.cartDelete(num);
		
	}

	public void delAllCart(ArrayList<String> list) {
		dao.delAllCart(list);	
	}

	public CartDTO orderConfirmByNum(int num) {
		CartDTO dto = dao.orderConfirmByNum(num);
		return dto;
	}

	@Transactional
	public void orderDone(OrderDTO oDTO, int orderNum) {
		dao.orderDone(oDTO);
		dao.cartDelete(orderNum);
	}

	public List<CartDTO> orderAllConfirm(List<String> list) {
		List<CartDTO> cList = dao.orderAllConfirm(list);
		return cList;
	}

	@Transactional
	public void orderAllDone(ArrayList<String> oList, ArrayList<String> list) {
		dao.orderAllDone(oList);
		dao.delAllCart(list);
		
	}

	public PageDTO selectAll(int curPage) {
		PageDTO pDTO = dao.selectAll(curPage);
		return pDTO;
	}


	

	
}
