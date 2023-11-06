package com.demo.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.demo.dao.UserDAO;
import com.demo.domain.LoginUser;
import com.demo.domain.UserVO;

@Service
public class UserService {

	
	@Autowired
	private UserDAO userDAO;
	
	@Resource(name = "sessionUser")//이름으로 객체 주입
	private LoginUser sessionUser;
	
	
	//아이디 중복 검사 
	public boolean checkUserIdExist(String user_id) {
		String user_name = userDAO.checkUserID(user_id);
		//userDao에 user_id를 넣어서 name을 가져옴 
		if(user_name==null) {
			return true;
		}
		else {
			return false;
		}
	}
	
	//회원가입 
	public void addUser(UserVO joinUser) {
		userDAO.addUser(joinUser);
	}
	
	//로그인 처리(체크)
	public void getLoginUserInfo(LoginUser loginUser) {
		//DB에서 로그인 유저 정보를 가져옴
		LoginUser tempLoginUser = userDAO.getLoginUserInfo(loginUser);
		//로그인 유저 정보가 있으면 그 정보를 sessionUser에 idx와 name을 저장하고 성공으로 저장
		if(tempLoginUser !=null) {
			sessionUser.setUser_idx(tempLoginUser.getUser_idx());
			sessionUser.setName(tempLoginUser.getName());
			sessionUser.setUserLogin(true);
		}
	}
	
	
	//회원정보 수정 시 유저 정보 조회
	public void getUserInfo(@ModelAttribute("modifyUser") UserVO modifyUser) {
		
		UserVO temp = userDAO.getUserInfo(sessionUser.getUser_idx());
		
		modifyUser.setName(temp.getName());
		modifyUser.setUser_id(temp.getUser_id());
		modifyUser.setUser_idx(temp.getUser_idx());
	}
	
	//회원정보 수정 
	public void modifyUserInfo(UserVO modifyUser) {
		userDAO.modifyUserInfo(modifyUser);
	}
}
