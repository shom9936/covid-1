package com.itbank.controller;

import org.mindrot.jbcrypt.BCrypt;
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
	
	// login창에서 회원가입을 누를 시 joinForm으로 이동
	@GetMapping("/joinForm")
	public void joinForm() {
		log.info("joinForm");
		System.out.println("joinForm");
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
		return "member/joinResult";
	}
}
