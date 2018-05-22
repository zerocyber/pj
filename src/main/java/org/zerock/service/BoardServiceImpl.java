package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
		return mapper.read(bno);
	}

	@Override
	public List<BoardVO> pageList(Criteria cri) {
		return mapper.list(cri);
	}

	@Override
	public void write(BoardVO vo) {
		mapper.insert(vo);
		if(vo.getFile().size() > 0) {
			mapper.addFile(vo);	
		}
	}

	@Override
	public int modify(BoardVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int remove(int bno) {
		return mapper.delete(bno);
	}

	@Override
	public int count(Criteria cri) {
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

	@Override
	public int viewCnt(int bno) {
		return mapper.addViews(bno);
	}
	
	

	
	
	
	
	
}
