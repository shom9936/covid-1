package com.itbank.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itbank.service.BoardService;
import com.itbank.vo.BoardVO;
import com.itbank.vo.Pagination;
import com.itbank.vo.PagingVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
@RequiredArgsConstructor
public class BoardController {

	private final BoardService service;

	// 전체 게시판(페이징 처리)
	@GetMapping("/boardList")
	public void boardList(Model model
			,@RequestParam(required = false, defaultValue = "1") int page
			,@RequestParam(required = false, defaultValue = "1") int range
			) throws Exception{
		//전체 게시글 개수
		int listCnt = service.getBoardListCnt();
		
		
		//Pagination 객체생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("boardList", service.mainBoard(pagination));
		
		log.info("/boardList.........................");
		log.info("start : " + pagination.getStartPage() +" , end : "+ pagination.getEndPage() + " rangeSize : " + pagination.getRangeSize());
	}
	
	//세부게시판 페이징 처리
	@GetMapping("/boardDetail")
	public void boardDetail(Model model
		,@RequestParam(value="boardvalues", required=false)int boardvalues){
			List<BoardVO> list = service.detailBoard(boardvalues);
			model.addAttribute("viewAll", list);
			log.info(list);
			log.info(boardvalues);
		}
	
	// 글 작성
	@GetMapping("/boardForm")
	public void boardForm(@ModelAttribute("boardVO") BoardVO vo, Model model) {
		
	}
	
	// 게시글 저장
	@PostMapping("/saveBoard")
	public String saveBoard(@ModelAttribute("BoardVO") BoardVO boardVO,@RequestParam("mode") String mode,
			RedirectAttributes rttr) throws Exception{
		if(mode.equals("edit")) {
			service.modify(boardVO);
		}else {
			service.insertBoard(boardVO);
		}
		return "redirect:/board/boardList";
	}
	
	// 게시글 상세조회
	@GetMapping("/getBoardContent")
	public void getBoardContent(Model model, @RequestParam("no") Long no) throws Exception{
		model.addAttribute("boardContent", service.getBoardContent(no));
	}
	
	// 게시글 수정
	@GetMapping("/editForm")
	public String editForm(@RequestParam("no") Long no, @RequestParam("mode") String mode, Model model) throws Exception{
		model.addAttribute("boardContent", service.getBoardContent(no));
		model.addAttribute("mode", mode);
		model.addAttribute("boardVO", new BoardVO());
		
		return "board/boardForm";
	}

	// 게시글 삭제
	@GetMapping("/deleteBoard")
	public String deleteBoard(RedirectAttributes rttr, @RequestParam("no") Long no) {
		service.remove(no);
		return "redirect:/board/boardList";
	}
	
//	@ExceptionHandler(RuntimeException.class)
//	public String exceptionHandler(Model model, Exception e) {
//		log.info("exception : " + e.getMessage());
//		model.addAttribute("exception", e);
//		
//		return "error/exception";
//	}
	
}
