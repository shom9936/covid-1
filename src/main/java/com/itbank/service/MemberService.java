package com.itbank.service;

import com.itbank.vo.MemberVO;

public interface MemberService {
	public MemberVO login(MemberVO vo);
	public int join(MemberVO vo);
	public int checkID(String id);
}
