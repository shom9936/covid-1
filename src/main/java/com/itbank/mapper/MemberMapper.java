package com.itbank.mapper;

import com.itbank.vo.MemberVO;

public interface MemberMapper {
	public MemberVO selectOne(String id);
	public int insertOne(MemberVO vo);
	public String selectID(String id);
	public int memberUpdate(MemberVO vo);
	public int memberDelete(String id);
	public int memberChangePassword(MemberVO vo);
}
