package com.itbank.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String tel;
	private String location;
	
	public MemberVO(String id, String pwd, String name, String email, String tel, String location) {
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.tel = tel;
		this.location = location;
	}
	
	public MemberVO() {}
	
	
}
