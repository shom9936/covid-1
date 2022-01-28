package com.itbank.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	private Long no, cnt;
	private String title, content, writer, boardvalues;
	private Date regdate;
}
