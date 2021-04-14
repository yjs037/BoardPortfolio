package com.board.dao;

import com.board.vo.MemberVo;

public interface MemberDao {
	
	//회원가입
	public void register(MemberVo memberVo) throws Exception;
	
	//로그인
	public MemberVo login(MemberVo memberVo) throws Exception;
	
	//회원정보수정
	public void memberUpdate(MemberVo memberVo) throws Exception;
	
	//회원탈퇴
	public void memberDelete(MemberVo memberVo) throws Exception;
	
	//패스워드 체크
	public int passChk(MemberVo memberVo) throws Exception;
	
	//아이디 중복체크
	public int idChk(MemberVo memberVo) throws Exception;
}
