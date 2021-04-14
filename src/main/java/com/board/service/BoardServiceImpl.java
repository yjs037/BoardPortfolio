package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.board.dao.BoardDao;
import com.board.vo.BoardVo;
import com.board.vo.Criteria;

//해당 서비스 객체가 자동으로 생성될 수 있도록 @Service를 붙인다. @Repository, @Component 등과 마찬가지로 root-context.xml에 context:component-scan을 지정해 주자.
@Service // 컨트롤러에서 주입해서 쓰기 위함
public class BoardServiceImpl implements BoardService {
	//@Repository를 써서 자동 생성해놓은걸 DI
	@Inject
	private BoardDao dao;

	@Override
	public void write(BoardVo boardVo) throws Exception {
		dao.write(boardVo);
	}
	
	//페이징
	@Override
	public List<BoardVo> listCri(Criteria cri) throws Exception {
		return dao.listPageCri(cri);
	}	
	
	@Override
	public int pageCount(Criteria cri) throws Exception {
		return dao.pageCount(cri);
	}
	

	/*
	 * @Override public List<BoardVo> list() throws Exception { return dao.list(); }
	 */

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVo read(int bno) throws Exception {
		dao.updateViewCnt(bno);
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
