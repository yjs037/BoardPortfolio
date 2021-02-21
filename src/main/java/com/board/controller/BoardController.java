package com.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.service.BoardService;
import com.board.vo.BoardVo;
import com.board.vo.Criteria;
import com.board.vo.PageMaker;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	BoardService boardService;

	// 페이징
	@RequestMapping(value = "/listCri", method = RequestMethod.GET)
	public String listCri(Criteria cri, Model model) throws Exception {
		model.addAttribute("cri", boardService.listCri(cri));
		return "/board/listPage";
	}

	@RequestMapping(value = "listPage", method = RequestMethod.GET)
	public void listPage(Criteria cri, Model model) throws Exception {
		model.addAttribute("cri", boardService.listCri(cri));

		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(boardService.pageCount());

		model.addAttribute("pm", pm);
	}

	  // 게시판 목록
	  
	  @RequestMapping(value = "/list", method = RequestMethod.GET) 
	  public void getList(Model model) throws Exception {
	  
	  List<BoardVo> list = boardService.list();
	  
	  model.addAttribute("list", list);
	  
	  }
	 

	// 게시판 작성화면
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void writeView(BoardVo boardVo,
					@ModelAttribute("cri") Criteria cri,
					Model model) throws Exception {
		logger.info("register get.....");
	}

	// 게시글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVo boardVo,
						@ModelAttribute("cri") Criteria cri,
						RedirectAttributes rttr) throws Exception {

		boardService.write(boardVo);
		rttr.addAttribute("page", 1);//작성 후 1페이지로 이동하게 값 1 전달
		rttr.addAttribute("pageSize", cri.getPageSize());
		
		return "redirect:/board/listPage";
	}

	// 게시글 조회
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno,
					 @ModelAttribute("cri") Criteria cri,
					 Model model) throws Exception {
		BoardVo boardVo = boardService.read(bno);
		model.addAttribute("read", boardVo);

	}

	// 게시글 수정화면
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyView(@RequestParam("bno") int bno,
						   @ModelAttribute("cri") Criteria cri,
						   Model model) throws Exception {
		BoardVo boardVo = boardService.read(bno);
		model.addAttribute("modify", boardVo);
	}

	// 게시글 수정작업
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(BoardVo boardVo,
						 Criteria cri,
						 RedirectAttributes rttr) throws Exception {

		boardService.modify(boardVo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("pageSzie", cri.getPageSize());
		rttr.addAttribute("bno", boardVo.getBno());
		return "redirect:/board/read";
	}

	// 게시글 삭제
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(@RequestParam("bno") int bno,
						 Criteria cri,
						 RedirectAttributes rttr) throws Exception {
		boardService.remove(bno);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("pageSize", cri.getPageSize());
		return "redirect:/board/listPage";
	}

}