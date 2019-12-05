package com.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import com.dto.CartDTO;
import com.dto.OrderDTO;
import com.dto.PageDTO;
import com.dto.ProductDTO;

@Controller
public class ProductDAO {

	@Autowired
	SqlSessionTemplate template;
	
	public List<ProductDTO> productList(String sCategory) {
		List<ProductDTO> list = template.selectList("ProductMapper.productList", sCategory);
		return list;
	}

	public ProductDTO productRetrieve(String sCode) {
		ProductDTO dto = template.selectOne("ProductMapper.productRetrieve", sCode);
		return dto;
	}

	private int totalRecord(SqlSessionTemplate template) {
		return template.selectOne("ProductMapper.totalRecord");
	}
	
	public PageDTO selectAll(int curPage) {
		PageDTO pDTO = new PageDTO();
		int perPage = pDTO.getPerPage(); 
		int offSet = (curPage-1)*perPage;
		int totalRecord = totalRecord(template);
		
		List<ProductDTO> list = template.selectList("ProductMapper.selectAll",
				null,new RowBounds(offSet, perPage));
		pDTO.setList(list);
		pDTO.setCurPage(curPage);
		pDTO.setTotalRecord(totalRecord);
		return pDTO;
	}

	public void cartAdd(CartDTO dto) {
		int n = template.insert("CartMapper.cartAdd", dto);
		
	}

	public List<CartDTO> cartList(String userid) {
		List<CartDTO> list = template.selectList("CartMapper.cartList", userid);
		return list;
	}

	public void cartUpdate(Map<String, String> map) {
		int n = template.update("CartMapper.cartUpdate", map);
		
	}

	public void cartDelete(int num) {
		int n = template.delete("CartMapper.cartDel", num);
		
	}

	public void delAllCart(ArrayList<String> list) {
		int n = template.delete("CartMapper.cartAllDel", list);
	}

	public CartDTO orderConfirmByNum(int num) {
		CartDTO dto = template.selectOne("CartMapper.cartByNum", num);
		return dto;
	}

	public void orderDone(OrderDTO oDTO) {
		int n = template.insert("CartMapper.orderDone", oDTO);
	}

	public List<CartDTO> orderAllConfirm(List<String> list) {
		List<CartDTO> cList = template.selectList("CartMapper.orderAllConfirm", list);
		return cList;
	}

	public void orderAllDone(ArrayList<String> oList) {
		int n = template.insert("CartMapper.orderAllDone",oList);
	}
}
