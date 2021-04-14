package com.board.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.vo.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Inject
	private SqlSession sql;
	
	@Override
	public void register(MemberVo memberVo) throws Exception {
		sql.insert("memberMapper.register", memberVo);

	}

	@Override
	public MemberVo login(MemberVo memberVo) throws Exception {
		return sql.selectOne("memberMapper.login", memberVo);
	}

	@Override
	public void memberUpdate(MemberVo memberVo) throws Exception {
		sql.update("memberMapper.memberUpdate", memberVo);		
	}

	@Override
	public void memberDelete(MemberVo memberVo) throws Exception {
		sql.delete("memberMapper.memberDelete", memberVo);
		
	}

	@Override
	public int passChk(MemberVo memberVo) throws Exception {
		int result = sql.selectOne("memberMapper.passChk", memberVo);
		return result;
	}

	@Override
	public int idChk(MemberVo memberVo) throws Exception {
		int result = sql.selectOne("memberMapper.idChk", memberVo);
		return result; 
	}

}












