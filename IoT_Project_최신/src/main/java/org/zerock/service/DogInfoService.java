package org.zerock.service;

import java.util.List;

import org.zerock.domain.DogInfoDTO;


public interface DogInfoService {

	public void register(DogInfoDTO dogInfoDTO);
	
	public DogInfoDTO get(Long dno);
	
	public boolean modify(DogInfoDTO dogInfoDTO);
	
	public boolean remove(Long dno);
	
	public List<DogInfoDTO> getList();
	
}
