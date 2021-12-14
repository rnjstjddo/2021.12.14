package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyMapper {

	// Page 382 CRUD 작업 - 등록
	public int insert(ReplyVO vo);
	
	// Page 384 CRUD 작업 - 조회
	public ReplyVO read(Long rno);
	
	// Page 386 CRUD 작업 - 삭제
	public int delete (Long rno);
	
	// Page 386 CRUD 작업 - 수정
	public int update(ReplyVO reply);
	
	// Page 387 @Param 어노테이션과 댓글 목록
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
	
	
	// Page 432 댓글의 숫자 파악
	public int getCountByBno(Long bno);
	
	public ReplyVO read2(Long bno);
	
	public int delete2(Long bno);
	
}
