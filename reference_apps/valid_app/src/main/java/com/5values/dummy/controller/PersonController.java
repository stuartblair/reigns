package com._5values.dummy.controller;

import com._5values.dummy.model.Person;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestBody; 
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
    @RequestMapping("/person")
    public class PersonController {
	
	@RequestMapping(method = RequestMethod.POST, value = "echo")
	    @ResponseBody
	    public Person echo(@RequestBody final Person request) {
	    return request;
	}
    }