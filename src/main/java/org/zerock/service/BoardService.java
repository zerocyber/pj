package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardService {
	
	public BoardVO read(int bno);
	
	public List<BoardVO> pageList();
		
	public int write(BoardVO vo);
	
	public int modify(BoardVO vo);
	
	public int remove(int bno);
	
	public int count();
}
