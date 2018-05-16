package org.zerock.mapper;

import java.util.List;


import org.zerock.domain.BoardVO;


public interface BoardMapper {

	public List<BoardVO> list();
	
	public BoardVO read(int bno);
	
	public int insert(BoardVO vo);
	
	public int update(BoardVO vo);
	
	public int delete(int bno);
	
	public int count();
}
