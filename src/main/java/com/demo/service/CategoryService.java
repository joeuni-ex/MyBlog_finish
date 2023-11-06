package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.CategoryDAO;
import com.demo.domain.CategoryInfoVO;

@Service
public class CategoryService {

		@Autowired
		private CategoryDAO categoryDAO;
		
		
		//전체 카테고리 리스트 
		public List<CategoryInfoVO> getCategoryList(){
			return categoryDAO.getCategoryList();
		}
}
