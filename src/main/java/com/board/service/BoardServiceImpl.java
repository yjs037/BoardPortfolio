package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.BoardDao;
import com.board.vo.BoardVo;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDao dao;

	@Override
	public void write(BoardVo boardVo) throws Exception {
		dao.write(boardVo);
	}

	@Override
	public List<BoardVo> list() throws Exception {
		return dao.list();
	}

	@Override
	public BoardVo read(int bno) throws Exception {
		return dao.read(bno);
	}

	@Override
	public void modify(BoardVo boardVo) throws Exception {
		dao.modify(boardVo);	
	}

	@Override
	public void remove(int bno) throws Exception {
		dao.remove(bno);
	}
		
}
