package com.itbank.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itbank.service.MemberService;
import com.itbank.vo.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService service;
	
	// 로그인 버튼을 누를시 loginForm으로 이동 
	@GetMapping("/loginForm")
	public void loginForm() {
		log.info("loginForm");
	}
	
	@PostMapping("/login")
	public String login(String id, String pwd, HttpSession session) {
		log.info("login");
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		MemberVO memberVO = service.login(vo);
		if(memberVO.equals(null)) {
			String message = "아이디 혹은 비밀번호가 일치하지않습니다.";
			log.info("login failed");
			return "member/loginForm";
		}
		
		log.info("login successed");
		session.setAttribute("vo", memberVO);
		session.setAttribute("isLogin", true);
		
		return "index";
	}
	
	// login창에서 회원가입을 누를 시 joinForm으로 이동
	@GetMapping("/joinForm")
	public void joinForm() {
		log.info("joinForm");
	}
	
	// ajax를 활용한 아이디 중복체크 기능
	@PostMapping("/checkID")
	public void checkID(HttpRequest request, HttpServletResponse response, String id) {
		((ServletResponse) request).setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		int result = service.checkID(id);
		boolean check = false;
		if(result == 1) check = true;
		try {
			PrintWriter writer = response.getWriter();
			writer.print(check);
			
		} catch (IOException e) {
			log.info("writer Error");
			e.printStackTrace();
		}
		
	}
	
	@PostMapping("/join")
	public String join(MemberVO vo, Model model, RedirectAttributes rttr) {
		System.out.println("join");
		String pwd = vo.getPwd();
		vo.setPwd(BCrypt.hashpw(pwd, BCrypt.gensalt()));
		int result = service.join(vo);
		if(result > 0) {
			log.info("join successed : " + vo.getId());
			model.addAttribute("joinResult", true);
		}
		else{
			log.info("join failed : " + vo.getId());
			model.addAttribute("joinResult", true);
		}
		return "/member/joinResult";
	}
}
