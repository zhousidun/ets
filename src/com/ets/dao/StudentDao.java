package com.ets.dao;
import com.ets.entity.*;

import java.util.*;
public interface StudentDao {
	public List<Student> getAll();
	public Student checkLogin(String name, String pwd);
}
