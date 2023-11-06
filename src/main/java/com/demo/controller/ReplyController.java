package com.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.domain.ReplyVO;
import com.demo.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private ReplyService replyService;

	//댓글 작성
	@PostMapping("/write_pro")
	public String writeReply_pro(ReplyVO writeBean) {
		
		replyService.replyWrite(writeBean);
		
		return "redirect:/board/view?info_idx="+ writeBean.getInfo_idx() +"&board_idx="+ writeBean.getBoard_idx();
	}
	
	//댓글 수정
	@PostMapping("/modify_pro")
	public String modifyReply(@RequestParam("board_idx") int board_idx,
							  @RequestParam("info_idx") int info_idx,
							  @RequestParam("reply_idx") int reply_idx,
							  ReplyVO modifyBean) {
		
		modifyBean.setBoard_idx(board_idx);
		modifyBean.setReply_idx(reply_idx);
		replyService.replyModify(modifyBean);
		
		return "redirect:/board/view?info_idx="+ info_idx +"&board_idx="+ board_idx;
	}
	
	//댓글 삭제
	@GetMapping("/delete")
	public String replyDelete(@RequestParam("board_idx") int board_idx,
							  @RequestParam("info_idx") int info_idx,
							  @RequestParam("reply_idx") int reply_idx,
			ReplyVO deleteBean) {
		deleteBean.setBoard_idx(board_idx);
		deleteBean.setReply_idx(reply_idx);
		replyService.replyDelete(deleteBean);
		return "redirect:/board/view?info_idx="+ deleteBean.getInfo_idx() +"&board_idx="+ deleteBean.getBoard_idx();
	}

}
