package org.zerock.utils;


import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Data
public class PUCreate {
	
	public String URICre(String path) {
		UriComponents builder = UriComponentsBuilder.newInstance().path(path)
				.queryParam("type", "${pm.cri.type")
				.queryParam("keyword", "${pm.cri.keyword")
				.queryParam("page", "${pm.cri.page}")
				.queryParam("perPageNum", "${pm.cri.perPageNum")
				.build();
		
		return builder.toString();
	}


}
