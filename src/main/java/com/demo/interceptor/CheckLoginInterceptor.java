package com.demo.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.demo.domain.LoginUser;

public class CheckLoginInterceptor implements HandlerInterceptor{

	
	@Resource(name = "sessionUser")
	private LoginUser sessionUser;
	

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handeler) throws Exception {
		if(sessionUser.isUserLogin()==false) {
			request.setAttribute("sessionUser", sessionUser);
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/user/not_login");
			return false;
		}
		
		return true;
	}
}

