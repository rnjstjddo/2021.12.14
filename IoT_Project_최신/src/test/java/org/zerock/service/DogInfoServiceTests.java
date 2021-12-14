package org.zerock.service;

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
public class DogInfoServiceTests {
	
	@Setter(onMethod_ =@Autowired)
	public DogInfoService service;
	
	@Test
	public void testExist() {
		
		log.info(service);
	}
	
	@Test
	public void testRegister() {
		
		DogInfoDTO dog = new DogInfoDTO();
		dog.setAge("8개월");
		dog.setSimple("활동적임");
		dog.setWeight(5.0);
		dog.setHealth("종합백신");
		dog.setName("구월이");
		dog.setKind("골든리트리버");
		dog.setSex("남(수컷)");
		dog.setName("골든리트리버.png");
		dog.setFeature("주인을 잘따름");
		dog.setPrice("500000");
		
		
		service.register(dog);
		log.info("분양등록번호"+dog.getDno());
	}
	
	
	@Test
	public void testGetList() {
		service.getList().forEach(dog -> log.info(dog));
		
	}
	
	@Test
	public void testGet() {
		log.info(service.get(51L));
		
	}
	
	@Test
	public void testDelete() {
		
		log.info("ServiceTests클래스의 testDelete() 메소드"+ service.remove(51L));
	}
	
	@Test
	public void testUpdate() {
		
		DogInfoDTO dog = service.get(60L);
		
		if(dog ==null) return;
		
		dog.setSimple("수정갈색털을가짐");
		log.info("ServiceTests클래스의 testUpdate() 메소드"+service.modify(dog));
	}
	
}
