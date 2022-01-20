package com.itbank.mapper;

import java.util.List;

import com.itbank.vo.BoardVO;
import com.itbank.vo.Pagination;

public interface BoardMapper {

	List<BoardVO> getAllList();
	
	List<BoardVO> getNoticeList();
	
	List<BoardVO> getDocumentsList();
	
	List<BoardVO> getDetailPage(String boardvalues);
	
	void insert(BoardVO vo);
	
	void insertSelectKey(BoardVO vo);
	
	BoardVO read(Long no);
	
	int delete(Long no);
	
	int update(BoardVO vo);
	
	public int countBoard();
	
	public List<BoardVO> mainBoard(Pagination Pagination) throws Exception;
	
	public List<BoardVO> detailBoard(int boardvalues);
	
	void updateViewCnt(Long no);
	
	int getBoardListCnt() throws Exception;


	
}
