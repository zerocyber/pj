package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class GalleryVO {
	
	private int pno;
	private String title, content, fullname, mid;
	private Date regdate, updatedate;
	
}
