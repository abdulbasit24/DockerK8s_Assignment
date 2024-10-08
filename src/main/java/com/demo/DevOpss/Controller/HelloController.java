package com.demo.DevOpss.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

	@GetMapping("/hello")
	public String hello() {
		return "This is a demo project demonstrating a GET request from a Docker container."; 
	}
}
