package com.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class loginController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() throws Exception {
		return "login";
	}
	

}

