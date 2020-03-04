package com.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.board.service.FileUploadService;
import com.board.service.ManagementService;

@Controller
@RequestMapping("/fileupload/*")
public class FileUploadController {
	
	@Autowired
	FileUploadService fileUploadService;
	
	@Autowired
	ManagementService MGService;
	
	@RequestMapping(value ="/form" , method = RequestMethod.GET)
	public void form() {
		System.out.println("call form");
		
	}
	
	@RequestMapping(value ="/filedown" , method = RequestMethod.GET)
	public void filedown() {
		System.out.println("call filedown");	
	}
	
	@RequestMapping(value ="/filedelete" , method = RequestMethod.GET)
	public void filedelete(@RequestParam("name") String name) throws Exception {
		
		MGService.filedelete(name);
		System.out.println("call filedelete");	
	}
	
	@RequestMapping(value = "/upload" , method = RequestMethod.POST)
	public String upload(
			Model model,
			/* @RequestParam("email") String email, */
			@RequestParam("file1") MultipartFile file) throws Exception {
		System.out.println("call upload");
		System.out.println(file);
		String url = fileUploadService.restore(file);
		System.out.println(url);
		model.addAttribute("url", url);
		/* return "result"; */
		return "/fileupload/result";
	}
}