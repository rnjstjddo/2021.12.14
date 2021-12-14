package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/joinForm")
	public void joinForm() {
		log.info("joinForm 진입");
	}
	
	@GetMapping("/join")
	public String join(MemberVO member,AuthVO vo) {
		
		log.info("goto join"+member);
		service.joinMember(member,vo);
		log.info("success join");
		
		return"/home";
	}
	
	@PostMapping("/join")
	public String join1(MemberVO member,AuthVO vo, RedirectAttributes rttr) {
		
		log.info("goto join"+member);
		service.joinMember(member, vo);
		log.info("success join");
		
		return "redirect:/";
	}

	@GetMapping("/all")
	public void doAll() {
		log.info("전체 접근");
	}
	
	@GetMapping("/member")
	public void doMember() {
		log.info("멤버 접근");
	}
	
	@GetMapping("/admin")
	public void doAdmin() {
		log.info("관리자 접근");
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
	@GetMapping("/annoMember")
	public void doMember2() {
		log.info("logined annotation member");
	}
	
	@Secured({"ROLE_ADMIN"})
	@GetMapping("/annoAdmin")
	public void doAdmin2() {
		log.info("admin annotation only");
	}
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth,Model model) {
		log.info("access Denied:"+auth);
		model.addAttribute("msg","접근 제한됨");
	}
	
	@GetMapping("/customLogin")
	public void loginInput(String error,String logout,Model model) {
		log.info("error:"+error);
		log.info("logout:"+logout);
		
		if(error!=null) {
			model.addAttribute("error","Login Error Check Your Account");
		}
		if(logout!=null) {
			model.addAttribute("logout","Logout!!!");
		}
	}
	
	@GetMapping("/customLogout")
	public void loginGET(String error,String logout) {
		log.info("custom logout");

	}
	
}
