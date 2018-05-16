package org.zerock.mapper;

import java.util.List;


import org.zerock.domain.BoardVO;


public interface BoardMapper {

	public List<BoardVO> list();
	
	public void read(int bno);
	
	public int insert(BoardVO vo);
	
	public int momdify(BoardVO vo);
	
	public int delete(int bno);
	
	public int count();
}
