package com.ets.dao;
import java.util.*;
import com.ets.entity.*;
public interface LessonDao {
	public List<Lesson> getAll();
	public Lesson getLessonById(int id);
}
