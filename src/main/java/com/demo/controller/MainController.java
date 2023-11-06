package com.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.demo.service.MainService;

@Controller
public class MainController {

	@Autowired
	private MainService mainService;
	
	
	@GetMapping("/main")
	public String main(Model model){
		
		model.addAttribute("list",mainService.recentboardList());
		model.addAttribute("poList", mainService.popularBoardList());
		return "/main";
	}
}
