package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String mid, mpw, mname, email;
	private String sessionKey;
	private Date sessionLimit;
	private Date regdate;
}
