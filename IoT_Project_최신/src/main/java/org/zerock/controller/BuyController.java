package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.DogBuy2VO;
import org.zerock.service.DogBuyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class BuyController {
	private DogBuyService dogBuyService;
	
	/* ================================ */
	
	@GetMapping("/dogcart")
	public void dogcart(Model model) {
		//여기에 적어줘야 알림창에 메시지가 보인다.
		//model.addAttribute("cartmessage","이미 담긴 분양강아지입니다");	
		//model.addAttribute("url","'/dogdetail?dno=${dno}'");
		model.addAttribute("dog2List", dogBuyService.dog2List());
	}
	
	@GetMapping("/dogorder")
	 public void buy3Get(Model model) {

	 model.addAttribute("dog2List", dogBuyService.dog2List());
	
	 }
	
	@PostMapping("/dogorder") 
	public String dogorder(DogBuy2VO dog2BuyVO, RedirectAttributes rttr) { 
		 System.out.println("post.............");
	 
		 dogBuyService.dogregister2(dog2BuyVO); return "redirect:/dogmain"; 
	}

	 
	@GetMapping("/dogmain")
	public void mainGet(Model model) {

		 model.addAttribute("dog1List", dogBuyService.dog1List());
	}
	
	
	
		/*
		 * @PostMapping("/remove") public String buy1Delete(@RequestParam("bno") Long
		 * bno, RedirectAttributes rttr) { log.info("삭제완료"+bno);
		 * if(service1.remove(bno)) { rttr.addFlashAttribute("result", "success"); }
		 * return "redirect:/buy1";
		 * 
		 * }
		 */
	 
	 @GetMapping("delete") 
	 public String delete(@RequestParam("dno") Long dno, RedirectAttributes rttr) {
		 dogBuyService.remove(dno); 
		 return "redirect: /dogcart"; 
	 }
	 

	 
}
