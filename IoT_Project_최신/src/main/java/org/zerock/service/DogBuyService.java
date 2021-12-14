package org.zerock.service;

import java.util.List;

import org.zerock.domain.DogBuy2VO;
import org.zerock.domain.DogBuyVO;
import org.zerock.domain.DogInfoDTO;

public interface DogBuyService {
	
	
	//상세페이지에서 장바구니담기 dno 번호를 detail에서 받아와서 Controller 로 이동
	public void cartregister(Long dno);
	
	//상세페이지에서 장바구니담기 dno 번호를 detail에서 받아와서 Controller 로 이동
	public DogBuyVO cartregister2(Long dno);
		
	
	public void dogregister2(DogBuy2VO dog2BuyVO);

	public List<DogInfoDTO> dog1List();
	public List<DogBuyVO> dog2List();


	
	public DogBuyVO get(Long bno);

	public boolean modify(DogBuyVO dog1List);

	public boolean remove(Long dno);
	
	
	public Long getdno();

}
