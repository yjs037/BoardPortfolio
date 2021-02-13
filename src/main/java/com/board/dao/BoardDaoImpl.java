package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.vo.BoardVo;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public void write(BoardVo boardVo) throws Exception {
		sqlSession.insert("boardMapper.insert", boardVo);

	}

	@Override
	public List<BoardVo> list() throws Exception {
		return sqlSession.selectList("boardMapper.list");
				
	}

	@Override
	public BoardVo read(int bno) throws Exception {
		return sqlSession.selectOne("boardMapper.read", bno);
	}

	 @Override 
	 public void modify(BoardVo boardVo) throws Exception {
		 sqlSession.update("boardMapper.modify", boardVo);
			 
	 }
	 
	 @Override 
	 	public void remove(int bno) throws Exception {
		 sqlSession.delete("boardMapper.remove", bno);
	 
	 }
	
	
}
