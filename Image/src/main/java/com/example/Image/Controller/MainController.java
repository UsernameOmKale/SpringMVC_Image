 package com.example.Image.Controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.Image.Dao.MainDao;
import com.example.Image.Entity.MainEntity;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.RequestParam;




@Controller
public class MainController {
	
	@Autowired
	MainDao mainDao;
	
	@GetMapping("/index")
	public String index() {
		return "reg";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/home")
	public String home() {
		return "home";
	}
	
	@GetMapping("/exit")
	public String Exit() {
		return "reg";
	}
	
	
	@PostMapping("/saveData")
	public String saveData(@ModelAttribute MainEntity mainEntity,MultipartFile imageFile,Model model) {
	
		try {
			mainDao.saveData(mainEntity,imageFile);
			model.addAttribute("model","Data Saved Successfully..!!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "reg";
	}
	
	
	@GetMapping("/checkLogin")
	public String checkLogin(@RequestParam String username,@RequestParam String password,Model model) {
		MainEntity mainEntity = mainDao.login(username,password);
		if(mainEntity != null) {
			model.addAttribute("model",mainEntity);
			return "home";
		}
		else {
		model.addAttribute("model","login failed...!!");
		return "login";
		}
	}
	

}
