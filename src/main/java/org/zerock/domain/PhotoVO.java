package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PhotoVO {

	private int pno;
	private String ptitle, pcontent;
	private Date regdate, updatedate;
	private String src;
	private String mid;
	
}
