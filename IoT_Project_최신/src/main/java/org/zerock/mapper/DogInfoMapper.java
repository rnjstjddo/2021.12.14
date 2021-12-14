package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.DogInfoDTO;

public interface DogInfoMapper {

	public void insert(DogInfoDTO dogInfoDTO);
	
	//@Select("select *from doginfo where dno>0")
	public List<DogInfoDTO> getList();
	
	public void insertSelectKey(DogInfoDTO dogInfoDTO);
	
	public DogInfoDTO read(Long dno);
	
	public int delete(Long dno);
	
	public int update(DogInfoDTO dogInfoDTO);
	
}
