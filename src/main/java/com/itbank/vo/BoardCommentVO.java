package com.itbank.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardCommentVO {

	private int no;
	private String id,content,comment_cnt;
	private Date logtime;
	
}
