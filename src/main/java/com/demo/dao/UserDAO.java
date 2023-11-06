package com.demo.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.demo.domain.LoginUser;
import com.demo.domain.UserVO;

@Repository
public class UserDAO {

	
	@Autowired
	private SqlSessionTemplate sqlTemplate;

	
	//아이디 중복 조회
	public String checkUserID(String user_id) {
		return sqlTemplate.selectOne("user.userId", user_id);
	}
	
	//회원가입 
	public void addUser(UserVO joinUser) {
		sqlTemplate.insert("user.newUser",joinUser);
	}
	
	//로그인
	public LoginUser getLoginUserInfo(LoginUser loginUser) {
		return sqlTemplate.selectOne("user.loginCheck", loginUser);
	}
	
	//회원정보 수정 시 유저 정보 조회
	public UserVO getUserInfo(int user_idx) {
		return sqlTemplate.selectOne("user.userInfo", user_idx);
	}
	
	//회원정보 수정 
	public void modifyUserInfo(UserVO modifyUser) {
		sqlTemplate.update("user.updateUser",modifyUser);
	}
}
