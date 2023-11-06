package com.demo.domain;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;


@Component("sessionUser")
@SessionScope
public class LoginUser {

	
	private int user_idx;
	private String name;
	
	@Size(min=4, max=20,message = "아이디는 4자이상 20자이하로 작성하세요.")
	@Pattern(regexp = "[a-zA-Z0-9]*" ,message = "영문 또는 숫자로 작성하세요.")
	private String user_id;
	
	@Size(min=4, max=20,message = "패스워드는 4자이상 20자이하로 작성하세요.")
	@Pattern(regexp = "[a-zA-Z0-9]*" ,message = "영문 또는 숫자로 작성하세요.")
	private String user_pw;
	
	
	private boolean userLogin;
	
	public LoginUser() {
		this.userLogin = false;
	}

	

	//게터 세터 	

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

	public boolean isUserLogin() {
		return userLogin;
	}

	public void setUserLogin(boolean userLogin) {
		this.userLogin = userLogin;
	}
	
	
	
}
