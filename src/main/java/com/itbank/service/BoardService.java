package com.itbank.service;

import java.util.List;

import com.itbank.vo.BoardVO;
import com.itbank.vo.Pagination;

public interface BoardService {

	public Long register(BoardVO board);
	
	public BoardVO get(Long no);
	
	public int modify(BoardVO board);
	
	public int remove(Long no);
	
	public List<BoardVO> getAllList();
	
	public List<BoardVO> getNoticeList();
	
	public List<BoardVO> getDocumentsList();
	
	public List<BoardVO> getDetailPage(String boardvalues);
	
	public int countBoard();
	
	public List<BoardVO> mainBoard(Pagination pagination) throws Exception;
	
	public List<BoardVO> detailBoard(int boardvalues);
	
	public void insertBoard(BoardVO boardVO) throws Exception;
	
	public BoardVO getBoardContent(Long no) throws Exception;
	
	public int getBoardListCnt() throws Exception;
	
}
