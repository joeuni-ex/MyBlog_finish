package com.demo.domain;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class UserVO {

	
//	-- 사용자 테이블 
//	create table user(
//		user_idx int AUTO_INCREMENT,
//	    name varchar(50) not null,
//	    user_id varchar(100) not null,
//	    user_pw varchar(100) not null,
//	    primary key(user_idx)
//	);
	
	
	private int user_idx;
	
	@Size(min=2, max=4 , message = "이름은 2~4자로 입력해 주세요")
	@Pattern(regexp = "[가-힣]*" ,message ="이름은 한글로 작성해 주세요")
	private String name;
	
	@Size(min=4, max=20 , message = "아이디는 4자이상 20자이하 입니다.")
	@Pattern(regexp = "[a-zA-Z0-9]*" ,message ="영문 또는 숫자로 입력해 주세요")
	private String user_id;
	
	@Size(min=4, max=20 , message = "비밀번호는 4자이상 20자이하 영문 또는 숫자")
	@Pattern(regexp = "[a-zA-Z0-9]*" ,message ="영문 또는 숫자로 입력해 주세요")
	private String user_pw;
	
	@Size(min=4, max=20 , message = "비밀번호는 4자이상 20자이하 영문 또는 숫자")
	@Pattern(regexp = "[a-zA-Z0-9]*" ,message ="영문 또는 숫자로 입력해 주세요")
	private String user_pw2;
	
	@AssertTrue(message = "아이디 중복 체크 해주세요.")
	private boolean userIdChecked;
	
	//기본 생성자 -처음 들어가면 userIdCheck false
	public UserVO() {
		this.userIdChecked=false;
	}
	
	

	//게터 세터 	

	public boolean isUserIdChecked() {
		return userIdChecked;
	}



	public void setUserIdChecked(boolean userIdChecked) {
		this.userIdChecked = userIdChecked;
	}



	public String getUser_pw2() {
		return user_pw2;
	}
	public void setUser_pw2(String user_pw2) {
		this.user_pw2 = user_pw2;
	}

	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	
	
	
}
