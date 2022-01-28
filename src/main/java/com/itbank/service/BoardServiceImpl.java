package com.itbank.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itbank.mapper.BoardMapper;
import com.itbank.vo.BoardVO;
import com.itbank.vo.Pagination;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	private final BoardMapper mapper;
	
	@Override
	public Long register(BoardVO board) {
		log.info("register......" + board);
		mapper.insertSelectKey(board);
		
		return board.getNo();
	}

	@Override
	public BoardVO get(Long no) {
		log.info("NO :" + no);
		log.info("==================================================");
		
		return mapper.read(no);
	}

	@Override
	public int modify(BoardVO board) {
		return mapper.update(board);
	}

	@Override
	public int remove(Long no) {
		return mapper.delete(no);
	}

	@Override
	public List<BoardVO> getAllList() {
		return mapper.getAllList();
	}

	@Override
	public List<BoardVO> getNoticeList() {
		return mapper.getNoticeList();
	}

	@Override
	public List<BoardVO> getDocumentsList() {
		return mapper.getDocumentsList();
	}

	@Override
	public List<BoardVO> getDetailPage(String detailPage) {
		return mapper.getDetailPage(detailPage);
	}

	@Override
	public int countBoard() {
		return mapper.countBoard();
	}

	@Override
	public List<BoardVO> mainBoard(Pagination pagination) throws Exception {
		log.info("start : " + pagination.getStartPage() +" , end : "+ pagination.getEndPage());
		return mapper.mainBoard(pagination);
	}

	/*
	 * public List<BoardVO> detailBoard() { return mapper.detailBoard(); }
	 */

	@Override
	public List<BoardVO> detailBoard(int boardvalues) {
		return mapper.detailBoard(boardvalues);
	}

	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		mapper.insert(boardVO);
	}

	
	@Transactional
	@Override
	public BoardVO getBoardContent(Long no) throws Exception {
		BoardVO vo = new BoardVO();
		
		mapper.updateViewCnt(no);
		vo = mapper.read(no);
//		try {
//			vo.setNo(no);
//			vo.setBoardvalues("1111111111111111111111111111111111111111111");
//			mapper.update(vo);
//		}catch(RuntimeException e) {
//			throw new NotFoundException(null);
//		}
		return vo;
		
	}

	@Override
	public int getBoardListCnt() throws Exception {
		
		return mapper.getBoardListCnt();
	}



}
