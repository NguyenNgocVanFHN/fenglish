package vn.framgia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class IndexController {
	
	@RequestMapping(value = {"/", "home"}, method = RequestMethod.GET)
	public String hello() {
		return "/client/index";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String showLogin() {
		return "/client/login";
	}
}
