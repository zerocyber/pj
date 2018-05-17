package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyMapper {
	
	public void inset(ReplyVO vo);
	
	public List<ReplyVO> list(int bno, Criteria cri);
	
	public void update(ReplyVO vo);
	
	public void delete(int rno);
	
	public int count(int bno, Criteria cri);

}
