package org.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

// Page 210  프레젠테이션(웹) 계층의 CRUD 구현
// BoardController의 작성

@Controller
@Log4j
@RequestMapping("/board/qna/*")
@AllArgsConstructor
public class QnaController {

	private BoardService service;

	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("=== 질문답변 ===");
		model.addAttribute("list", service.getList(cri));
	
		// Page 324 전체 페이지 개수 처리
		int total = service.getTotal(cri);
		log.info("total : " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	
	}
	
	@GetMapping("/register")
	public void qna_register() {
		log.info("=== 질문답변 등록 ===");
	}
	
	@PostMapping("/register")
	public String qna_register(BoardVO board, RedirectAttributes rttr) {
		log.info("=== 질문답변 등록 ===");
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/qna/list?type=qna";
	}
	
	@GetMapping({"/get", "/modify"})
	public void qna_get(@RequestParam("bno") Long bno, Model model) {
		model.addAttribute("board", service.get(bno));
	}

	
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("=== 게시글 수정 ===");
		// 수정 여부 (boolean 값)
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
			
		// Page 350 UriComponentsBuilder
		return "redirect:/board/qna/list" + cri.getListLink();
		
	}

	
	// Page 220 삭제 처리와 테스트
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("=== 게시글 삭제 ===");
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		// Page 350 UriComponentsBuilder
		return "redirect:/board/qna/list" + cri.getListLink();
		
	}
	
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
		log.info("GET ATTACH LIST : " + bno);
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	
	// Page 581 파일 삭제 처리
	private void deleteFiles(List<BoardAttachVO> attachList) {
			
		if(attachList == null || attachList.size() == 0) {
			return;
		}
			
		log.info("DELETE ATTACH FILES...........");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\"+attach.getUuid().substring(0, 6)+"_"+attach.getFileName());
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_"+attach.getUuid().substring(0, 6)+"_"+attach.getFileName());
					Files.delete(thumbNail);
				}
			}
			catch(Exception e) {
				log.error("DELETE FILE ERROR" + e.getMessage());
			}
		});
		
	}
	

}
