package org.zerock.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Test
	public void testCreate() {
		
		ReplyVO vo = new ReplyVO();
		
		IntStream.rangeClosed(1, 10).forEach(i ->{
			vo.setBno(61L);
			vo.setReply(i+"번 댓글입니다");
			vo.setReplyer(i+"번 작성자입니다");
			
			mapper.insert(vo);
		});	
	}
		// Page 384 CRUD 작업 - 조회 테스트
		@Test
		public void testRead() {
			Long targetRno = 4L;
			
			ReplyVO vo = mapper.read(targetRno);
			
			log.info("댓글 : " + vo);
		}


		
		// Page 386 CRUD 작업 - 삭제 테스트
		@Test
		public void testDelete() {
			mapper.delete(2L);
		}

		
		
		// Page 386 CRUD 작업 - 수정 테스트
		@Test
		public void testUpdate() {
			
			ReplyVO vo = mapper.read(21L);
			vo.setReply("Update Reply ");
			int count = mapper.update(vo);
			log.info("업데이트 카운트 : " + count);
			
		}
		

		

		
	}
