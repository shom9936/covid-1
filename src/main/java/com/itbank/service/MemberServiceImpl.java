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
		Integer result = mapper.selectID(id);
		if(result.equals(null)) {
			return 0;
		} else {
			return 1;
		}
	}
}
