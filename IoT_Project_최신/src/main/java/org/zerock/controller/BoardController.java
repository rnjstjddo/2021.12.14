package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.zerock.domain.Criteria;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
/* @RequestMapping("/board/*") */
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;

	@GetMapping({"/board", "/board/list"})
	public void board() {
		log.info("=== Board ===");
		
	//	return "/board";
	}

	/*
	@GetMapping("/home1")
	public void noticeSend(Model model) {
		model.addAttribute("list", service.getList());
	}
	*/

}
