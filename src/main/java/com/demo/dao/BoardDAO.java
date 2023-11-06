package com.demo.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.demo.domain.BoardVO;
import com.demo.domain.ContentView;

@Repository
public class BoardDAO {

	
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	
	//게시글 전체 목록(페이지네이션 추가)
	public List<BoardVO> boardList(int info_idx,RowBounds rowBounds ){
		return sqlTemplate.selectList("board.boardList",info_idx,rowBounds);
	}
	//페이지네이션 계산
	public int getContentCnt(int info_idx) {
		return sqlTemplate.selectOne("board.contentCnt", info_idx);
	}
	
	// 새 글 작성
	public void boardWrite(BoardVO boardWrtie) {
		sqlTemplate.insert("board.boardWrtie", boardWrtie);
	}
	// 카테고리 이름 
	public String categoryName(int info_idx) {
		return sqlTemplate.selectOne("board.getCategoryName", info_idx);
	}
	
	//게시글 상세 보기
	public ContentView getContentInfo(int board_idx) {
		return sqlTemplate.selectOne("board.getContentView", board_idx);
	}
	
	//게시글 수정 처리 
	public void modifyContent(BoardVO modifyBean) {
		sqlTemplate.update("board.updateContent", modifyBean);
	}
	
	//게시글 삭제 처리
	public void deleteContent(int board_idx) {
		sqlTemplate.delete("board.deleteContent", board_idx);
	}
	
	//조회수 증가
	public void viewCnt(int board_idx) {
		sqlTemplate.update("board.viewCnt", board_idx);
	}
	
	//전체 게시글에서 최근글 5개
	public List<BoardVO> recentboardList(){
		return sqlTemplate.selectList("board.recentboardList");
	}
	
	//인기글 5개
	public List<BoardVO> popularBoardList(){
		return sqlTemplate.selectList("board.popularBoardList");
	}
}
