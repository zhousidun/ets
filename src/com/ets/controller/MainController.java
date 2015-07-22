package com.ets.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	//跳转至登陆页面
	@RequestMapping("index")
	public String index(){
		return "index";
	}
	
	//跳转至主页
	@RequestMapping("goHomepage")
	public String goHomepage(){
		return "default";
	}
	
	//注销
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.removeAttribute("loginStudent");
		session.removeAttribute("paperId");
		return "redirect:index.do";
	}
}
