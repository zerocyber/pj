package org.zerock.domain;

import lombok.Data;
import lombok.Getter;


@Data
public class Criteria {
	
	private int page;
	private int perPageNum;
	
	private String type;
	private String keyword;
	
	
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
		this.type = "";
		this.keyword = "";
	}
	
	
	
	
	public void setPage(int page) {
		if(page <= 0) {
			return;
		}else {
			this.page = page;
		}
	}
	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum < 10 || perPageNum > 50) {
			return;
		}else {
			this.perPageNum = perPageNum;
		}
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public int getPageStart() {
		return (this.page-1) * perPageNum;
				
	}
}
