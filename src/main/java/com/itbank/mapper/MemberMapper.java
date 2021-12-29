package com.itbank.mapper;

import com.itbank.vo.MemberVO;

public interface MemberMapper {
	public MemberVO selectOne(String id);
	public int insertOne(MemberVO vo);
	
}
