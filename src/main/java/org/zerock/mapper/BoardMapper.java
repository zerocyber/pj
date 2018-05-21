package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;


public interface BoardMapper {

	public List<BoardVO> list(Criteria cri);
	
	public BoardVO read(int bno);
	
	public int insert(BoardVO vo);
	
	public int update(BoardVO vo);
	
	public int delete(int bno);
	
	public int count(Criteria cri);
	
	public List<BoardVO> searchList(Criteria cri);
	
<<<<<<< HEAD
	public int addFile(String fullname);
	
	public int addViews(int bno);
	
=======
	public int addFile(BoardVO vo);
>>>>>>> 3e5051165ec9400cce03e32cd4507699955b8447
	
}
