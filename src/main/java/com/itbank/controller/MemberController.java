package com.itbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@GetMapping("/loginForm")
	public String loginForm() {
		log.info("loginForm");
		return "loginForm";
	}
	
	@GetMapping("/joinForm")
	public String joinForm() {
		log.info("joinForm");
		return "joinForm";
	}
	
	@PostMapping("/join")
	public String join(MemberVO vo) {
		int result = service.join(vo);
		if(result > 0) log.info("join successed : " + vo.getId());
		else log.info("join failed : " + vo.getId());
		return "joinResult";
	}
}
