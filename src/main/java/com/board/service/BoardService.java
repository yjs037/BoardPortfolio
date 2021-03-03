package com.board.service;

import java.util.List;

import com.board.vo.BoardVo;
import com.board.vo.Criteria;

public interface BoardService {
	
	//페이징
	public List<BoardVo> listCri(Criteria cri) throws Exception;
	
	//모든 글 갯수
	public int pageCount(Criteria cri) throws Exception;

	public List<BoardVo> list() throws Exception;

	public void write(BoardVo boardVo) throws Exception;
			
	public void modify(BoardVo boardVo) throws Exception;
 
	public void remove(int bno) throws Exception;
	
	public BoardVo read(int bno) throws Exception;

}
