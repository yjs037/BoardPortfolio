package com.board.dao;

import java.util.List;

import com.board.vo.BoardVo;
import com.board.vo.Criteria;

public interface BoardDao {
	
	// 페이징 처리동작(Criteria 객체사용)
	public List<BoardVo> listPageCri(Criteria cri) throws Exception;
	
	// DB 테이블 모든 글 갯수 계산 후 리턴
	public int pageCount() throws Exception;
	
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
