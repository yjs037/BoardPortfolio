package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.ReplyDao;
import com.board.vo.ReplyVo;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDao dao;
	
	@Override
	public List<ReplyVo> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}

	@Override
	public void writeReply(ReplyVo replyVo) throws Exception {
		dao.writeReply(replyVo);
		
	}

	@Override
	public void updateReply(ReplyVo replyVo) throws Exception {
		dao.updateReply(replyVo);	
	}

	@Override
	public void deleteReply(ReplyVo replyVo) throws Exception {
		dao.deleteReply(replyVo);
	}

	@Override
	public ReplyVo selectReply(int rno) throws Exception {
		return dao.selectReply(rno);
	}

	@Override
	public int countReply(int bno) throws Exception {
		return dao.countReply(bno);
	}

}
