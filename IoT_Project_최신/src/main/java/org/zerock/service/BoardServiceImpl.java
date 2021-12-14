package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.BoardAttachMapper;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service

public class BoardServiceImpl implements BoardService{

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper replyMapper;
	
	
	// PAGE 204 등록 작업의 구현과 테스트
	@Transactional
	@Override
	public void register(BoardVO board) {
	
		mapper.insertSelectKey(board);
		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			log.info("board : " + board);
			return;
		}
		
		board.getAttachList().forEach(attach ->{
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}

	// PAGE 207 조회 작업의 구현과 테스트
	@Override
	public BoardVO get(Long bno) {
		mapper.updateViewCnt(bno);
		return mapper.read(bno);
	}

	// PAGE 208 삭제/수정 구현과 테스트
	@Transactional
	@Override
	public boolean modify(BoardVO board) {
	
		attachMapper.deleteAll(board.getBno());
		boolean modifyResult = mapper.update(board) == 1;
		
		if(modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0 ) {
			board.getAttachList().forEach(attach -> {
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}
		return modifyResult;
	}

	@Transactional
	@Override
	public boolean remove(Long bno) {

		replyMapper.delete2(bno);
		attachMapper.deleteAll(bno);
		
		return mapper.delete(bno) == 1;
	}
	
	@Override
	public List<BoardVO> getList(){
		return mapper.getList();
	}

	// Page 299 
	@Override
	public List<BoardVO> getList(Criteria cri){
		
		return mapper.getListWithPaging(cri);
	}
	
	
	// Page 323
	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotalCount(cri);
	}

	@Override
	public void updateViewCnt(Long bno) {
			
		mapper.updateViewCnt(bno);
	}


	@Override
	public List<BoardAttachVO> getAttachList(Long bno){
		
		return attachMapper.findByBno(bno);
	}

	
	
}
