package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardService {
	
	public BoardVO read(int bno);
	
	public List<BoardVO> list();
		
	public int insert(BoardVO vo);
	
	public int modify(BoardVO vo);
	
	public int delete(int bno);
	
	public int count();
}
