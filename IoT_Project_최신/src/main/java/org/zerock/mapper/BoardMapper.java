package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

// PAGE 184 Mapper인터페이스와 Mapper XML
public interface BoardMapper {

//	XML에 SQL문이 처리되었으니 SQL문 주석
//	@Select("select * from tbl_board where bno>0")
	public List<BoardVO> getList();
	
	// Page 294 
	public List<BoardVO> getListWithPaging(Criteria cri);

	// PAGE 189 create(insert) 처리
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	// PAGE 193 real(select) 처리
	public BoardVO read(Long bno);
	
	// Page 194 delete 처리
	public int delete(Long bno);
	
	// Page 196 update 처리
	public int update(BoardVO board);
	
	// Page 322 MyBatis에서 전체 데이터의 개수 처리
	public int getTotalCount(Criteria cri);
	
	// 조회수 update
	public void updateViewCnt(Long bno);
	
	// 댓글수 update
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
}
