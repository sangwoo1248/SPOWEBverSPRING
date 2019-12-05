package com.dto;

import java.util.List;

public class PageDTO {
	private int perPage =5; //페이지당 보여줄 갯수
	private int totalRecord;  //전체 레코드갯수
	private int curPage;    //현재 페이지
	private List<ProductDTO> list; //페이지에 보여줄 데이터
	
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public List<ProductDTO> getList() {
		return list;
	}
	public void setList(List<ProductDTO> list) {
		this.list = list;
	}

}
