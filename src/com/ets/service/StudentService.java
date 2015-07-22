package com.ets.service;

import com.ets.entity.*;

import org.springframework.stereotype.Service;
import com.ets.dao.*;
import java.util.*;

import javax.annotation.Resource;
@Service
public class StudentService {
	@Resource
	private StudentDao dao;

	public List<Student> getAllStudent(){
	
		return dao.getAll();
	}

	public Student checkLogin(String name, String pwd) {
		return dao.checkLogin(name,pwd);
	}
	
	public void update(Student student){
		dao.update(student);
	}
	
	public Student getStudentById(String id){
		return dao.getStudent(id);
	}
}
