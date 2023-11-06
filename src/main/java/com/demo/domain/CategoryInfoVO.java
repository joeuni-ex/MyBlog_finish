package com.demo.domain;

public class CategoryInfoVO {

//	
//	-- 카테고리 테이블(번호, 게시판 이름) 
//	create table category_info(
//		info_idx int AUTO_INCREMENT,      -- 게시판 정보 번호 
//		category_name varchar(500) not null, -- 게시판 이름 
//		primary key(info_idx)
//	);
	
	
	private int info_idx;
	private String category_name;
	
	//게터 세터 설정
	public int getInfo_idx() {
		return info_idx;
	}
	public void setInfo_idx(int info_idx) {
		this.info_idx = info_idx;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
	

}
