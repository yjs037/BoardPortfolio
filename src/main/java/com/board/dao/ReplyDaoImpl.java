package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.vo.ReplyVo;

@Repository
public class ReplyDaoImpl implements ReplyDao {
	
	@Inject
	private SqlSession sql;
	
	//조회
	@Override
	public List<ReplyVo> readReply(int bno) throws Exception {
		return sql.selectList("replyMapper.readReply", bno);
	}

	//작성
	@Override
	public void writeReply(ReplyVo replyVo) throws Exception {
		sql.insert("replyMapper.writeReply", replyVo);
		
	}

	@Override
	public void updateReply(ReplyVo replyVo) throws Exception {
		sql.update("replyMapper.updateReply", replyVo);		
	}

	@Override
	public void deleteReply(ReplyVo replyVo) throws Exception {
		sql.delete("replyMapper.deleteReply", replyVo);		
	}

	@Override
	public ReplyVo selectReply(int rno) throws Exception {
		return sql.selectOne("replyMapper.selectReply", rno);
	}

	@Override
	public int countReply(int bno) throws Exception {
		return sql.selectOne("replyMapper.countReply", bno);
	}

}












