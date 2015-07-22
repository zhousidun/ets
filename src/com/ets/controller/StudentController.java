package com.ets.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ets.service.*;
import com.ets.util.TimeUtil;
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
	
	//验证登录信息
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
	
	//显示考试规则
	@RequestMapping("examRule")
	public String examRule(){
		return "examRule";
	}
	
	//进入修改个人资料的压面
	@RequestMapping("modifyProfile")
	public String modifyProfile(HttpSession session,ModelMap model){
		Student student=(Student) session.getAttribute("loginStudent");
		if(student==null)
			return "redirect:../index.do";
		model.put("student", student);
		return "modifyProfile";
	}
	
	//更新个人资料
	@RequestMapping("updateProfile")
	public String updateProfile(Student student,ModelMap model,HttpSession session){
		student.setJoinTime(TimeUtil.getTime());
		session.setAttribute("loginStudent", student);
		sService.update(student);
		String info="修改资料成功！";
		String url="../goHomepage.do";
		model.put("info", info);
		model.put("url", url);
		return "result";
	}
}
