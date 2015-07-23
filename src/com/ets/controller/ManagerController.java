package com.ets.controller;

import javax.annotation.Resource;
import javax.servlet.http.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ets.entity.*;
import com.ets.service.*;
@Controller
@RequestMapping("manage")
public class ManagerController {
	@Resource
	private ManagerService mService;
	
	//跳转至管理员登录界面
	@RequestMapping("goLogin")
	public String goIndex(){
		return "manage/login";
	}
	
	//验证登录信息
	@RequestMapping("login")
	public String login(HttpServletRequest req,ModelMap model){
		String name=req.getParameter("name");
		String pwd=req.getParameter("pwd");
		Manager manager=mService.checkLogin(name, pwd);
		String info=null;
		String url=null;
		if(manager==null){
			info="用户名或密码错误！";
			url="goLogin.do";
		}			
		else{
			req.getSession().setAttribute("loginManager", manager);
			info="登录成功";
			url="main.jsp";
		}
		
		model.addAttribute("info", info);
		model.addAttribute("url", url);
		return "manage/main";
	}
}
