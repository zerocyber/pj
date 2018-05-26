package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
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
	
	@Transactional
	@Override
	public void write(BoardVO vo)throws Exception{
		mapper.insert(vo);
		if(vo.getFiles() != null) {
		mapper.addFile(vo);	
		}
	}
	@Transactional
	@Override
	public int modify(BoardVO vo) {
		if(vo.getFiles() != null) {
			mapper.modiFile(vo);
		}
		return mapper.update(vo);
	}

	@Override
	public int remove(int bno) {
		mapper.removeFile(bno);
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
	// 파일 추가 sql
	@Override
	public int addFile(BoardVO vo) {
		return mapper.addFile(vo);
	}

	@Override
	public int viewCnt(int bno) {
		return mapper.addViews(bno);
	}

	// 파일 삭제 sql
	@Override
	public int removeFile(int bno) {
		return mapper.removeFile(bno);
	}
	// 파일 조회 sql
	@Override
	public String[] searchFile(int bno) {
		return mapper.searchFile(bno);
	}
	// 글 수정 시 파일 삭제 
	@Override
	public int removeFiles(String[] deleteFiles) {
		return mapper.removeFiles(deleteFiles);
	}
	// 글 수정 시 파일 등록 
	@Override
	public int modiFile(BoardVO vo) {		
		return mapper.modiFile(vo);
	}
	
	
	
	
}
