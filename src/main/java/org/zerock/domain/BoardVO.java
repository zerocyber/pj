package org.zerock.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private int bno;
	private String title;
	private String content;
	private Date regdate;
	private Date updatedate;
	private int views;
	private String mid;
	private int kno;
	private int cno;
	private String[] files;
}
