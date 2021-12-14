package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.DogBuy2VO;
import org.zerock.domain.DogBuyVO;
import org.zerock.domain.DogInfoDTO;

public interface DogBuyMapper {

	public List<DogInfoDTO> dog1List();
	public List<DogBuyVO> dog2List();

	//상세페이지에서 장바구니담기 dno 번호를 detail에서 받아와서 Controller 로 이동
	public void cartinsert2(Long dno);
	
	//상세페이지에서 장바구니담기 dno 번호를 detail에서 받아와서 Controller 로 이동
	//public void cartinsert();
	
	
	public Integer doginsert(DogBuy2VO dog2BuyVO);
	

	public void insert(DogBuyVO dog1List);

	public DogBuyVO read(Long bno);

	public int delete(Long bno);

	public int update(DogBuyVO dog1List);
	
	
	public Long getdno();

}
