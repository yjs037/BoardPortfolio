package com.board.dao;

import java.util.List;

import com.board.vo.ReplyVo;

public interface ReplyDao {
	
	// 댓글 조회
	public List<ReplyVo> readReply(int bno) throws Exception;
	
	// 댓글 작성
	public void writeReply(ReplyVo replyVo) throws Exception;
	
	// 댓글 수정
	public void updateReply(ReplyVo replyVo) throws Exception;
	
	// 댓글 삭제
	public void deleteReply(ReplyVo replyVo) throws Exception;
	
	// 선택된 댓글 조회
	public ReplyVo selectReply(int rno) throws Exception;
	
	// 댓글 갯수
	public int countReply(int bno) throws Exception;

}
