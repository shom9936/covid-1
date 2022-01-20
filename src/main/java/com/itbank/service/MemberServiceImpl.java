package com.itbank.service;

import org.mindrot.jbcrypt.BCrypt;
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
		MemberVO memberVO = mapper.selectOne(vo.getId());
		if(memberVO == null) return null;
		else {
			if(BCrypt.checkpw(vo.getPwd(), memberVO.getPwd())) {
				return memberVO;
			} else {
				return null;
			}
		}
	}
	
	@Override
	public int join(MemberVO vo) {
		return mapper.insertOne(vo);
	}
	
	@Override
	public int checkID(String id) {
		String result = mapper.selectID(id);
		if(result == null) {
			return 0;
		} else {
			return 1;
		}
	}
	
	@Override
	public int memberUpdate(MemberVO vo) {
		int result = mapper.memberUpdate(vo);
		return result;
	}
	
	@Override
	public MemberVO getInfo(String id) {
		return mapper.selectOne(id);
	}
	
	@Override
	public int memberDelete(String id) {
		return mapper.memberDelete(id);
	}
	
	@Override
	public MemberVO memberFindPassword(String id) {
		MemberVO memberVO = mapper.selectOne(id);
		if(memberVO == null) return null;
		else {
			return memberVO;
		}
	}
	
	@Override
	public int memberChangePassword(MemberVO vo) {
		return mapper.memberChangePassword(vo);
	}
}
