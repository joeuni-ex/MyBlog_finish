package com.demo.domain;

import javax.validation.constraints.NotBlank;

public class BoardVO {

	
//	-- 게시글 테이블 
//	create table board(
//		board_idx int AUTO_INCREMENT,
//	    title varchar(500) not null,
//	    content text not null,
//	    user_idx int , -- user_idx 참조 (외래키)
//	    info_idx int, -- info_idx 참조 (외래키)
//		viewCnt int default 0,
//		regDate timestamp not null default now(),
//		primary key(board_idx)	
//	);
	
	private int board_idx; 	//글 번호
	
	@NotBlank(message = "제목을 입력해 주세요.")
	private String title;	//제목
	
	@NotBlank(message = "내용을 입력해 주세요.")
	private String content;	//내용
	
	private int user_idx;	//유저 번호
	private int info_idx;	//카테고리 정보
	private int viewCnt;	//조회수
	private String regDate;	//작성날짜
	
	//게터 세터 
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getInfo_idx() {
		return info_idx;
	}
	public void setInfo_idx(int info_idx) {
		this.info_idx = info_idx;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	
	
	
}
