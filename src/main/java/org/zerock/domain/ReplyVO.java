package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private int rno;
	private String rcontent;
	private Date regdate, updatedate;
	private String mid;
	private int bno;
	
}
