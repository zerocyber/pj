package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
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
	public List<BoardVO> pageList(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.list(cri);
	}

	@Override
	public void write(BoardVO vo) {
		// TODO Auto-generated method stub
		mapper.insert(vo);
		if(!vo.getFiles().isEmpty()) {
			mapper.addFile(vo);	
		}
	}

	@Override
	public int modify(BoardVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int remove(int bno) {
		// TODO Auto-generated method stub
		return mapper.delete(bno);
	}

	@Override
	public int count(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.count(cri);
	}

	@Override
	public List<BoardVO> searchList(Criteria cri) {

		return mapper.searchList(cri);
	}

	@Override
	public int addFile(BoardVO vo) {
		
		return mapper.addFile(vo);
		
	}

	
	
	
	
	
}
