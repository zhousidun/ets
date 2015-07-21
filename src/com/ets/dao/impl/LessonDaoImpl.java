package com.ets.dao.impl;

import java.util.List;

import org.hibernate.*;
import org.springframework.stereotype.Repository;

import com.ets.dao.LessonDao;
import com.ets.entity.*;
@Repository
public class LessonDaoImpl extends BaseDaoImpl implements LessonDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Lesson> getAll() {
		Session session=this.getSession();
		String hql="from Lesson";
		return session.createQuery(hql).list();
	}

	@Override
	public Lesson getLessonById(int id) {
		String hql="from Lesson where id="+id;
		return (Lesson) getSession().createQuery(hql).uniqueResult();
	}

}
