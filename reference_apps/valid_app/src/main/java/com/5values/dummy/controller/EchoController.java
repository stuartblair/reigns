package com._5values.dummy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
    @RequestMapping("/echo")
    public class EchoController {
	
	@RequestMapping(method = RequestMethod.GET)
	    public String get(ModelMap model) {
	    return printWelcome(model);
	}
	
	@RequestMapping(method = RequestMethod.PUT)
	    public String put(ModelMap model) {
	    return printWelcome(model);
	}
	
	@RequestMapping(method = RequestMethod.POST)
	    public String post(ModelMap model) {
	    return printWelcome(model);
	}
	
	@RequestMapping(method = RequestMethod.DELETE)
	    public String delete(ModelMap model) {
	    return printWelcome(model);
	}
	
	public String printWelcome(ModelMap model) {   
	    model.addAttribute("message", "Spring 3 MVC Hello World");
	    return "echo";
	}
    }