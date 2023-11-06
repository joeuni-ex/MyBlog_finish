package com.demo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.demo.domain.CategoryInfoVO;

@Repository
public class CategoryDAO {

	@Autowired
	private SqlSessionTemplate sqlTemplate;
	
	//전체 카테고리 리스트 출력
	public List<CategoryInfoVO> getCategoryList(){
		return sqlTemplate.selectList("category.categoryList");
	}
}
