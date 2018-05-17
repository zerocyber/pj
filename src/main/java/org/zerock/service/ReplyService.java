package org.zerock.service;

import java.util.List;
import java.util.Map;

import org.zerock.domain.ReplyVO;

public interface ReplyService {
	
	public void register(ReplyVO vo);
	
	public List<ReplyVO> listReplies(Map<String,Object> map);
	
	public void modify(ReplyVO vo);
	
	public void remove(int rno);
	
	public int count(int bno);
	
	public ReplyVO read(int rno);

}
