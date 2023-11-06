package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.BoardDAO;
import com.demo.domain.BoardVO;

@Service
public class MainService {
	
	@Autowired
	private BoardDAO boardDAO;
	
	// 전체 게시글 중 최신글 5개(날짜 순)
	public List<BoardVO> recentboardList(){
		return boardDAO.recentboardList();
	}
	
	
	// 전체 게시글 중 인기글 5개(조회수 순)
	public List<BoardVO> popularBoardList(){
		return boardDAO.popularBoardList();
	}
}
