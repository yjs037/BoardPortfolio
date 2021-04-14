package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.vo.BoardVo;
import com.board.vo.Criteria;
//@Repository : 자동 객체 생성 특히, dao를 지칭하는 말이기도함(스프링이 알아서 관리해주게됨) : 이게 자동으로 생성되려면 설정파일에서 <context:component-scan 지정필요
@Repository
public class BoardDaoImpl implements BoardDao {
	
	// 설정파일에서 생성한 sqlSessionTemplate 객체를 자동 주입한다.(Autowired, Resource 와 유사함)
	@Inject
	private SqlSession sqlSession;

	@Override
	public void write(BoardVo boardVo) throws Exception {
		sqlSession.insert("boardMapper.insert", boardVo);
	}

	@Override
	public List<BoardVo> listPageCri(Criteria cri) throws Exception {
		return sqlSession.selectList("boardMapper.listPageCri", cri);
	}
	
	@Override
	public int pageCount(Criteria cri)throws Exception {
		return sqlSession.selectOne("boardMapper.pageCount",cri);
	}
	
	/*
	 * @Override public List<BoardVo> list() throws Exception { return
	 * sqlSession.selectList("boardMapper.list"); }
	 */

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

	@Override
	public void updateViewCnt(int bno) throws Exception {
		sqlSession.update("boardMapper.updateViewCnt", bno);
		
	}

}

