package com.ets.dao.impl;

import java.util.List;

import org.hibernate.*;
import org.springframework.stereotype.Repository;

import com.ets.dao.StudentDao;
import com.ets.entity.Student;
@Repository
public class StudentDaoImpl extends BaseDaoImpl implements StudentDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Student> getAll() {
		String hql="from Student";
		return getSession().createQuery(hql).list();
	}

	@Override
	public Student checkLogin(String name, String pwd) {
		Session session=getSession();
		String hql="from Student where id=:id and pwd=:pwd";
		Query query=session.createQuery(hql);
		query.setString("id", name);
		query.setString("pwd", pwd);
	
		Student student=(Student) query.uniqueResult();
		return student;
	}

}
