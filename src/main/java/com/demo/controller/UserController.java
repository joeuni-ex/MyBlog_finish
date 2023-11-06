package com.demo.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.domain.LoginUser;
import com.demo.domain.UserVO;
import com.demo.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@Resource(name = "sessionUser")
	private LoginUser sessionUser;

	// 로그인
	@GetMapping("/login")
	public String login(@ModelAttribute("loginUser") LoginUser loginUser) {
		return "/user/login";
	}

	// 접근제한로그인
	@GetMapping("/not_login")
	public String not_login() {
		return "/user/not_login";
	}

	// 로그인 처리
	@PostMapping("/login_pro")
	public String login_pro(@Valid LoginUser loginUser, BindingResult result) {
		if (result.hasErrors()) {
			return "user/login";
		}

		// 로그인 검사
		userService.getLoginUserInfo(loginUser);
		if (sessionUser.isUserLogin() == true) {
			return "user/login_success";
		} else {
			return "user/login_fail";
		}

	}

	// 회원가입
	@GetMapping("/join")
	public String getJoin(@ModelAttribute("joinUser") UserVO joinUser) {
		return "/user/join";
	}

	// 회원가입 -post
	@PostMapping("/join_pro")
	public String join_pro(@Valid @ModelAttribute("joinUser") UserVO joinUser, BindingResult result, Model model) {
		// 유효성 검사에서 오류가 나면 회원가입 페이지로 돌아감
		if (result.hasErrors()) {
			return "user/join";
		}
		// 만약 pw와 pw2가 동일하지 않으면 model에 msg 담아서 보냄
		if (!joinUser.getUser_pw().equals(joinUser.getUser_pw2())) {
			model.addAttribute("msg", "비밀번호가 같지 않습니다!");
			return "user/join";
		}
		// 성공 시 join_success로 보냄
		userService.addUser(joinUser);
		return "user/join_success";
	}

	// 회원정보수정 - 회원 정보 조회
	@GetMapping("/modify")
	public String getModify(@ModelAttribute("modifyUser") UserVO modifyUser) {
		userService.getUserInfo(modifyUser);
		return "/user/modify";
	}

	
	// 회원정보수정
	@PostMapping("/modify_pro")
	public String modify_pro(@Valid @ModelAttribute("modifyUser") UserVO modifyUser, 
			BindingResult result,Model model) {
		if (result.hasErrors()) {
			return "user/modify";
		}
		if (!modifyUser.getUser_pw().equals(modifyUser.getUser_pw2())) {
			model.addAttribute("msg", "비밀번호가 같지 않습니다!");
			return "user/modify";
		}
		System.out.println(modifyUser.getUser_idx());
		userService.modifyUserInfo(modifyUser);
		return "user/modify_success";
	}

	// 로그아웃
	@GetMapping("/logout")
	public String getLogout() {
		sessionUser.setUserLogin(false);
		return "/user/logout";
	}
}
