package com.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.service.MemberService;
import com.board.vo.MemberVo;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Inject
	MemberService service;

	@Inject
	BCryptPasswordEncoder pwdEncoder;

	// 회원가입 화면
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {

	}

	// 회원가입 처리
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVo memberVo) throws Exception {

		int result = service.idChk(memberVo);

		if (result == 1) {
			return "/member/register";
		} else if (result == 0) {
			String inputPass = memberVo.getUserPass();
			String pwd = pwdEncoder.encode(inputPass);
			memberVo.setUserPass(pwd);

			service.register(memberVo);
		}

		return "redirect:/";
	}

	// 로그인 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVo memberVo, HttpSession session, RedirectAttributes rttr) throws Exception {

		session.getAttribute("member");
		MemberVo login = service.login(memberVo);
		boolean pwdMatch;

		if (login != null) {
			pwdMatch = pwdEncoder.matches(memberVo.getUserPass(), login.getUserPass());
		} else {
			pwdMatch = false;
		}

		if (login != null && pwdMatch == true) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}

		return "redirect:/";
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";
	}

	// 회원정보 수정화면
	@RequestMapping(value = "/memberUpdateView", method = RequestMethod.GET)
	public String updateView() throws Exception {

		return "member/memberUpdateView";
	}

	// 회원정보 수정처리
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String update(MemberVo memberVo, HttpSession session) throws Exception {

		pwdEncoder = new BCryptPasswordEncoder();
		// System.out.println("암호화 전 비밀번호 : " + memberVo.getUserPass());

		String securityPw = pwdEncoder.encode(memberVo.getUserPass());
		memberVo.setUserPass(securityPw);

		// System.out.println("암호화 후 비밀번호 : " + memberVo.getUserPass());

		service.memberUpdate(memberVo);
		session.invalidate();

		return "redirect:/";
	}

	// 회원탈퇴화면
	@RequestMapping(value = "/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception {

		return "member/memberDeleteView";
	}

	// 탈퇴처리
	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVo memberVo, HttpSession session) throws Exception {
		/*
		 * // 세션에 있는 member를 가져와 넣어줌 MemberVo member = (MemberVo)
		 * session.getAttribute("member");
		 * 
		 * // 세션에 있는 비밀번호 String sessionPass = member.getUserPass();
		 * 
		 * // vo로 들어오는 비밀번호 String memberVoPass = memberVo.getUserPass();
		 * 
		 * if(!(sessionPass.equals(memberVoPass))) { return
		 * "redirect:/member/memberDeleteView"; } else { }
		 */

		service.memberDelete(memberVo);
		session.invalidate();

		return "redirect:/";

	}

	// 패스워드 체크
	@ResponseBody
	@RequestMapping(value = "/passChk", method = RequestMethod.POST)
	public boolean passChk(MemberVo memberVo) throws Exception {

		MemberVo login = service.login(memberVo);
		boolean pwdChk = pwdEncoder.matches(memberVo.getUserPass(), login.getUserPass());
		return pwdChk;
	}

	// 아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(MemberVo memberVo) throws Exception {
		int result = service.idChk(memberVo);
		return result;
	}

}
