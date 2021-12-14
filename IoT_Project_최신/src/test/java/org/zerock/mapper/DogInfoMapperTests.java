package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.DogInfoDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class DogInfoMapperTests {

	@Setter(onMethod_ =@Autowired)
	private DogInfoMapper mapper;
	
	@Test
	public void testGetList() {
		
		mapper.getList().forEach(dogInfoDTO -> log.info(dogInfoDTO));
	}
	
	@Test
	public void testInsert() {
		
		DogInfoDTO dog = new DogInfoDTO();
		dog.setAge("5개월");
		dog.setSimple("흰색털을 가짐");
		dog.setWeight(3.0);
		dog.setHealth("종합백신");
		dog.setName("이월이");
		dog.setKind("몰티즈");
		dog.setSex("남(수컷)");
		dog.setName("몰티즈.png");
		dog.setFeature("활동적임");
		dog.setPrice("500000");
		mapper.insert(dog);
		log.info(dog);
	}
	
	
	@Test
	public void testInsertSelectKey() {
		
		DogInfoDTO dog = new DogInfoDTO();
		dog.setAge("8개월");
		dog.setSimple("활동적임");
		dog.setWeight(5.2);
		dog.setHealth("종합백신");
		dog.setName("육월이");
		dog.setKind("시바 이누");
		dog.setSex("여(암컷)");
		dog.setName("몰티즈.png");
		dog.setFeature("활동적임");
		dog.setPrice("800000");
		mapper.insertSelectKey(dog);
		log.info(dog);
	
	}
	
	
	@Test
	public void testRead() {
		
		DogInfoDTO dog = mapper.read(56L);
		log.info(dog);
	}
	
	@Test
	public void testDelete() {
		
		log.info("등록 삭제"+  mapper.delete(55L));
		
	}
	
	@Test
	public void testUpdate() {
		
		//DogInfoDTO dog = new DogInfoDTO();
		DogInfoDTO dog = mapper.read(56L);
		dog.setAge("6살");
		dog.setSimple("수정흰털을가짐");
		
		int count = mapper.update(dog);
		log.info("수정 글수"+count);
	}
}
