package com.demo.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.domain.BoardVO;
import com.demo.domain.LoginUser;
import com.demo.domain.PageBean;
import com.demo.service.BoardService;
import com.demo.service.ReplyService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ReplyService replyService;
	
	@Resource(name = "sessionUser" )
	private LoginUser sessionUser;
	
	//글 목록 출력 (페이지네이션)
	@GetMapping("/list")
	public String getlist(@RequestParam("info_idx")int info_idx,
						  @RequestParam(value = "page",defaultValue = "1")int page,
						Model model) {
		model.addAttribute("info_idx", info_idx);
		model.addAttribute("category", boardService.categoryName(info_idx));
		model.addAttribute("list", boardService.boardList(info_idx,page));
	
		//페이지네이션 계산
		PageBean pageBean = boardService.getContentCnt(info_idx, page);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("page", page);
		return "board/list";
	}
	
	//글 상세 보기
	@GetMapping("/view")
	public String getView(@RequestParam("board_idx")int board_idx,
						  @RequestParam("info_idx")int info_idx,
						  @RequestParam(value = "page",defaultValue = "1")int page,
						  @RequestParam(value = "modify",defaultValue = "false") String modify,
						  @RequestParam(value = "reply_idx",defaultValue = "0") int reply_idx,
						  Model model) {
		model.addAttribute("content", boardService.getContentInfo(board_idx));
		model.addAttribute("info_idx",info_idx);
		model.addAttribute("board_idx", board_idx);
		model.addAttribute("sessionUser", sessionUser);
	
		model.addAttribute("page", page);
		//댓글 리스트 조회
		model.addAttribute("replyList", replyService.replyList(board_idx));
		//수정 여부
		model.addAttribute("modify", modify);
		model.addAttribute("reply_idx", reply_idx);
		model.addAttribute("searchReply", replyService.searchReply(reply_idx));//수정할 댓글 조회
		
		return "board/view";
	}
	
	// 글 작성 
	@GetMapping("/write")
	public String getWrite( @ModelAttribute("writeBean") BoardVO writeBean) {
		return "board/write";
	}
	// 글 작성 처리
	@PostMapping("write_pro")
	public String write_pro(@Valid @ModelAttribute("writeBean") BoardVO writeBean,BindingResult result,
			Model model) {
		if(result.hasErrors()) {
			return "board/write";
		}
		boardService.boardWrite(writeBean);
		model.addAttribute("info_idx",writeBean.getInfo_idx());
		return "board/write_success";
	}
	
	
	//수정페이지 - 수정 전 게시글 정보 가져오기 
	@GetMapping("/modify")
	public String getModify(@RequestParam("info_idx")int info_idx,
							@RequestParam("board_idx")int board_idx,
							@ModelAttribute("modifyBean") BoardVO modifyBean,
							@RequestParam(value = "page",defaultValue = "1")int page,
							Model model) {
		modifyBean.setInfo_idx(info_idx);
		modifyBean.setBoard_idx(board_idx);
		boardService.getContents(modifyBean);
		model.addAttribute("modifyBean", modifyBean);	
		
		model.addAttribute("page", page);
		
		return "board/modify";
	}
	
	//글 수정 처리
	@PostMapping("/modify_pro")
	public String modify_pro(@Valid @ModelAttribute("modifyBean") BoardVO modfyBean,
							@RequestParam(value = "page",defaultValue = "1")int page,
							 Model model,BindingResult result) {
		
		model.addAttribute("page", page);
		
		if(result.hasErrors()) {
			return "board/modify";
		}
		
		boardService.modifyContent(modfyBean);
		model.addAttribute("info_idx", modfyBean.getInfo_idx());
		return "board/modify_success";
	}
	
	//글 삭제 처리
	@GetMapping("/delete")
	public String getDelete(@RequestParam("info_idx") int info_idx,
							@RequestParam("board_idx")int board_idx,Model model) {
		boardService.deleteContent(board_idx);
		model.addAttribute("info_idx", info_idx);
		return "board/delete";
	}
	
	
}
