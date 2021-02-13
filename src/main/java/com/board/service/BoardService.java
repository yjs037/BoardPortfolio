package com.board.service;

import java.util.List;

import com.board.vo.BoardVo;

public interface BoardService {

	public List<BoardVo> list() throws Exception;

	public void write(BoardVo boardVo) throws Exception;
			
	public void modify(BoardVo boardVo) throws Exception;
 
	public void remove(int bno) throws Exception;
	
	public BoardVo read(int bno) throws Exception;
	
}
