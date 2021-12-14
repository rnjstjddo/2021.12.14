package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.DogBuy2VO;
import org.zerock.domain.DogBuyVO;
import org.zerock.domain.DogInfoDTO;
import org.zerock.mapper.DogInfoMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class DogInfoServiceImp implements DogInfoService {
	
	
	private DogInfoMapper mapper;
	
	
	@Override
	public DogInfoDTO get(Long dno) {
		log.info("ServiceImp 클래스의 get() 메소드");
		return mapper.read(dno);
	}



	@Override
	public void register(DogInfoDTO doginfoDTO) {
		
		//mapper.insert(dogInfoDTO);
		log.info(doginfoDTO);
		log.info("DogInfoServiceImp register() 메소드");
		mapper.insertSelectKey(doginfoDTO);
	}



	@Override
	public boolean modify(DogInfoDTO dogInfoDTO) {
		log.info("ServiceImp 클래스의 modify() 메소드");
		return mapper.update(dogInfoDTO) ==1;
	}



	@Override
	public boolean remove(Long dno) {
		log.info("ServiceImp 메소드의 remove() 메소드");
		return mapper.delete(dno)==1;
	}



	@Override
	public List<DogInfoDTO> getList() {
		
		log.info("ServiceImp 클래스의 getList() 메소드");
		return mapper.getList();
	}

	
	
}
