package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardService {
	
	public BoardVO read(int bno);
	
	public List<BoardVO> pageList(Criteria cri);
		
	public void write(BoardVO vo);
	
	public int modify(BoardVO vo);
	
	public int remove(int bno);
	
	public int count(Criteria cri);
	
	public List<BoardVO> searchList(Criteria cri);
	
<<<<<<< HEAD
	public int viewCnt(int bno);

	public int addFile(BoardVO vo);

=======
	public int addFile(BoardVO vo);
	
	public int viewCnt(int bno);

	public int removeFile(int bno);
	
	public BoardVO searchFile(int bno);
>>>>>>> 980a2346bc00ed3c1c65c47fbfb3776fa7785fe9
}
