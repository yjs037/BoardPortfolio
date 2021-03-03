package com.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.service.BoardService;
import com.board.service.ReplyService;
import com.board.vo.BoardVo;
import com.board.vo.Criteria;
import com.board.vo.PageMaker;
import com.board.vo.ReplyVo;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Inject
	private BoardService boardService;
	
	@Inject
	private ReplyService replyService;
	
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
		pm.setTotalCount(boardService.pageCount(cri));
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
					@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
	}

	// 게시글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVo boardVo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) throws Exception {

		boardService.write(boardVo);
		rttr.addAttribute("page", 1);//작성 후 1페이지로 이동하게 값 1 전달
		rttr.addAttribute("pageSize", cri.getPageSize());
		
		return "redirect:/board/listPage";
	}

	// 게시글 조회
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, ReplyVo replyVo, Model model) throws Exception {
		
		BoardVo boardVo = boardService.read(bno);
		model.addAttribute("read", boardVo);
		
		//댓글 조회
		List<ReplyVo> replyList = replyService.readReply(boardVo.getBno());
		model.addAttribute("replyList", replyList);
		
		model.addAttribute("countReply", replyService.countReply(bno));
			
		
	}

	// 게시글 수정화면
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyView(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		BoardVo boardVo = boardService.read(bno);
		model.addAttribute("modify", boardVo);
	}

	// 게시글 수정작업
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(BoardVo boardVo, Criteria cri,	RedirectAttributes rttr) throws Exception {
		
		boardService.modify(boardVo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("pageSize", cri.getPageSize());
		rttr.addAttribute("bno", boardVo.getBno());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/read";
	}

	// 게시글 삭제처리
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(BoardVo boardVo, Criteria cri, RedirectAttributes rttr) throws Exception {
		
		boardService.remove(boardVo.getBno());
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("pageSize", cri.getPageSize());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/listPage";
	}
	
	//댓글 작성
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String ReplyWrite(ReplyVo replyVo, Criteria cri, RedirectAttributes rttr) throws Exception {
		
		replyService.writeReply(replyVo);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("pageSize", cri.getPageSize());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("bno", replyVo.getBno());
		
		return "redirect:/board/read";
	}
	
	//댓글 수정화면
	@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
	public String replyUpdateView(ReplyVo replyVo, Criteria cri, Model model) throws Exception {
		
		model.addAttribute("replyUpdate", replyService.selectReply(replyVo.getRno()));
		model.addAttribute("cri", cri);
		
		return "board/replyUpdateView";
	}
	
	//댓글 수정처리
	@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(ReplyVo replyVo, Criteria cri, RedirectAttributes rttr) throws Exception {
		
		replyService.updateReply(replyVo);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("pageSize", cri.getPageSize());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("bno", replyVo.getBno());
		
		return "redirect:/board/read";
	}
	//댓글 삭제 GET
	@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
	public String replyDeleteView(ReplyVo replyVo, Criteria cri, Model model) throws Exception {
						
		model.addAttribute("replyDelete", replyService.selectReply(replyVo.getRno()));
		model.addAttribute("cri", cri);
			
		return "board/replyDeleteView";
		}
	
	//댓글 삭제처리
	@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
	public String replyDelete(ReplyVo replyVo, Criteria cri, RedirectAttributes rttr) throws Exception {
		
		replyService.deleteReply(replyVo);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("pageSize", cri.getPageSize());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("bno", replyVo.getBno());
		
		return "redirect:/board/read";
	}

}