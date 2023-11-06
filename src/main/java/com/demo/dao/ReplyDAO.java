package com.demo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.demo.domain.ReplyVO;

@Repository
public class ReplyDAO {

	
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	
	//게시글에 맞는 댓글 목록 조회
	public List<ReplyVO> replyList(int board_idx){
		return sqlTemplate.selectList("reply.replyList",board_idx);
	}
	
	//댓글 작성 
	public void replyWrite(ReplyVO wirteBean) {
	 sqlTemplate.insert("reply.replyWrite", wirteBean); 
	 }
	
	//댓글 삭제
	public void replyDelete(ReplyVO deleteBean) {
		sqlTemplate.delete("reply.replyDelete", deleteBean);
	}
	
	//댓글 조회(수정 시)
	public ReplyVO searchReply(int reply_idx) {
		return sqlTemplate.selectOne("reply.searchReply", reply_idx);
	}
	
	//댓글 수정 처리
	public void replyModify(ReplyVO modifyBean) {
		sqlTemplate.update("reply.relpyUpdate", modifyBean);
	}
}
