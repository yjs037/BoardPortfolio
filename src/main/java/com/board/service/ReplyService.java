package com.board.service;

import java.util.List;

import com.board.vo.ReplyVo;

public interface ReplyService {

	//조회
	public List<ReplyVo> readReply(int bno) throws Exception;
	
	//작성
	public void writeReply(ReplyVo replyVo) throws Exception;
	
	// 수정
	public void updateReply(ReplyVo replyVo) throws Exception;
	
	// 삭제
	public void deleteReply(ReplyVo replyVo) throws Exception;
	
	// 댓글 조회
	public ReplyVo selectReply(int rno) throws Exception;
	
	// 댓글 갯수
	public int countReply(int bno) throws Exception;
}
