package com.board.dao;

import java.util.List;

import com.board.vo.BoardVo;

public interface BoardDao {
	
	//목록조회
	public List<BoardVo> list() throws Exception;

	//작성
	public void write(BoardVo boardVo) throws Exception;
		
	//수정 
	public void modify(BoardVo boardVo) throws Exception;
	 
	//삭제 
	public void remove(int bno) throws Exception;
	
	//게시물조회
	public BoardVo read(int bno) throws Exception;



	
	
}
