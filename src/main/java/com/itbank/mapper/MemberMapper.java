package com.itbank.mapper;

import com.itbank.vo.MemberVO;

public interface MemberMapper {
	public MemberVO selectOne(MemberVO vo);
	public int insertOne(MemberVO vo);
	
}
