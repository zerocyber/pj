package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String mid, mname, mpw, email;
	private Date regdate;
}
