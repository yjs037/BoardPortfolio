package com.board.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.MemberDao;
import com.board.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDao dao; 
	
	@Override
	public void register(MemberVo memberVo) throws Exception {
		dao.register(memberVo);
	}

	@Override
	public MemberVo login(MemberVo memberVo) throws Exception {
		return dao.login(memberVo);
	}

	@Override
	public void memberUpdate(MemberVo memberVo) throws Exception {
		dao.memberUpdate(memberVo);
		
	}

	@Override
	public void memberDelete(MemberVo memberVo) throws Exception {
		dao.memberDelete(memberVo);
		
	}

	@Override
	public int passChk(MemberVo memberVo) throws Exception {
		int result = dao.passChk(memberVo);
		return result;
	}

	@Override
	public int idChk(MemberVo memberVo) throws Exception {
		int result = dao.idChk(memberVo);
		return result;
	}

}
