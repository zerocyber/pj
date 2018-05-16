package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService{

	@Setter(onMethod_= {@Autowired})
	private BoardMapper mapper;

	@Override
	public BoardVO read(int bno) {
		// TODO Auto-generated method stub
		return mapper.read(bno);
	}

	@Override
	public List<BoardVO> list() {
		// TODO Auto-generated method stub
		return mapper.list();
	}

	@Override
	public int insert(BoardVO vo) {
		// TODO Auto-generated method stub
		return mapper.insert(vo);
	}

	@Override
	public int modify(BoardVO vo) {
		// TODO Auto-generated method stub
		return mapper.modify(vo);
	}

	@Override
	public int delete(int bno) {
		// TODO Auto-generated method stub
		return mapper.delete(bno);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return mapper.count();
	}
	
	
}
