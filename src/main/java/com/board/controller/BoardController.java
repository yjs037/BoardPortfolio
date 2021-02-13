package com.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.service.BoardService;
import com.board.vo.BoardVo;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Inject
	BoardService boardService;
	
	// 게시판 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {
		
		List<BoardVo> list = boardService.list();
		
		model.addAttribute("list", list);
		
	}
		
	// 게시판 작성화면
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void writeView() throws Exception {
		
	}
	
	// 게시글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVo boardVo) throws Exception {
		
		boardService.write(boardVo);
		
		return "redirect:/board/list";
	}
	
	// 게시글 조회
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, Model model) throws Exception {
			
		BoardVo boardVo = boardService.read(bno);
		
		model.addAttribute("read", boardVo);
	
	}
	
	// 게시글 수정화면
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyView(@RequestParam("bno") int bno, Model model) throws Exception {
		
		BoardVo boardVo = boardService.read(bno);
		
		model.addAttribute("modify", boardVo);			
	}
	
	// 게시글 수정작업
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(BoardVo boardVo) throws Exception {
		
		boardService.modify(boardVo);
				
		return "redirect:/board/read?bno=" + boardVo.getBno();	
	}
	
	// 게시글 삭제
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(@RequestParam("bno") int bno) throws Exception {
		
		boardService.remove(bno);
		
		return "redirect:/board/list";
		
	}

}