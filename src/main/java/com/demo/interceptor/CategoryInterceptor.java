package com.demo.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.demo.domain.LoginUser;
import com.demo.service.CategoryService;

public class CategoryInterceptor implements HandlerInterceptor{
	
	private CategoryService categoryService;
	
	@Resource(name = "sessionUser")
	private LoginUser sessionUser;

	public CategoryInterceptor(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handeler) {
		request.setAttribute("categoryList", categoryService.getCategoryList());
		request.setAttribute("sessionUser", sessionUser);
		
		return true;
	}
	
}
