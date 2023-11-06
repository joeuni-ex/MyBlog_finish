package com.demo.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.demo.dao.BoardDAO;
import com.demo.domain.BoardVO;
import com.demo.domain.ContentView;
import com.demo.domain.LoginUser;
import com.demo.domain.PageBean;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class BoardService {

	
	@Autowired
	private BoardDAO boardDAO;
	
	// 프로퍼티에서 가져오는 값
	@Value("${page.listcnt}")
	private int page_listcnt;
	
	@Value("${page.paginationcnt}")
	private int page_paginationcnt;


	
	//로그인 정보를 담고있는 객체 이름으로 주입
	@Resource(name = "sessionUser")
	private LoginUser sessionUser;
	
	// 게시글 목록 출력(페이지네이션 추가)
	public List<BoardVO> boardList(int info_idx,int page){
		//페이지네이션
		//시작인덱스 = (페이지번호 -1) *10
		int start = (page-1)*page_listcnt;
		
		//myBatis의 rowBounds클래스를 사용하여 가져올 글 시작 번호 , 가져올 개수로 설정
		RowBounds rowBounds = new RowBounds(start,page_listcnt);
		//mapper에서 처리하도록 rowBounds 객체를 매개변수로 추가
		return boardDAO.boardList(info_idx,rowBounds);
	}
	
	//페이지네이션 계산
	public PageBean getContentCnt(int info_idx,int curentPage) {
		//게시판 별로 게시글 개수를 가져옴
		int content_cnt = boardDAO.getContentCnt(info_idx);
		
		PageBean pageBean = new PageBean(content_cnt, curentPage, page_listcnt, page_paginationcnt);
		return pageBean;
	}
	
	// 새 글 작성
	public void boardWrite(BoardVO writeBean) {
		writeBean.setUser_idx(sessionUser.getUser_idx());
		boardDAO.boardWrite(writeBean);
	}
	// 카테고리 이름 
	public String categoryName(int info_idx) {
		return boardDAO.categoryName(info_idx);
	}
	
	// 글 상세보기 + 조회수 증가 
	public ContentView getContentInfo(int board_idx) {
		boardDAO.viewCnt(board_idx);
		return boardDAO.getContentInfo(board_idx);
	}
	
	// 수정 전 게시글 정보 가져오기 
	public void getContents(BoardVO modifyBean)	{
	ContentView temp = boardDAO.getContentInfo(modifyBean.getBoard_idx());
	modifyBean.setTitle(temp.getTitle());
	modifyBean.setContent(temp.getContent());
	
	}
	
	//글 수정 처리하기 
	public void modifyContent(BoardVO modifyBean) {
		boardDAO.modifyContent(modifyBean);
	}
	
	//글 삭제 처리하기
	public void deleteContent(int board_idx) {
		boardDAO.deleteContent(board_idx);
	}
}
