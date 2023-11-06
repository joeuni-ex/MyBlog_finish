package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.ReplyDAO;
import com.demo.domain.ReplyVO;

@Service
public class ReplyService {

	
	@Autowired
	private ReplyDAO replyDAO;
	
	//게시글에 맞는 댓글 목록 조회
	public List<ReplyVO> replyList(int board_idx){
		return replyDAO.replyList(board_idx);
	}
	
	//댓글 작성
	public void replyWrite(ReplyVO writeBean) {
		replyDAO.replyWrite(writeBean);
	}
	
	//댓글 삭제
	public void replyDelete(ReplyVO deleteBean) {
		replyDAO.replyDelete(deleteBean);
	}
	
	//댓글 조회 (수정 시 )
	public ReplyVO searchReply(int reply_idx) {
		return  replyDAO.searchReply(reply_idx);
	}
	
	//댓글 수정 처리
	public void replyModify(ReplyVO modifyBean) {
		replyDAO.replyModify(modifyBean);
	}
}
