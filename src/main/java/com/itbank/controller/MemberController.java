package com.itbank.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	private final MemberService memberService;
	
	// 로그인 버튼을 누를시 loginForm으로 이동 
	// email 전송을 위해 랜덤 문자열 값을 갖고 이동
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
		MemberVO memberVO = memberService.login(vo);
		if(memberVO == null) {
			String message = "아이디 혹은 비밀번호가 일치하지않습니다.";
			log.info("login failed");
			return "member/loginForm";
		}
		
		log.info("login successed");
		session.setAttribute("vo", memberVO); // 세션에 회원 정보 등록
		session.setAttribute("isLogin", true); // 세션에 로그인 여부 정보 등록
		
		return "index";
	}
	
	// logout시 세션에 있는 로그인 정보를 세션 무효화로 제거
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	// login창에서 회원가입을 누를 시 joinForm으로 이동
	@GetMapping("/joinForm")
	public void joinForm(Model model) {
		log.info("joinForm");
		
		String randomString = RandomStringUtils.randomAlphanumeric(5); // 길이가 5인 랜덤 문자열 생성
		model.addAttribute("randomString", randomString);
		
		log.info("random : " + randomString);
	}
	
	private boolean checkGoodID(String id) { // 아이디가 소문자+숫자 조합으로 이루어진지 체크
		for(int i=0; i<id.length(); i++) {
			int temp = id.charAt(i); // 아스키코드 : 48~57 = 0~9 , 97~122 = a~z  
			if(!((temp>=48 && temp<=57) || (temp>=97 && temp<=122))) return false; // 소문자+숫자 조합으로 이루어지지않았다면 false 리턴
		}
		return true; 
	}
	
	// ajax를 활용한 아이디 중복체크 기능
	@PostMapping("/checkID")
	public void checkID(HttpServletRequest request, HttpServletResponse response, String id) throws IOException, UnsupportedEncodingException {
		log.info("checkID");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		log.info("id : " + id);
		
		if(!checkGoodID(id)) { // 아이디가 적합하지 않다면
			writer.print("아이디는 소문자+숫자 조합으로 이루어져야 합니다."); 
			return; // 함수 종료 
		}
		 
		
		int result = memberService.checkID(id); // 아이디 사용 가능 여부 체크
		log.info("result : " + result);
		boolean check = false;
		if(result == 0) check = true; // true : 사용 가능, false : 사용 불가
		log.info("check : " + check);
		
		
		writer.print(check); // 페이지로 아이디 사용 가능 여부 전송

	}
	
	// 회원 가입
	@PostMapping("/join")
	public String join(MemberVO vo, Model model) {
		log.info("join");
		String pwd = vo.getPwd();
		vo.setPwd(BCrypt.hashpw(pwd, BCrypt.gensalt())); // 비밀번호 암호화
		int result = memberService.join(vo);
		if(result > 0) { // 회원가입 성공 시
			log.info("join successed : " + vo.getId());
			model.addAttribute("msg", "회원가입이 완료되었습니다."); // 알림 메시지
			model.addAttribute("check", true); // 성공, 실패 여부
			model.addAttribute("url", "/member/loginForm"); // 알림 메시지를 띄우고 이동할 위치
		}
		else{ // 회원가입 실패 시
			log.info("join failed : " + vo.getId());
			model.addAttribute("msg", "회원가입에 실패했습니다.");
			model.addAttribute("check", false);
		}
		return "/member/result";	// result.jsp : 성공 여부에 따라 msg(message)를 띄우고 url로 이동
		 							// 실패 시 전 페이지로 이동
	}
	
	@GetMapping("/passwordCheck") // 정보 수정 페이지 전 본인 확인을 위한 비밀번호 체크 페이지
	public void passwordCheck() {
		log.info("passwordCheck");
	}
	
	@PostMapping("/checkPWD") // ajax로 비밀번호 체크
	public void checkPWD(HttpServletRequest request, HttpServletResponse response, HttpSession session ,String pwd) throws UnsupportedEncodingException {
		log.info("checkPWD");
		log.info(pwd);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		MemberVO vo = (MemberVO)session.getAttribute("vo"); // session에 저장되어있는 회원 정보를 받아옴
		log.info(vo.getPwd());
		try {
			PrintWriter writer = response.getWriter();
			if(BCrypt.checkpw(pwd, vo.getPwd())) { // 비밀번호가 일치할 시
				writer.print(true);
			} else { // 비밀번호가 불일치할 시
				writer.print(false);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("/updateForm") 
	public void updateForm() { // 회원 정보 수정창으로 이동
		log.info("updateForm");
	}
	
	@PostMapping("/update") // 회원 정보 수정
	public String update(MemberVO vo, HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("vo"); // 세션에서 로그인한 회원 정보 받아오기
		String id = memberVO.getId();
		vo.setId(id); 	// update문 실행을 위해 수정된 정보에 로그인한 회원의 아이디의 정보를 넣는다
						// update로 올때 아이디 정보는 안넘어오기때문. 넘어오도록 설정하면 생략 가능
		int result = memberService.memberUpdate(vo);

		if(result > 0) {
			log.info("update successed");
			model.addAttribute("msg", "정보가 수정되었습니다."); // 알림 메시지
			model.addAttribute("check", true); // 성공, 실패 여부
			model.addAttribute("url", "/index"); // 알림 메시지를 띄우고 이동할 위치
			session.setAttribute("vo", memberService.getInfo(id)); // 수정된 정보를 다시 세션에 입력
		} else {
			log.info("update failed");
			model.addAttribute("msg", "정보 수정에 실패했습니다.");
			model.addAttribute("check", false);
		}
		
		return "/member/result"; // result.jsp : 성공 여부에 따라 msg(message)를 띄우고 url로 이동
								 // 실패 시 전 페이지로 이동
	}
	
	@GetMapping("/deleteGuide")
	public void deleteGuide() { // 회원 탈퇴 주의사항 페이지로 이동
		log.info("deleteGuide");
	}
	
	@GetMapping("/delete") // 회원 탈퇴
	public String delete(HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("vo");
		String id = memberVO.getId();
		
		int result = memberService.memberDelete(id);
		if(result > 0) {
			log.info("member delete successed");
			model.addAttribute("msg", "회원 탈퇴가 완료되었습니다."); // 알림 메시지
			model.addAttribute("check", true); // 성공, 실패 여부
			model.addAttribute("url", "/index"); // 알림 메시지를 띄우고 이동할 위치
			session.invalidate(); // 세션에 저장된 회원 정보 제거
		} else {
			log.info("member delete failed");
			model.addAttribute("msg", "회원 탈퇴에 실패했습니다.");
			model.addAttribute("check", false);
		}
		
		return "/member/result";
	}
	
	// 비밀번호 찾기
	@GetMapping("/findPassword")
	public String findPassword() {
		log.info("findPassword");
		return "/member/findPasswordInputID";
	}
	
}
