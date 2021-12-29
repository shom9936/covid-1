package com.itbank.service;

import org.springframework.stereotype.Service;

import com.itbank.mapper.MemberMapper;
import com.itbank.vo.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
	private final MemberMapper mapper;
	
	@Override
	public MemberVO login(MemberVO vo) {
		MemberVO memberVO = mapper.selectOne(vo);
		if(memberVO != null) return memberVO;
		else return null;
	}
	
	@Override
	public int join(MemberVO vo) {
		return mapper.insertOne(vo);
	}
}
