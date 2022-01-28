package com.itbank.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itbank.mapper.ForeignMapper;
import com.itbank.vo.ForeignVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class ForeignServiceImpl implements ForeignService{
	
	private final ForeignMapper mapper;
	
	@Override
	public List<ForeignVO> getAllList() {
		log.info("정보 전체 조회");
		return mapper.getAllList();
		
	}

	@Override
	public ForeignVO getInfo(int NationNum) {
		// TODO Auto-generated method stub
		log.info("정보 단건 조회");
		return mapper.getInfo(NationNum);

	}

	@Override
	public ForeignVO NationNum(int NationNum) {
		// TODO Auto-generated method stub
		log.info("국가 번호 조회");
		return mapper.NationNum(NationNum);
	}
}
