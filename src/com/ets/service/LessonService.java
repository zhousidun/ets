package com.ets.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.ets.dao.*;
import com.ets.entity.*;
import java.util.*;
@Service
public class LessonService {
	@Resource
	private LessonDao dao;
	public List<Lesson> getAllLessons(){
		return dao.getAll();
	}
	
	public Lesson getLesson(int id){
		return dao.getLessonById(id);
	}
}
