package org.zerock.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_= {@Autowired})
	private ReplyMapper mapper;
	
	
	@Override
	public void register(ReplyVO vo) {
		mapper.insert(vo);
		
	}

	@Override
	public List<ReplyVO> listReplies(Map<String, Object> map) {
		
		return mapper.list(map);
	}

	@Override
	public void modify(ReplyVO vo) {
		mapper.update(vo);
		
	}

	@Override
	public void remove(int rno) {
		mapper.delete(rno);
		
	}

	@Override
	public int count(int bno) {
		
		return mapper.count(bno);
	}

	@Override
	public ReplyVO read(int rno) {
		
		return mapper.read(rno); 
	}

	
	
	
	
}
