package com.ets.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ets.service.*;
import com.ets.entity.*;
import java.util.*;


import javax.annotation.Resource;
import javax.servlet.http.*;
@Controller
@RequestMapping("student")
public class StudentController {
	@Resource
	private StudentService sService;
	@RequestMapping("list")
	public String getAllStudent(ModelMap model){
		List<Student> students=sService.getAllStudent();
		model.put("students", students);
		return "list";
	}
	
	@RequestMapping("login")
	public String login(HttpServletRequest req,ModelMap model){
		String name=req.getParameter("name");
		String pwd=req.getParameter("pwd");
		Student student=sService.checkLogin(name,pwd);
	
		if(student==null){
			String info="用户名或密码错误！";
			String url="../index.jsp";
			model.put("info", info);
			model.put("url", url);
			return "result";
		}
		HttpSession session=req.getSession();
		session.setAttribute("loginStudent", student);
		return "default";
	}
	
	@RequestMapping("examRule")
	public String examRule(){
		return "examRule";
	}
}
