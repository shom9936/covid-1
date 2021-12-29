package com.itbank.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MemberVO {
	private int mem_no;
	private String id;
	private String pwd;
	private String email;
	private String tel;
	private String location;
	
	public MemberVO(int mem_no, String id, String pwd, String email, String tel, String location) {
		this.mem_no = mem_no;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.tel = tel;
		this.location = location;
	}
	
	
}
