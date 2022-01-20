package com.itbank.service;

import com.itbank.vo.MemberVO;

public interface MemberService {
	public MemberVO login(MemberVO vo);
	public int join(MemberVO vo);
	public int checkID(String id);
	public int memberUpdate(MemberVO vo);
	public MemberVO getInfo(String id);
	public int memberDelete(String id);
	public MemberVO memberFindPassword(String id);
	public int memberChangePassword(MemberVO vo);
}
