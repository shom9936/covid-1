package com.itbank.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itbank.vo.ForeignVO;

@Service
public interface ForeignService {

	public List<ForeignVO> getAllList();
	public ForeignVO getInfo(int NationNum);
	public ForeignVO NationNum(int NationNum);
}
